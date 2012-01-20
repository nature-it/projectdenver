#modules/nginx/manifests/package.pp

class nginx::package {
  package { 'nginx':
    ensure => installed,
  }
}
