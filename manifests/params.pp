class tf2_server::params {
  $server_install_dir = '/home/steam/hlds'
  $server_owner = 'steam'
  $staging_dir = '/home/steam'
  $service_ensure = "running"
  $service_manage = true
  $service_enable = true
  $hostname = 'tf2_test_server'
  $rcon_password = 'abcd1234'
  $sv_contact = 'fakename@fakedomain'
  $map_timelimit = '30'
  $motd = 'This is a message of the day.'
}
