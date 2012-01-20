#modules/natureapps/manifests/whodemo.pp

# A demo application stack to show how puppet can bootstrap an entire npg hello world app

# For now it's just a static HTML page, but it really should be helloworld.py or helloworld.rb 
# with an application server (wsgi, mod_passenger, etc) and a DB connection

# It should also really have logic to register itself with any load balancers it discovers

class natureapps::whodemo {
  nginx::vhost { 'demo.nature.com': }
  file { "/var/www/demo.nature.com/htdocs/index.html":
    owner   => "nginx",
    mode    => 0644,
    ensure  => file,
    content => "<HTML><HEAD><TITLE>Hello, world.</TITLE></HEAD><BODY><H2>Hello NPG.</H2></BODY></HTML>",
    notify  => Service["nginx"],
  }
}
