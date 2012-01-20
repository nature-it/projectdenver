class natureapps::foxtrot {
  include natureapps::foxtrot::container,natureapps::foxtrot::vhost,natureapps::foxtrot::appprops,natureapps::common::filesystem
}

class natureapps::foxtrot::container {
  jetty::packagenew { "jetty-npg":
        name => "npg",
        version => "6.1.19",
        port => "9901",
        jvmtuningargs => "${jvmtuningargs}",
  }
}

class natureapps::foxtrot::vhost {
  apacheserver::vhost { "${servergroup}-www.nature.com":
    priority    => "49",
    proxyblock => "RewriteRule ^/(.*) http://localhost:9901/\$1 [P,L]",
    redirblock => "#Include \"/etc/httpd/conf/naturecom_redirects.conf\"",
  }

}

class natureapps::foxtrot::appprops {
  natureapps::appprops { "foxtrot:foxtrot.properties":
    basepath => "/usr/local/jetty-npg/etc",
    propfile => "foxtrot.properties",
    owner    => "xb3",
    require  => Class["Natureapps::Foxtrot::Container"],
  }
}

