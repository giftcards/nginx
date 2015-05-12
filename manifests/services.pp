class nginx::services {
  require(nginx::packages)
  require(nginx::config)

  service { $nginx::services: ensure => running, enable => true }

}
