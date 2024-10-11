envsubst '${DOMAIN_NAME} ${SSL_CERT_PATH} ${SSL_KEY_PATH}' < /etc/nginx/templates/default.conf.template > /etc/nginx/sites-available/minsepar.42.fr

ln -s /etc/nginx/sites-available/minsepar.42.fr /etc/nginx/sites-enabled/
    
nginx -g "daemon off;"