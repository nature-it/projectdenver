#/etc/puppet/modules/nginx/manifests/init.pp

class nginx {
  include nginx::package
  file { 
    "/etc/nginx/nginx.conf":
            owner   => root,
            group   => root,
            mode    => 640,
            source  => [
        "puppet:///modules/nginx/nginx.conf.${hostname}",
        "puppet:///modules/nginx/nginx.conf"
      ],
            require => Package["nginx"];
        "/etc/nginx/conf.d/proxy.conf":
            owner   => root,
            group   => root,
            mode    => 640,
            source  => [
        "puppet:///modules/nginx/proxy.conf.${hostname}",
        "puppet:///modules/nginx/proxy.conf"
      ],
            require => Package["nginx"];
        "/etc/nginx/conf.d/gzip.conf":
            owner   => root,
            group   => root,
            mode    => 640,
            source  => [
        "puppet:///modules/nginx/gzip.conf.${hostname}",
        "puppet:///modules/nginx/gzip.conf"
      ],
            require => Package["nginx"];
        "/etc/nginx/mime.types":
            owner   => root,
            group   => root,
            mode    => 640,
            source  => [
        "puppet:///modules/nginx/mime.types.${hostname}",
        "puppet:///modules/nginx/mime.types.${servergroup}",
        "puppet:///modules/nginx/mime.types"
      ],
            require => Package["nginx"];
        "/etc/nginx/conf.d/nature.conf":
            owner   => root,
            group   => root,
            mode    => 640,
            source  => [
        "puppet:///modules/nginx/nature.conf.${hostname}",
        "puppet:///modules/nginx/nature.conf.${servergroup}",
        "puppet:///modules/nginx/nature.conf"
      ],
            require => Package["nginx"];
    }
  service { "nginx":
    name    => "nginx",
    ensure    => running,
    enable    => true,
          restart   => "/etc/init.d/nginx reload",
    require   => Package["nginx"],
    subscribe => [ 
      File["/etc/nginx/nginx.conf"], 
      File["/etc/nginx/conf.d/nature.conf"]
    ]
  }
}
