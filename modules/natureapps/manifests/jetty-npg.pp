#Todo: 
# Change this to a defined resource
## Put into a base class:
## define appprop($path,$container,$name) {
##   file { "$path/$name":
##			owner => "xb3",
##			group => "xb3",
##			mode => "640",
##			source => ["puppet:///modules/natureapps/$container/$name.$hostname", 
##				"puppet:///modules/natureapps/$container/$name.$hostname",
##				"puppet:///modules/natureapps/$container/$name.default",]
##			}
##
##  Then within the container class:
## approp(name=>"api.properties", container=>"jetty-npg", path=>"/usr/local/jetty-npg/etc")
## approp(name=>"bibit_foxtrot.properties", container=>"jetty-npg", path=>"/usr/local/jetty-npg/etc")

## Next todo:  Change source to be template based and concatenate confidential/ and normal

class natureapps::jetty-npg {
  case $servergroup {
    'staging', 'live': { include jetty::npg }
    'test', 'sandbox': {  include jetty::npgnew }
  } 
    # Override defaults for all files
	if ( $servergroup == 'test' ) or ($servergroup == 'sandbox') {
	  File {
	    owner => "xb3",
  	  group => "xb3",
    	mode  => 644,
			require => File["/usr/local/jetty-npg"],
  	}
	} else {
		File {
			owner => "xb3",	
			group => "xb3",
			mode => 644,
		}
	}
    file {
        "/usr/local/jetty-npg/etc/api.properties":
            source  => [
                "puppet:///confidential/natureapps/jetty-npg/api.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-npg/api.properties.$servergroup",
                "puppet:///modules/natureapps/jetty-npg/api.properties.default",
            ];
        "/usr/local/jetty-npg/etc/bibit_foxtrot.properties":
            source  => [
                "puppet:///confidential/natureapps/jetty-npg/bibit_foxtrot.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-npg/bibit_foxtrot.properties.$servergroup",
                "puppet:///modules/natureapps/jetty-npg/bibit_foxtrot.properties.default",
            ];
        "/usr/local/jetty-npg/etc/bibit_labanimal.properties":
            source  => [
                "puppet:///confidential/natureapps/jetty-npg/bibit_labanimal.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-npg/bibit_labanimal.properties.$servergroup",
                "puppet:///modules/natureapps/jetty-npg/bibit_labanimal.properties.default",
            ];
        "/usr/local/jetty-npg/etc/cache.interval.properties":
            source  => [
                "puppet:///confidential/natureapps/jetty-npg/cache.interval.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-npg/cache.interval.properties.$servergroup",
                "puppet:///modules/natureapps/jetty-npg/cache.interval.properties.default",
            ];
        "/usr/local/jetty-npg/etc/commenting.properties":
            source  => [
                "puppet:///confidential/natureapps/jetty-npg/commenting.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-npg/commenting.properties.$servergroup",
                "puppet:///modules/natureapps/jetty-npg/commenting.properties.default",
            ];
        "/usr/local/jetty-npg/etc/contentstore-uploader.properties":
            source  => [
                "puppet:///confidential/natureapps/jetty-npg/contentstore-uploader.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-npg/contentstore-uploader.properties.$servergroup",
                "puppet:///modules/natureapps/jetty-npg/contentstore-uploader.properties.default",
            ];
        "/usr/local/jetty-npg/etc/epub-server.properties":
            source  => [
                "puppet:///confidential/natureapps/jetty-npg/epub-server.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-npg/epub-server.properties.$servergroup",
                "puppet:///modules/natureapps/jetty-npg/epub-server.properties.default",
            ];
        "/usr/local/jetty-npg/etc/foxtrot_mini.properties":
            source  => [
                "puppet:///confidential/natureapps/jetty-npg/foxtrot_mini.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-npg/foxtrot_mini.properties.$servergroup",
                "puppet:///modules/natureapps/jetty-npg/foxtrot_mini.properties.default",
            ];
        "/usr/local/jetty-npg/etc/foxtrot.properties":
            source  => [
                "puppet:///confidential/natureapps/jetty-npg/foxtrot.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-npg/foxtrot.properties.$servergroup",
                "puppet:///modules/natureapps/jetty-npg/foxtrot.properties.default",
            ];
        "/usr/local/jetty-npg/etc/jdbcRealm.properties":
            source  => [
                "puppet:///confidential/natureapps/jetty-npg/jdbcRealm.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-npg/jdbcRealm.properties.$servergroup",
                "puppet:///modules/natureapps/jetty-npg/jdbcRealm.properties.default",
            ];
        "/usr/local/jetty-npg/etc/jitterbug.properties":
            source  => [
                "puppet:///confidential/natureapps/jetty-npg/jitterbug.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-npg/jitterbug.properties.$servergroup",
                "puppet:///modules/natureapps/jetty-npg/jitterbug.properties.default",
            ];
        "/usr/local/jetty-npg/etc/journal-search.properties":
            source  => [
                "puppet:///confidential/natureapps/jetty-npg/journal-search.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-npg/journal-search.properties.$servergroup",
                "puppet:///modules/natureapps/jetty-npg/journal-search.properties.default",
            ];
        "/usr/local/jetty-npg/etc/labanimal.properties":
            source  => [
                "puppet:///confidential/natureapps/jetty-npg/labanimal.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-npg/labanimal.properties.$servergroup",
                "puppet:///modules/natureapps/jetty-npg/labanimal.properties.default",
            ];
        "/usr/local/jetty-npg/etc/laban-search.properties":
            source  => [
                "puppet:///confidential/natureapps/jetty-npg/laban-search.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-npg/laban-search.properties.$servergroup",
                "puppet:///modules/natureapps/jetty-npg/laban-search.properties.default",
            ];
        "/usr/local/jetty-npg/etc/login.properties":
            source  => [
                "puppet:///confidential/natureapps/jetty-npg/login.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-npg/login.properties.$servergroup",
                "puppet:///modules/natureapps/jetty-npg/login.properties.default",
            ];
        "/usr/local/jetty-npg/etc/mobile.properties":
            source  => [
                "puppet:///confidential/natureapps/jetty-npg/mobile.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-npg/mobile.properties.$servergroup",
                "puppet:///modules/natureapps/jetty-npg/mobile.properties.default",
            ];
        "/usr/local/jetty-npg/etc/oai.properties":
            source  => [
                "puppet:///confidential/natureapps/jetty-npg/oai.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-npg/oai.properties.$servergroup",
                "puppet:///modules/natureapps/jetty-npg/oai.properties.default",
            ];
        "/usr/local/jetty-npg/etc/opensearch.properties":
            source  => [
                "puppet:///confidential/natureapps/jetty-npg/opensearch.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-npg/opensearch.properties.$servergroup",
                "puppet:///modules/natureapps/jetty-npg/opensearch.properties.default",
            ];
        "/usr/local/jetty-npg/etc/realm.properties":
            source  => [
                "puppet:///confidential/natureapps/jetty-npg/realm.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-npg/realm.properties.$servergroup",
                "puppet:///modules/natureapps/jetty-npg/realm.properties.default",
            ];
        "/usr/local/jetty-npg/etc/restletLog.properties":
            source  => [
                "puppet:///confidential/natureapps/jetty-npg/restletLog.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-npg/restletLog.properties.$servergroup",
                "puppet:///modules/natureapps/jetty-npg/restletLog.properties.default",
            ];
        "/usr/local/jetty-npg/etc/press.properties":
            source  => [
                "puppet:///confidential/natureapps/jetty-npg/press.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-npg/press.properties.$servergroup",
                "puppet:///modules/natureapps/jetty-npg/press.properties.default",
            ];
        "/usr/local/jetty-npg/etc/site_license_pricing.properties":
            source  => [
                "puppet:///confidential/natureapps/jetty-npg/site_license_pricing.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-npg/site_license_pricing.properties.$servergroup",
                "puppet:///modules/natureapps/jetty-npg/site_license_pricing.properties.default",
            ];
        "/usr/local/jetty-npg/etc/xb3.properties":
            source  => [
                "puppet:///confidential/natureapps/jetty-npg/xb3.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-npg/xb3.properties.$servergroup",
                "puppet:///modules/natureapps/jetty-npg/xb3.properties.default",
            ];
        "/usr/local/jetty-npg/etc/opensearch-clientprofiles.properties":
            source  => [
                "puppet:///confidential/natureapps/jetty-npg/opensearch-clientprofiles.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-npg/opensearch-clientprofiles.properties.$servergroup",
                "puppet:///modules/natureapps/jetty-npg/opensearch-clientprofiles.properties.default",
            ];
        "/usr/local/jetty-npg/etc/ecommerce.properties":
            source  => [
                "puppet:///confidential/natureapps/jetty-npg/ecommerce.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-npg/ecommerce_$servergroup.properties",
            ];
        "/usr/local/jetty-npg/etc/forwarder.properties":
            source  => [
                "puppet:///modules/natureapps/jetty-npg/forwarder.properties.$hostname",
                "puppet:///modules/natureapps/jetty-npg/forwarder.properties.$servergroup",
            ];
        "/usr/local/jetty-npg/etc/access-info-api.properties":
            source  => [
                "puppet:///confidential/natureapps/jetty-npg/access-info-api.properties.$hostname",
                "puppet:///confidential/natureapps/jetty-npg/access-info-api.properties.$servergroup",
            ];
        "/usr/local/jetty-npg/etc/puppetdummy.properties": ensure => absent 
    }
}
