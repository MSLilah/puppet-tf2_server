class tf2_server (
  $hostname,
  $rcon_password,
  $sv_contact,
  $map_timelimit,
  $motd,
) {
  include tf2_server::install
  include tf2_server::config
  Class['tf2_server::install'] -> Class['tf2_server::config']
}
