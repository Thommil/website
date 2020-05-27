FROM nginx:latest

COPY sites-enabled/* /etc/nginx/conf.d/

COPY ssl/server.crt /etc/nginx/conf.d/server.crt
COPY ssl/server.key /etc/nginx/conf.d/server.key

RUN mkdir -p /var/www/html
COPY html/* /var/www/html/

# RUN apt-get update && apt-get install -y wget

# RUN wget https://dl.eff.org/certbot-auto
# RUN mv certbot-auto /usr/local/bin/certbot-auto
# RUN chown root /usr/local/bin/certbot-auto
# RUN chmod 0755 /usr/local/bin/certbot-auto

# RUN echo "0 0,12 * * * root python -c 'import random; import time; time.sleep(random.random() * 3600)' && /usr/local/bin/certbot-auto renew" | tee -a /etc/crontab > /dev/null
