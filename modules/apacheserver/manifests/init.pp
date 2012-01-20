#/etc/puppet/modules/apacheserver/manifests/init.pp

#All apache servers need the package and our logrotate script.
class apacheserver {
  package { "httpd": ensure=>installed }
  file { "/etc/httpd/conf.d/vhosts/":
    require => Package["httpd"],
    ensure => directory,
  }
}

# Define a vhost which will be used to generate a vhosts/<name>.conf file 
# Can pass in a different template, but the base will include most of what we do (access control, redirects, proxyconfig)
# Todo:  Modify /etc/httpd/conf.d/vhosts.conf to include vhosts/* , currently left as a manual step.
define apacheserver::vhost($port="80",$basedir="/var/www/${name}",$docroot="/var/www/${name}/htdocs",$template="apacheserver/vhost.erb",$serveraliases="",$priority="99",$acblock="",$proxyblock="",$redirblock="") {
  include apacheserver
  file { "/etc/httpd/conf.d/vhosts/${priority}-${name}": 
    content => template($template),
    owner   => 'root',
    group   => 'root',
    mode    => '644',
    notify  => Service["httpd"],
  }
  file { "${basedir}":
    ensure => directory,
    require => File["/etc/httpd/conf.d/vhosts/${priority}-${name}"],
    notify => Service["httpd"],
  }
  file { ["${docroot}","${basedir}/logs"]:
    ensure => directory,
    require => File["${basedir}"],
  }
}

class apacheserver::npgweb inherits apacheserver {
  file {
    "/var/www/html/logs":
        ensure => directory,
        require => Package["httpd"];
    "/etc/httpd/conf/httpd.conf":
        owner   => "root",
        group   => "root",
        mode    => 644,
        source  => ["puppet:///modules/apacheserver/httpd.conf"],
        require => Package["httpd"];
    "/etc/httpd/conf.d/vhosts.conf":
        owner   => "root",
        group   => "root",
        mode    => 644,
        source  => ["puppet:///modules/apacheserver/vhosts.conf"],
        require => [
                    Package["httpd"],
                    File["/var/www/html/logs"],
                    ];
     "/var/www/html/index.html":
        owner   => "root",
        group   => "root",
        mode    => 644,
        content => template("apacheserver/npgweb.erb"),
        require => Package["httpd"],
        notify  => Service["httpd"]
    }

    service { "httpd":
                name      => "httpd",
                ensure    => running,
                enable    => true,
                hasstatus => true,
                require   => Package["httpd"],
                subscribe => [
                              Package["httpd"],
                              File["/etc/httpd/conf/httpd.conf"],
                              File["/etc/httpd/conf.d/vhosts.conf"],
                              ];
    }
} 
