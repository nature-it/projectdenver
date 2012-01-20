#modules/nginx/manifests/service.pp

class nginx::service {
  include nginx::package
  service { "nginx":
    ensure    => running,
    enabled   => true,
    subscribe => Package["nginx"],
  }
}
