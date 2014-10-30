class tf2_server (
  $hostname,
  $rcon_password,
  $sv_contact,
  $map_timelimit,
  $motd,
) {
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
    content => "login anonymous\nforce_install_dir ./tf2\napp_update 232250 validate\nquit\n",
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
    before => [File['/home/steam/hlds/tf2/tf/cfg/server.cfg'], File['/home/steam/hlds/tf2/tf/cfg/motd.txt'],
               File['/home/steam/hlds/tf2/tf/cfg/maplist.txt'], File['/home/steam/hlds/tf2/tf/cfg/mapcycle.txt'],
               File['/home/steam/hlds/tf2/tf/cfg/ctf_2fort.cfg'], File['/home/steam/hlds/tf2/steam_appid.txt']],
  }
  file { '/home/steam/hlds/tf2/tf/cfg/server.cfg':
    ensure => file,
    content => "hostname \"$hostname\"
                rcon_password \"$rcon_password\"
                sv_contact \"$sv_contact\"
                mp_timelimit \"$map_timelimit\"",
  }
  file { '/home/steam/hlds/tf2/tf/cfg/motd.txt':
    ensure => file,
    content => "$motd",
  }
  file { '/home/steam/hlds/tf2/tf/cfg/maplist.txt':
    ensure => file,
    content => "ctf_2fort",
  }
  file { '/home/steam/hlds/tf2/tf/cfg/mapcycle.txt':
    ensure => file,
    content => "ctf_2fort",
  }
  file { '/home/steam/hlds/tf2/tf/cfg/ctf_2fort.cfg':
    ensure => file,
    content => "mp_timelimit 5"
  }
  file { '/home/steam/hlds/tf2/steam_appid.txt':
    ensure => file,
    content => "440",
  }
  file { '/home/steam/hlds/tf.sh':
    ensure => file,
    mode => 764,
    owner => "steam",
    content => "#!/bin/sh\ntf2/srcds_run -game tf +sv_pure 1 +map ctf_2fort.bsp +maxplayers 24",
  }
}
