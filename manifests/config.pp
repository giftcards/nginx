class nginx::config {
  require(nginx::packages)

  File { notify => Service[$nginx::services], }

  if $nginx::vhostgroup == false {
    file {
      '/etc/nginx/vhosts':
        ensure  => directory,
        owner   => 'root',
        group   => 'root',
        purge   => false,
        recurse => true;
    }
  } else {
    file {
      '/etc/nginx/vhosts':
        ensure  => directory,
        owner   => 'root',
        group   => 'root',
        purge   => $nginx::vhostpurge,
        recurse => true,
        source  => "puppet:///modules/nginx/vhosts/${nginx::vhostgroup}";
    }

    if $nginx::vhosttemplates != false {
      file { "/etc/nginx/vhosts/${nginx::vhosttemplates}":
        ensure  => file,
        content => template("nginx/${nginx::vhostgroup}/${nginx::vhosttemplates}"),
      }
    }
  }

  file {
    '/etc/nginx/nginx.conf':
      ensure  => file,
      content => template('nginx/nginx.conf');

    '/etc/nginx/vhosts/nginx_status.conf':
      ensure => absent;

    '/etc/nginx/conf.d/nginx_status.conf':
      ensure => file,
      source => 'puppet:///modules/nginx/nginx_status.conf';

    '/etc/nginx/mime.types':
      ensure => file,
      source => 'puppet:///modules/nginx/mime.types';

    '/etc/nginx/conf.d/default.conf':
      ensure  => file,
      content => '';

    '/etc/nginx/conf.d/example_ssl.conf':
      ensure  => file,
      content => '';
  }

  if $hostgroup == 'stgbox' or $hostgroup == 'devbox' {
    file { '/var/log/nginx/': mode => '0755', }
  }
}
