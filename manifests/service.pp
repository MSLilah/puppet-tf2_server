class tf2_server::service inherits tf2_server {
  if ! ($service_ensure in [ 'running', 'stopped' ]) {
    fail('service_ensure parameter must be running or stopped')
  }
  if $service_manage == true {
    service { 'tf2-server':
      ensure     => $service_ensure,
      enable     => $service_enable,
      hasstatus  => true,
      hasrestart => true,
    }
  }
}
