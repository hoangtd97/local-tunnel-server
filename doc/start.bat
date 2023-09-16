sudo DEBUG=* node bin/server.js --port 80 --domain tunnel.kubo.vn > http.log 2>&1
sudo DEBUG=* node bin/server.js --port 443 --secure true --domain tunnel.kubo.vn > https.log 2>&1