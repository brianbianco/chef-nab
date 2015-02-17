actions :download

default_action :download

attribute :uris, :kind_of => [String,Array]
attribute :destination, :kind_of => String, :default => Chef::Config[:file_cache_path]
attribute :write_adapter, :kind_of => String, :default => 'file'
attribute :strip_dirs, :kind_of => [TrueClass,FalseClass], :default => false

