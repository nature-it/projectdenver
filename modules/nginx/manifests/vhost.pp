#modules/nginx/manifests/vhost.pp

# Define a nginx virtualhost

define nginx::vhost(port="80",basedir="/var/www/${name}",docroot="/var/www/${name}/htdocs",$hostalias="${name}") {
  include nginx::service
}
