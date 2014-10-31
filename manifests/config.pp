class tf2_server::config inherits tf2_server {
  file { "$server_install_dir/tf2/tf/cfg/server.cfg":
    ensure => file,
    content => "hostname \"$hostname\"
                rcon_password \"$rcon_password\"
                sv_contact \"$sv_contact\"
                mp_timelimit \"$map_timelimit\"",
  }
  file { "$server_install_dir/tf2/tf/cfg/motd.txt":
    ensure => file,
    content => "$motd",
  }
  file { "$server_install_dir/tf2/tf/cfg/maplist.txt":
    ensure => file,
    content => "ctf_2fort",
  }
  file { "$server_install_dir/tf2/tf/cfg/mapcycle.txt":
    ensure => file,
    content => "ctf_2fort",
  }
  file { "$server_install_dir/tf2/tf/cfg/ctf_2fort.cfg":
    ensure => file,
    content => "mp_timelimit 5"
  }
  file { "$server_install_dir/tf.sh":
    ensure => file,
    mode => 764,
    owner => "steam",
    content => "#!/bin/sh\ntf2/srcds_run -game tf +sv_pure 1 +map ctf_2fort.bsp +maxplayers 24",
  }
}
