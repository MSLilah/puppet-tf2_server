class tf2_server::steamcmd {
  user { "steam":
    ensure     => "present",
    managehome => true,
    uid        => '5239'
  }
  file { '/home/steam/hlds':
    ensure => 'directory',
  }
  class { 'staging':
    path  => '/home/steam',
    owner => 'steam',
    group => 'steam',
  }
  staging::deploy { 'steamcmd_linux.tar.gz':
    source => 'http://media.steampowered.com/installer/steamcmd_linux.tar.gz',
    target => '/home/steam/hlds',
  }
}
