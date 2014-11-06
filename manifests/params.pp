class tf2_server::params {
  $server_install_dir = '/home/steam/hlds'
  $server_owner = 'steam'
  $staging_dir = '/home/steam'
  $service_ensure = "running"
  $service_manage = true
  $service_enable = true
  $hostname = 'tf2_test_server'
  $motd = 'This is a message of the day.'
  $start_map = 'ctf_2fort'
  $maplist = ['ctf_2fort']
  $mapcycle = ['ctf_2fort']
  $server_options = { rcon_password => 'abcd1234',
                      sv_contact => 'fakename@fakedomain',
                      map_timelimit => '30', }
}
