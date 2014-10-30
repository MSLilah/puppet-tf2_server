class { 'tf2_server':
  hostname => "tf2_server test",
  rcon_password => "abcd1234",
  sv_contact => "fake@fake.com",
  map_timelimit => 15,
  motd => "Welcome to the tf2_server puppet module test server!",
}
