#tf2_server

####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with tf2_server](#setup)
    * [What tf2_server affects](#what-tf2_server-affects)
    * [Beginning with concat](#beginning-with-tf2_server)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Known issues](#known-issues)
7. [TODO and Hopes for the Future](#todo-and-hopes-for-the-future)

##Overview

This module allows you to install, configure, and manage a dedicated server
for Team Fortress 2.

##Module Description

This module lets you use the `tf2_server` class, which will automatically install
and manage a TF2 Dedicated Server with its necessary configuration files and allow
it to be managed as a service.

##Setup

###What tf2_server affects

* Installs a TF2 Dedicated Server into
  a directory you specify. Note that this
  is a large install/download.

###Beginning with tf2_server

To start using `tf2_server`, simply include the
`tf2_server` class in your manifest, and the module
will do the rest.

##Reference

###Classes

* `tf2_server`: This class installs, configures, and manages the `tf2_server`
  as a service.

###Parameters

The `tf2_server` class contains a number of parameters. These include:

* `server_install_dir`: The directory in which the server should be installed.
  Defaults to `/home/steam/hlds/`.
* `server_owner`: The user under whom the server should be run. Defaults to
  `steam`. Running the server as root is not recommended.
* `staging_dir`: The staging directory used to download steamcmd, which is used to install
  the TF2 Server. Defaults to `/home/steam/`.
* `service_ensure`: Whether or not the TF2 server service should be running. Valid values are
  `'running'` and `'stopped'`. Defaults to `'running'`.
* `service_manage`: Whether or not the TF2 server service should be managed by puppet. Defaults to
  `true`.
* `service_enable`: Whether or not the TF2 server service should be started on boot. Defaults to
  `true`.
* `start_map`: The name of the map that should run initially when the server is started. Defaults to
  `'ctf_2fort'`. The file extension of the map file should NOT be included.
* `maplist`: An array containing all the maps that should be available for use by your server. Defaults
  to `['ctf_2fort']`.
* `mapcycle`: An array containing the maps in your mapcycle in the order they appear in the mapcycle.
  Defaults to `['ctf_2fort']`.
* `motd`: Your server's message of the day.
* `hostname`: The hostname of your server.
* `server_options`: A hash containing any additional options you want to set in your `server.cfg` file.
  Each key in this hash should be the name of a setting, with its value being the value of the corresponding
  setting.

##Limitations

This module has been tested and verified on:

* Debian 7
* CentOS 6

The module may work on other platforms, but functionality cannot be guaranteed.
As it stands currently, this module will NOT work on systems that use systemd.

Furthermore, `steamcmd` is a 32-bit program and uses 32-bit libraries, so, as of now,
this module will only run on 32-bit architectures. 

##Known Issues

* Occasionally, the `steamcmd` tool may be interrupted while installing the TF2 server.
  In this case, the puppet run will fail, as certain necessary directories will not have
  been created. If this happens, simply apply your manifest again, and installation should
  continue from where it left off. You may need to apply your manifest multiple times to
  fully install the server. 

##TODO and Hopes for the future

These are features I hope to implement sometime in the future.

* Currently this module only supports four options for your `server.cfg` file. However, this
  file supports a large number of additional options, so the current implementation is fairly
  restrictive. Hopefully, support for additional options will be added in the near future.
* Add support for 64-bit architectures.
* Add a custom `map` type. This type will allow you to ensure a map is present in your map-list,
  and will also allow you to manage the contents of the configuration files for particular maps
  with puppet.
