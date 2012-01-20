## ! This module is not yet used ! ##
######

####
## Create a jetty instance for palgraveconnect (done so that multiple apps can exist in that container).
## Create an apache vhost for ${servergroup}-www.palgraveconnect.com
## Manage a common redirects file
## Manage application property files
######
class natureapps::palgraveconnect {
  include natureapps::palgraveconnect::container,natureapps::palgraveconnect::vhost,natureapps::palgraveconnect::appprops
}

#realize a jetty instance to run our app.
class natureapps::palgraveconnect::container {
  jetty::packagenew { "jetty-palgraveconnect":
    name => "palgraveconnect",
    port => "9902",
    jmxport => "19902",
    jvmtuningargs => "${jvmtuningargs}",
  }
}

#realize an apache vhost for palgraveconnect.com
class natureapps::palgraveconnect::vhost {
  apacheserver::vhost { "${servergroup}-www.palgraveconnect.com":
    priority    => "50",
    proxyblock => "RewriteRule ^/(.*) http://localhost:9902/\$1 [P,L]",
    redirblock => "#Include \"/etc/httpd/conf/palgraveconnect_redirects.conf\"",
  }

  file { "/etc/httpd/conf/palgraveconnect_redirects.conf":
    content => "",
    notify  => Service["httpd"],
    require => Apacheserver::Vhost["${servergroup}-www.palgraveconnect.com"],
  }
}

class natureapps::palgraveconnect::appprops {
  natureapps::appprops { "palgraveconnect.properties":
    basepath => "/usr/local/jetty-palgraveconnect/etc",
    propfile => "palgraveconnect.properties",
    owner    => "xb3",
    require  => Class["Natureapps::Palgraveconnect::Container"],
  }
}
