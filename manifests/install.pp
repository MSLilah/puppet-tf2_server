class tf2_server::install inherits tf2_server {
  require tf2_server::steamcmd
  package { 'screen':
    ensure => present,
  }
  file { "$server_install_dir/steamcmd.sh":
    ensure => file,
    owner  => "steam",
    mode   => "764",
  }
  file { "$server_install_dir/linux32/steamcmd":
    ensure => file,
    owner => "steam",
    mode  => "764",
  }
  file { "$server_install_dir/tf2_ds.txt":
    ensure  => file,
    content => "login anonymous\nforce_install_dir ./tf2\napp_update 232250 validate\nquit\n",
  }
  file { "$server_install_dir/update.sh":
    ensure  => file,
    content => "#!/bin/sh\n/home/steam/hlds/steamcmd.sh +runscript tf2_ds.txt",
    owner   => "steam",
    mode    => "764",
  }
  exec { 'install_server':
    command   => "./update.sh",
    cwd => "$server_install_dir",
    provider => "shell",
    timeout => 0,
    logoutput => true,
    unless => "cat $server_install_dir/tf2/tf/cfg/server.cfg",
    require => [File["$server_install_dir/steamcmd.sh"], File["$server_install_dir/linux32/steamcmd"],
                File["$server_install_dir/tf2_ds.txt"], File["$server_install_dir/update.sh"]],
    before => [File["$server_install_dir/tf2/steam_appid.txt"], File["/etc/init.d/tf2-server"]],
  }
  file { "$server_install_dir/tf2/steam_appid.txt":
    ensure => file,
    content => "440",
  }
  file { "/etc/init.d/tf2-server":
    ensure => file,
    content => template("tf2_server/init_script.erb"),
    mode => "764",
    owner => "root",
    require => [Exec['install_server']],
  }
}
