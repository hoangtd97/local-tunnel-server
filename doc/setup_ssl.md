## For single domain: abc.com

- use file validation

```

- run:

  > sudo certbot certonly --manual -d tunnel.kubo.vn

- edit server to response exactly file

- restart server in http mode:

  > sudo DEBUG=* node bin/server.js --port 80 --domain tunnel.kubo.vn > http.log 2>&1

- press enter

- restart server in https mode

  > sudo systemctl restart localtunnel

```

## For wildcard domain: *.abc.com

- use DNS record:

```
- run: 

  > sudo certbot certonly --manual -d *.tunnel.kubo.vn

- add DNS record to domain

- press enter

- restart server

  > sudo systemctl restart localtunnel

```

## Other info

To use Certbot with manual DNS record addition on Ubuntu, you can follow these steps to obtain an SSL/TLS certificate for your domain:

1. **Install Certbot:**

   Ensure you have Certbot installed on your Ubuntu system. You can install Certbot and the DNS plugin for your DNS provider (in this case, the manual DNS plugin) using the following command:

   ```bash
   sudo apt-get install certbot python3-certbot-dns-manual
   ```

2. **Create a DNS TXT Record:**

   You will need to create a DNS TXT record manually for your domain with the required values that Certbot will use to verify your domain ownership. The DNS TXT record should be created in your DNS provider's control panel.

   For example, if you are using a subdomain like `sub.example.com`, you might create a DNS TXT record like this:

   ```
   Name: _acme-challenge.sub.example.com
   Type: TXT
   Value: [The_challenge_value_provided_by_Certbot]
   ```

3. **Run Certbot with Manual DNS Challenge:**

   Now, you can run Certbot to obtain the SSL/TLS certificate using the manual DNS challenge method. Replace `sub.example.com` with your actual domain and `[The_challenge_value_provided_by_Certbot]` with the challenge value provided by Certbot.

   ```bash
   sudo certbot certonly --manual --preferred-challenges dns -d sub.example.com

   sudo certbot certonly --manual -d *.tunnel.kubo.vn
   ```

   Certbot will prompt you to enter the challenge value and wait for you to add the DNS TXT record. Once you've added the DNS TXT record to your DNS provider, press Enter to let Certbot continue.

4. **Verify and Install Certificate:**

   If everything is configured correctly, Certbot will complete the challenge and obtain the SSL/TLS certificate. The certificate and related files will be saved in `/etc/letsencrypt/live/sub.example.com/` (replace `sub.example.com` with your actual domain).

5. **Automate Certificate Renewal:**

   Certbot will automatically renew your certificates before they expire. You can set up a cron job to automate this process. To renew certificates, run:

   ```bash
   sudo certbot renew
   ```

   You can schedule this command to run periodically using a cron job.

Please note that the steps provided are for a manual DNS challenge, which can be useful if you don't have a DNS provider with an API supported by Certbot. However, it's more convenient to use Certbot with DNS plugins if your DNS provider is supported. DNS plugins allow for automatic DNS record management during certificate issuance and renewal.


sudo certbot certonly --manual -d tunnel.kubo.vn
Saving debug log to /var/log/letsencrypt/letsencrypt.log
Requesting a certificate for tunnel.kubo.vn

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Create a file containing just this data:

pnkTCMGc3gR5mFrXunmXPhz8424JvSDChCgYIusMV1k.Hlt9nYeb7gE4mmOGWmGQ6e_9kvChib3GhOEOLfrOY6s

And make it available on your web server at this URL:

http://tunnel.kubo.vn/.well-known/acme-challenge/pnkTCMGc3gR5mFrXunmXPhz8424JvSDChCgYIusMV1k

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Press Enter to Continue

Successfully received certificate.
Certificate is saved at: /etc/letsencrypt/live/tunnel.kubo.vn/fullchain.pem
Key is saved at:         /etc/letsencrypt/live/tunnel.kubo.vn/privkey.pem
This certificate expires on 2023-12-15.
These files will be updated when the certificate renews.

NEXT STEPS:
- This certificate will not be renewed automatically. Autorenewal of --manual certificates requires the use of an authentication hook script (--manual-auth-hook) but one was not provided. To renew this certificate, repeat this same certbot command before the certificate's expiry date.

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
If you like Certbot, please consider supporting our work by:
 * Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
 * Donating to EFF:                    https://eff.org/donate-le
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -