class natureapps::jetty-external {
  File {
    owner => "xb3",
    group => "xb3",
    mode  => 644,
  }
    file {  
      "/usr/local/jetty-external/etc/openurl.properties":
        source  => [
          "puppet:///confidential/natureapps/jetty-external/openurl.properties.$hostname",
          "puppet:///confidential/natureapps/jetty-external/openurl.properties.$servergroup",
          "puppet:///modules/natureapps/jetty-external/openurl.properties.default",
       ];
      "/usr/local/jetty-external/etc/cerberus.properties":
        source  => [
          "puppet:///confidential/natureapps/jetty-external/cerberus.properties.$hostname",
          "puppet:///confidential/natureapps/jetty-external/cerberus.properties.$servergroup",
          "puppet:///modules/natureapps/jetty-external/cerberus.properties.default",
        ];
      "/usr/local/jetty-external/etc/ealert-service.properties":
        source  => [
          "puppet:///confidential/natureapps/jetty-external/ealert-service.properties.$hostname",
          "puppet:///confidential/natureapps/jetty-external/ealert-service.properties.$servergroup",
          "puppet:///modules/natureapps/jetty-external/ealert-service.properties.default",
        ];
    }
}
