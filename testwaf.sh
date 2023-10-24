# Set the JUICESHOP_URL variable if not already done
# JUICESHOP_URL=<Your Juice Shop URL>
JUICESHOP_URL=CHANGE ME

# This imitates a Cross Site Scripting attack in POST request
# This request should be blocked.
curl -X POST  $JUICESHOP_URL -F "user='<script><alert>Hello></alert></script>'"

# This imitates a SQL Injection attack in POST request
# This request should be blocked.
curl -X POST $JUICESHOP_URL -F "user='AND 1=1;"


# This imitates a Cross Site Scripting attack in GET request
# This request should be blocked.
curl $JUICESHOP_URL -F "user='<script><alert>Hello></alert></script>'"

# This imitates bad bot user agent "havij"
# This request should be blocked.
curl $JUICESHOP_URL -A"havij"
curl -Ii http://$JUICESHOP_URL -H "User-Agent: blackwidow"

# This imitates LFI attack"
# This request should be blocked.
curl -Ii http://$JUICESHOP_URL/ftp/../

# This imitates RCE attack"
# This request should be blocked.
curl -Ii http://$JUICESHOP_URL/ftp?doc=/bin/ls

# This imitates HTTP splitting"
# This request should be blocked.
curl -Ii "http://$JUICESHOP_URL?foo=advanced%0d%0aContent-Length:%200%0d%0a%0d%0aHTTP/1.1%20200%20OK%0d%0aContent-Type:%20text/html%0d%0aContent-Length:%2035%0d%0a%0d%0a<html>Sorry,%20System%20Down</html>"

# This imitates session fixation"
# This request should be blocked.
curl -Ii http://$JUICESHOP_URL -H session_id=X
