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
