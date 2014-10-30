class tf2_server {
  require tf2_server::steamcmd
  file { '/home/steam/hlds/steamcmd.sh':
    ensure => file,
    owner  => "steam",
    mode   => "764",
  }
  file { '/home/steam/hlds/linux32/steamcmd':
    ensure => file,
    owner => "steam",
    mode  => "764",
  }
  file { '/home/steam/hlds/tf2_ds.txt':
    ensure  => file,
    content => "login anonymous\nforce_install_dir ./tf2\napp_update 232250\nquit\n",
  }
  file { '/home/steam/hlds/update.sh':
    ensure  => file,
    content => "#!/bin/sh\n/home/steam/hlds/steamcmd.sh +runscript tf2_ds.txt",
    owner   => "steam",
    mode    => "764",
  }
  exec { 'install_server':
    command   => "./update.sh",
    cwd => "/home/steam/hlds",
    provider => "shell",
    timeout => 0,
    logoutput => true,
    require => [File['/home/steam/hlds/steamcmd.sh'], File['/home/steam/hlds/linux32/steamcmd'],
                File['/home/steam/hlds/tf2_ds.txt'], File['/home/steam/hlds/update.sh']],
  }
}
