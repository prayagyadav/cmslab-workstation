# Extract info from the server


# IP Address
ip_address="$(ip address | grep eth0 | grep inet | awk '{print $2}' | cut -d '/' -f 1)"
echo "IP: ${ip_address}"





# Update the json
jq '.last_updated = "$(date)" | .ipaddress = "${ip_address}"' dashboard.json > tmp.json && mv tmp.json dashboard.json

