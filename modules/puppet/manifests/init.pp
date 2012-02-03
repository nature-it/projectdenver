#/etc/puppet/modules/puppet/manifests/init.pp

class puppet {
  file {
      "/etc/init.d/puppet":
            source  => ["puppet:///modules/puppet/puppet"];
      "/etc/environment":
            content => template("puppet/environment.erb")
  }
  
  service { 
      "puppet":
          name      => "puppet",
          ensure    => running,
          enable    => true,
          hasstatus => true,
          require   => File["/etc/init.d/puppet"]
  }
}
