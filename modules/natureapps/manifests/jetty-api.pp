class natureapps::jetty-api {
  File {
    owner => "xb3",
    group => "xb3",
    mode  => 644,
  }
  file { 
    "/usr/local/jetty-api/etc/openurl.properties":
      source  => [
        "puppet:///confidential/natureapps/jetty-api/openurl.properties.{$::hostname}",
        "puppet:///confidential/natureapps/jetty-api/openurl.properties.{$::servergroup}",
        "puppet:///modules/natureapps/jetty-api/openurl.properties.default",
      ];
    "/usr/local/jetty-api/etc/cerberus.properties":
      source  => [
        "puppet:///confidential/natureapps/jetty-api/cerberus.properties.{$::hostname}",
        "puppet:///confidential/natureapps/jetty-api/cerberus.properties.{$::servergroup}",
        "puppet:///modules/natureapps/jetty-api/cerberus.properties.default",
      ];
  }
}
