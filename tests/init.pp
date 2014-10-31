class { 'tf2_server':
  server_install_dir => "/home/steam/hlds",
  server_install_owner => "steam",
  staging_dir => "/home/steam",
  hostname => "tf2_server test",
  rcon_password => "abcd1234",
  sv_contact => "fake@fake.com",
  map_timelimit => 15,
  motd => "Welcome to the tf2_server puppet module test server!",
}
