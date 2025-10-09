
#levantar un http rapidongo para probar
python3 -m http.server 8080 --bind 127.0.0.1
python3 -m http.server 9080 --bind 127.0.0.1

#configurar stats de haproxy  /etc/haproxy/haproxy.cfg 
listen stats
    bind *:8404
    stats enable
    stats uri /stats
    stats refresh 10s
    stats auth admin:adminpassword


sudo apt install -y htop iftop

sudo apt-get install netdata -y


wget https://github.com/prometheus/haproxy_exporter/releases/latest/download/haproxy_exporter-0.15.0.linux-amd64.tar.gz
tar -xvzf haproxy_exporter-*.tar.gz
cd haproxy_exporter-*/
sudo mv haproxy_exporter /usr/local/bin/


sudo tee /etc/systemd/system/haproxy_exporter.service > /dev/null <<EOF
[Unit]
Description=Prometheus HAProxy Exporter
After=network.target

[Service]
ExecStart=/usr/local/bin/haproxy_exporter \
  --haproxy.scrape-uri="http://localhost:8404/stats;csv"
Restart=always

[Install]
WantedBy=multi-user.target
EOF


sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable --now haproxy_exporter