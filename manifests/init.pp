class tf2_server (
  $server_install_dir,
  $server_install_owner,
  $staging_dir,
  $hostname,
  $rcon_password,
  $sv_contact,
  $map_timelimit,
  $motd,
  $service_ensure,
  $service_manage,
  $service_enable,
) {
  include tf2_server::install
  include tf2_server::config
  include tf2_server::service
  Class['tf2_server::install'] -> Class['tf2_server::config'] -> Class['tf2_server::service']
}
