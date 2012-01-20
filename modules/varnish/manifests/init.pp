#/etc/puppet/modules/varnish/manifests/init.pp

class varnish {
  package { "varnish": ensure=>installed }
  file {
      "/etc/sysconfig/varnish":
            owner   => "root",
            group   => "root",
            mode    => 640,
            source  => [
              "puppet:///modules/varnish/varnish.sysconfig.${hostname}",
              "puppet:///modules/varnish/varnish.sysconfig.{$environment}",
              "puppet:///modules/varnish/varnish.sysconfig"
            ],
            require => Package["varnish"];
      "/etc/varnish/npg_default.vcl":
            owner   => "root",
            group   => "root",
            mode    => 640,
            source  => [
              "puppet:///modules/varnish/npg_default.vcl.${hostname}",
              "puppet:///modules/varnish/npg_default.vcl.${servergroup}",
              "puppet:///modules/varnish/npg_default.vcl",
            ],
            require => Package["varnish"];
  }

  service { "varnish":
            name       => "varnish",
            ensure     => running,
            enable     => true,
            restart    => "/etc/init.d/varnish reload",
            hasrestart => true,
            require    => Package["varnish"],
            subscribe  => [
              File["/etc/varnish/npg_default.vcl"],
              File["/etc/sysconfig/varnish"]
            ],
  }
}

class varnish::npgweb {
  package { "varnish": ensure=>installed }
  file { "/etc/sysconfig/varnish":
    owner   => "root",
    group   => "root",
    mode    => 640,
    source  => ["puppet:///modules/varnish/sysconfig"],
    require => Package["varnish"],
  }
  file { "/etc/varnish/npgweb.vcl":
        owner   => "root",
        group   => "root",
        mode    => 640,
        source  => ["puppet:///modules/varnish/npgweb.vcl"],
        require => Package["varnish"],
  }
  service { "varnish":
        name       => "varnish",
        ensure     => running,
        enable     => true,
        restart    => "/etc/init.d/varnish reload",
        hasrestart => true,
        require    => Package["varnish"],
        subscribe  => [
            File["/etc/varnish/npgweb.vcl"],
            File["/etc/sysconfig/varnish"]
        ],
  }
}
