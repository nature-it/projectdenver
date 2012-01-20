class natureapps::jetty-palgrave {
  File {
    owner => "xb3",
    group => "xb3",
    mode  => 644,
  }
    file {
        "/usr/local/jetty-palgrave/etc/bibit_palgrave.properties":
            source  => [
                "puppet:///confidential/natureapps/jetty-palgrave/bibit_palgrave.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-palgrave/bibit_palgrave.properties.$servergroup",
								"puppet:///modules/natureapps/jetty-palgrave/bibit_palgrave.properties.default",
            ];
        "/usr/local/jetty-palgrave/etc/cache.interval.properties":
            source  => [
                "puppet:///confidential/natureapps/jetty-palgrave/cache.interval.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-palgrave/cache.interval.properties.$servergroup",
								"puppet:///modules/natureapps/jetty-palgrave/cache.interval.properties.default",
            ];
        "/usr/local/jetty-palgrave/etc/foxtrot_mini.properties":
            source  => [
                "puppet:///confidential/natureapps/jetty-palgrave/foxtrot_mini.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-palgrave/foxtrot_mini.properties.$servergroup",
								"puppet:///modules/natureapps/jetty-palgrave/foxtrot_mini.properties.default",
            ];
        "/usr/local/jetty-palgrave/etc/foxtrot.properties":
            source  => [
                "puppet:///confidential/natureapps/jetty-palgrave/foxtrot.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-palgrave/foxtrot.properties.$servergroup",
								"puppet:///modules/natureapps/jetty-palgrave/foxtrot.properties.default",
            ];
        "/usr/local/jetty-palgrave/etc/jdbcRealm.properties":
            source  => [
                "puppet:///confidential/natureapps/jetty-palgrave/jdbcRealm.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-palgrave/jdbcRealm.properties.$servergroup",
								"puppet:///modules/natureapps/jetty-palgrave/jdbcRealm.properties.default",
            ];
        "/usr/local/jetty-palgrave/etc/journal-search.properties":
            source  => [
                "puppet:///confidential/natureapps/jetty-palgrave/journal-search.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-palgrave/journal-search.properties.$servergroup",
								"puppet:///modules/natureapps/jetty-palgrave/journal-search.properties.default",
            ];
        "/usr/local/jetty-palgrave/etc/login.properties":
            source  => [
                "puppet:///confidential/natureapps/jetty-palgrave/login.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-palgrave/login.properties.$servergroup",
								"puppet:///modules/natureapps/jetty-palgrave/login.properties.default",
            ];
        "/usr/local/jetty-palgrave/etc/palgraveConnectFreeTitleAccess.properties":
            source  => [
                "puppet:///confidential/natureapps/jetty-palgrave/palgraveConnectFreeTitleAccess.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-palgrave/palgraveConnectFreeTitleAccess.properties.$servergroup",
								"puppet:///modules/natureapps/jetty-palgrave/palgraveConnectFreeTitleAccess.properties.default",
            ];
        "/usr/local/jetty-palgrave/etc/palgrave-journals.properties":
            source  => [
                "puppet:///confidential/natureapps/jetty-palgrave/palgrave-journals.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-palgrave/palgrave-journals.properties.$servergroup",
								"puppet:///modules/natureapps/jetty-palgrave/palgrave-journals.properties.default",
            ];
        "/usr/local/jetty-palgrave/etc/realm.properties":
            source  => [
                "puppet:///confidential/natureapps/jetty-palgrave/realm.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-palgrave/realm.properties.$servergroup",
								"puppet:///modules/natureapps/jetty-palgrave/realm.properties.default",
            ];
  }
}
