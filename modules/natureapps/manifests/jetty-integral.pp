class natureapps::jetty-integral {
  host { "test-fs.nature.com": ip=>"192.168.88.108", host_aliases=>["test-fs"], ensure=>present }
  host { "staging-fs.nature.com": ip=>"192.168.88.243", host_aliases=>["staging-fs"], ensure=>present }
  host { "naturefs4": ip=>"192.168.10.19", host_aliases=>["ftp.webadmin.nature.com"], ensure=>present }
    File {
      owner => "xb3",
      group => "xb3",
      mode  => 644,
    }
    file {
      "/usr/local/jetty/etc/export.properties":
        source  => [
                "puppet:///confidential/natureapps/jetty-integral/export.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-integral/export.properties.$servergroup",
                "puppet:///confidential/natureapps/jetty-integral/export.properties.default",
            ];
      "/usr/local/jetty/etc/import-services.properties":
        source  => [
                "puppet:///confidential/natureapps/jetty-integral/import-services.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-integral/import-services.properties.$servergroup",
                "puppet:///confidential/natureapps/jetty-integral/import-services.properties.default",
            ];
      "/usr/local/jetty/etc/import-references.properties":
        source  => [
                "puppet:///confidential/natureapps/jetty-integral/import-references.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-integral/import-references.properties.$servergroup",
                "puppet:///confidential/natureapps/jetty-integral/import-references.properties.default",
            ];
    }
}
