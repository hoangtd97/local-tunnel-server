## Setup service localtunnel

- create service file

```sh

sudo nano /etc/systemd/system/localtunnel.service

```

- edit content

```

[Unit]
Description=Local Tunnel Service

[Service]
ExecStart=sudo node /home/ubuntu/app/source/bin/server.js --port 443 --secure true --domain tunnel.kubo.vn
Restart=always
User=ubuntu

[Install]
WantedBy=multi-user.target

```

- reload system

```sh

sudo systemctl daemon-reload

```

- start service

```sh

sudo systemctl start localtunnel
sudo systemctl enable localtunnel

```

- check service status

```sh

sudo systemctl status localtunnel

```