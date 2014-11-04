# tf2_server #

This module allows you to install, configure, and manage a TF2 server using puppet.
It will install steamcmd, use it to download and install a TF2 dedicated server,
then set up configuration files and an init script so the server can be
managed as a service.

This module requires nanliu's staging module.

## Usage

To use this module, declare the `tf2_server` class. This class has
the following parameters:

### `server_install_dir`

This is the location into which the server will be installed. Defaults to
`/home/steam/hlds/`.

### `server_owner`

This is the user under whom the server install command the server itself
will be run. Defaults to `steam`. Note that this module will NOT create
this user for you if it doesn't exist.

### `staging_dir`

This is the staging directory for the steamcmd tar file. Defaults to `/home/steam`.

### `service_ensure`

Indicates whether or not the `tf2-server` service is running. Valid values are 
`running` and `stopped`. Defaults to `running`.

### `service_manage`

Indicates whether or not puppet will manage the `tf2-server` service. Defaults to
`true`.

### `service_enable`

Indicates whether or not the `tf2-server` service will be run on startup. Defaults
to `true`.

### Additional Parameters

There are a few additional parameters as well. `hostname`, `rcon_password`, `sv_contact`
and `map_timelimit` all correspond to settings in your server's `server.cfg` file. `motd`
is your server's message of the day.

## Known Issues

* When install things with `steamcmd`, the installation will sometimes fail and be in a state
  where the installation is only partially complete. In this case most of the post-install tasks
  will fail. Installation should continue the next time the manifest is applied, and once it is
  complete the agent run will be successful. You may need to apply your manifest multiple times.

## TODO

* Support for CentOS 7

