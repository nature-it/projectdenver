class natureapps::jetty-services {
    File {
      owner => "xb3",
      group => "xb3",
      mode  => 644,
    }
    file {
      "/usr/local/jetty-services/etc/runtime.properties":
        source  => [
                "puppet:///confidential/natureapps/jetty-services/runtime.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-services/runtime.properties.$servergroup",
                "puppet:///modules/natureapps/jetty-services/runtime.properties.default",
            ];
      "/usr/local/jetty-services/etc/subject-codes.xml":
        source  => [
                "puppet:///modules/natureapps/jetty-services/subject-codes.xml.$hostname",
                "puppet:///modules/natureapps/jetty-services/subject-codes.xml.$servergroup",
                "puppet:///modules/natureapps/jetty-services/subject-codes.xml.default",
            ];
      "/usr/local/jetty-services/etc/citation_external_service.properties":
        source  => [
                "puppet:///modules/natureapps/jetty-services/citation_external_service.properties.$hostname",
                "puppet:///modules/natureapps/jetty-services/citation_external_service.properties.$servergroup",
                "puppet:///modules/natureapps/jetty-services/citation_external_service.properties.default",
            ];
      "/usr/local/jetty-services/etc/scopus.msg":
        source  => [
                "puppet:///modules/natureapps/jetty-services/scopus.msg.$hostname",
                "puppet:///modules/natureapps/jetty-services/scopus.msg.$servergroup",
                "puppet:///modules/natureapps/jetty-services/scopus.msg.default",
            ];
      "/usr/local/jetty-services/etc/citations.properties":
        source  => [
                "puppet:///confidential/natureapps/jetty-services/citations.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-services/citations.properties.$servergroup",
                "puppet:///confidential/natureapps/jetty-services/citations.properties.default",
            ];
      "/usr/local/jetty-services/etc/thomson.msg":
        source  => [
                "puppet:///confidential/natureapps/jetty-services/thomson.msg.$hostname",
                "puppet:///confidential/natureapps/jetty-services/thomson.msg.$servergroup",
                "puppet:///confidential/natureapps/jetty-services/thomson.msg.default",
            ];
      "/usr/local/jetty-services/contexts/npg-services.xml":
        source => [
            "puppet:///modules/natureapps/jetty-services/npg-services.xml.${hostname}",
            "puppet:///modules/natureapps/jetty-services/npg-services.xml.${servergroup}",
            "puppet:///modules/natureapps/jetty-services/npg-services.xml",
        ];
    }
}
