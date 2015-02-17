require 'uri'
require 'ostruct'

action :download do
  # This is necessary so that the nab gem isn't required before chef has
  # had the opportunity to install it.
  require 'nab'
  Chef::Log.info "nab #{new_resource.name}"

  uris = Array(new_resource.uris)
  Chef::Log.info "Nabing #{uris}"

  uris.select! do |u|
   uri         = URI(u)
   path        = Nab::Util.path_from_uri(uri,new_resource.strip_dirs)
   local_asset = ::File.join(new_resource.destination,path)
   ! ::File.exists?(local_asset)
  end

  unless uris.empty?
    options                 = OpenStruct.new
    options.strip_dirs      = new_resource.strip_dirs
    options.write_adapter   = Nab.const_get("#{new_resource.write_adapter.capitalize}Writer")
    options.destination_dir = new_resource.destination
    options.log_level       = Logger::WARN
    Nab::Client.new.run(uris,options)
    new_resource.updated_by_last_action(true)
  end
end
