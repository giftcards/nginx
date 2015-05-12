class nginx (

  $listenaddress = $nginx::params::listenaddress,
  $phpfpmaddress = $nginx::params::phpfpmaddress,
  $vhostgroup = $nginx::params::vhostgroup,
  $vhosttemplates = $nginx::params::vhosttemplates,
  $vhostpurge = $nginx::params::vhostpurge,

) inherits nginx::params {

  $packages = $nginx::params::packages
  $services = $nginx::params::services

  include nginx::packages
  include nginx::config
  include nginx::services

}
