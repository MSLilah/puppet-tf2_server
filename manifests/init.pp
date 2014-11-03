class tf2_server (
  $server_install_dir = $tf2_server::params::server_install_dir,
  $server_owner = $tf2_server::params::server_owner,
  $staging_dir = $tf2_server::params::staging_dir,
  $hostname = $tf2_server::params::hostname,
  $rcon_password = $tf2_server::params::rcon_password,
  $sv_contact = $tf2_server::params::sv_contact,
  $map_timelimit = $tf2_server::params::map_timelimit,
  $motd = $tf2_server::params::motd,
  $service_ensure = $tf2_server::params::service_ensure,
  $service_manage = $tf2_server::params::service_manage,
  $service_enable = $tf2_server::params::service_enable,
) inherits tf2_server::params {
  include tf2_server::install
  include tf2_server::config
  include tf2_server::service
  Class['tf2_server::install'] -> Class['tf2_server::config'] -> Class['tf2_server::service']
}
