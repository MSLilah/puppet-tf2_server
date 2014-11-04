class tf2_server::steamcmd inherits tf2_server{
  file { "$server_install_dir":
    ensure => 'directory',
  }
  class { 'staging':
    path  => "$staging_dir",
    owner => "$server_owner",
    group => "$server_owner",
  }
  staging::deploy { 'steamcmd_linux.tar.gz':
    source => 'http://media.steampowered.com/installer/steamcmd_linux.tar.gz',
    target => "$server_install_dir",
  }
}
