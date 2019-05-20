#! /bin/bash
my_ip=$(ip route get 8.8.8.8 | head -1 | cut -d' ' -f8)
port=8888
echo "Flight Review webpage will be available at $my_ip:$port"
/usr/bin/python3.5 /flight_review/serve.py --port=8888 --allow-websocket-origin=$my_ip:$port
