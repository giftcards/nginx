class nginx::packages {

  package { $nginx::packages: ensure => installed, }

}
