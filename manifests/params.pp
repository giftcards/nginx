class nginx::params {
  $listenaddress = '0.0.0.0'
  $phpfpmaddress = '127.0.0.1:9000'
  $vhostgroup = false
  $vhosttemplates = false
  $vhostpurge = false
  $services = [ 'nginx' ]
  $packages = [ 'nginx' ]
}
