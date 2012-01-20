class natureapps::jetty-ruby {
  File {
    owner => "xb3",
    group => "xb3",
    mode  => 644,
  }
    file {
        "/usr/local/jetty-ruby/etc/AppProperties.properties":
            source  => [
                "puppet:///confidential/natureapps/jetty-ruby/AppProperties.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-ruby/AppProperties.properties.$servergroup",
								"puppet:///modules/natureapps/jetty-ruby/AppProperties.properties.default",
            ];
        "/usr/local/jetty-ruby/etc/jdbcRealm.properties":
            source  => [
                "puppet:///confidential/natureapps/jetty-ruby/jdbcRealm.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-ruby/jdbcRealm.properties.$servergroup",
								"puppet:///modules/natureapps/jetty-ruby/jdbcRealm.properties.default",
            ];
        "/usr/local/jetty-ruby/etc/login.properties":
            source  => [
                "puppet:///confidential/natureapps/jetty-ruby/login.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-ruby/login.properties.$servergroup",
								"puppet:///modules/natureapps/jetty-ruby/login.properties.default",
            ];
        "/usr/local/jetty-ruby/etc/realm.properties":
            source  => [
                "puppet:///confidential/natureapps/jetty-ruby/realm.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-ruby/realm.properties.$servergroup",
								"puppet:///modules/natureapps/jetty-ruby/realm.properties.default",
            ];
        "/usr/local/jetty-ruby/etc/socialjpa.properties":
            source  => [
                "puppet:///confidential/natureapps/jetty-ruby/socialjpa.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-ruby/socialjpa.properties.$servergroup",
								"puppet:///modules/natureapps/jetty-ruby/socialjpa.properties.default",
            ];
  }
}
