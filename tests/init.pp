user { 'steam':
  ensure => present,
  managehome => true,
  before => [Class['tf2_server']],
}
include tf2_server
