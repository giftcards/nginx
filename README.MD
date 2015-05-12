## Synopsis

Puppet module to install nginx. Can configure vhosts and phpfpm access.

## Example

Defaults are in params.pp
Groups of vhost files can be stored under files/vhosts/vhostgroup/ and installed by setting vhostgroup
vhostpurge will purge any unmanaged vhost files

## Motivation

Manage nginx installations

## Installation

Tested on CentOS 6
Requires nginx repository http://wiki.nginx.org/Install
There are two empty files created on conf.d. The nginx maintainers took the dubious decision of recreating their default configs on every software updated. Creating these blank files is required to prevent the update packages from breaking your configuration.

## API Reference

listenaddress  => bind address for nginx
phpfpmaddress  => address to connect to phpfpm on 
vhostgroup     => group of vhosts saved under files/vhosts/groupname
vhostpurge     => purge unmanaged vhost files
vhosttemplates => intended to allow templates to be used instead of static files but is so far untested

## Contributors

Ryan Munz for Giftcards.com - May 2015
