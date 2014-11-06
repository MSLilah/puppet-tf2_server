class tf2_server (
  $server_install_dir = $tf2_server::params::server_install_dir,
  $server_owner = $tf2_server::params::server_owner,
  $staging_dir = $tf2_server::params::staging_dir,
  $hostname = $tf2_server::params::hostname,
  $motd = $tf2_server::params::motd,
  $service_ensure = $tf2_server::params::service_ensure,
  $service_manage = $tf2_server::params::service_manage,
  $service_enable = $tf2_server::params::service_enable,
  $start_map = $tf2_server::params::start_map,
  $maplist = $tf2_server::params::maplist,
  $mapcycle = $tf2_server::params::mapcycle,
  $server_options = $tf2_server::params::server_options,
) inherits tf2_server::params {
  include tf2_server::install
  include tf2_server::config
  include tf2_server::service
  Class['tf2_server::install'] -> Class['tf2_server::config'] -> Class['tf2_server::service']
}
