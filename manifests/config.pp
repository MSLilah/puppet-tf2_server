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
    content => join($maplist, "\n"),
  }
  file { "$server_install_dir/tf2/tf/cfg/mapcycle.txt":
    ensure => file,
    content => join($mapcycle, "\n"),
  }

  # ensure .cfg files exist for every map contained in the maplist so that
  # they can all be loaded by the server
  $full_path_array = prefix_and_suffix($maplist,"$server_install_dir/tf2/tf/cfg/",".cfg")
  file { $full_path_array:
    ensure => file,
  }

  file { "$server_install_dir/tf.sh":
    ensure => file,
    mode => 764,
    owner => "steam",
    content => "#!/bin/sh\ntf2/srcds_run -game tf +sv_pure 1 +map $start_map.bsp +maxplayers 24",
  }
}
