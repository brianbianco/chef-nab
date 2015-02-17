
Description
===========

This cookbook installs the nab gem and allows you to use the nab as a chef
resource.

It does not currently provide a way to configure the AWS sdk.  It expects the
credentials to either be set in the environment for the Chef run, or more likely
for the server to have an AWS server role with the proper permissions.


Nab defaults to download to the Chef::Config[:file_cache_path] directory

Website:: https://github.com/brianbianco/chef-nab

Usage
=====

Since the nab gem is necessary for the LWRPs to work, the cookbook will try to
install the gem by default.

```ruby
node['nab']['installs']['gem']      = true
node['nab']['installs']['chef_gem'] = true
node['nab']['installs']['version']  = nil # Accepts a string version to install
```

The cookbook also provides a "nab_get" resource for using nab to download files.

The following resource attributes are available
```
uris - A string or array of URIs to download
destination - A destination directory (defaults to the chef cache directory)
strip_dirs - A boolean to determine if it should strip leading paths when downloading
             (E.G. s3://foo/bar.txt will download to destination dir as bar.txt)

```

nab_get resource Examples:
--------

```ruby
nab_get "One file" do
  uris 's3://my-bucket/foo.txt'
end
```

```ruby
nab_get "Multiple files" do
  uris(['s3://my-bucket/foo.txt',
        's3://my-bucket-2/bar.zip'])
  strip_dirs true
  destination '/tmp'
end
```

License
=======

Please see licensing information in: [LICENSE](LICENSE)
