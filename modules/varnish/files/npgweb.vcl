# This configuration file is managed by puppet.  Do not change manually.

backend npgwebvip {
        .host = "127.0.0.1";
        .port = "8080";
}

sub vcl_recv {
        set req.backend = npgwebvip;

	if (req.http.x-forwarded-for) {
		set req.http.X-Forwarded-For = req.http.X-Forwarded-For ", " client.ip; 
	} else {
		set req.http.X-Forwarded-For = client.ip;
	}

	if (req.http.Cache-Control ~ "no-cache") {
        purge_url(req.url);
    }

	if (req.request == "POST") {
		return (pass);
	}

		# For static content, unset cookies and look up in cache
	if (req.url ~ "\.(js|css|pdf|ico|jpg|jpeg|gif|png|swf|flv)$") {
		unset req.http.Cookie;
		return (lookup);
	}

	return (pass);
}



sub vcl_fetch {
	if (beresp.http.Pragma ~ "no-cache" 
	    || beresp.http.Cache-Control ~ "no-cache" 
		|| beresp.http.Cache-Control ~ "private") {
			return (pass);
	}

		# For static content we got from back end, drop cookie before putting into cache
	if (req.url ~ "\.(js|css|pdf|ico|jpg|jpeg|gif|png|swf|flv)$") {
		set beresp.ttl = 4h;
		unset beresp.http.set-cookie;
		return(deliver);
	}
    if (beresp.http.Set-Cookie) {
        return (pass);
    }
}


sub vcl_error {
    set obj.http.Content-Type = "text/html; charset=utf-8";
    synthetic {"
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
  <head>
    <title>NPG Project Denver</title>
 <meta http-equiv="refresh" content="10"> 
 </head>
  <body>
    <h1>EC2 Instance Varnish</h1>
<font face="Arial, helvetica, sans-serif" size="3"><b>Site Under Maintenance</b></font>
		<p>
<font face="Arial, helvetica, sans-serif" size="3">

		Sorry for the inconvenience.  The site is currently shut down for maintenance. Please check back later. 
		<br>
		Thank you for your understanding. 
		<p>
		Webmaster
		<br>
		you-know-who
		</font>
    
  </body>
</html>
"};
    return (deliver);
}

sub vcl_pipe {
		#set x-forwarded-for on all
	set req.http.connection = "close"; 
}
