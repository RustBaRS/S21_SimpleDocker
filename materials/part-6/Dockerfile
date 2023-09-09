FROM nginx:latest
USER root
COPY ./hello.c /home/dockle/
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./start_point.sh /home/dockle/

RUN useradd -g daemon -d /home/dockle -m -s /bin/bash dockle; \
    chown -R dockle:daemon /var/cache/nginx/ /var/run/ /var/log/nginx/; \
    apt-get install -y gcc libfcgi-dev spawn-fcgi; \
    gcc -o /home/dockle/mini_server /home/dockle/hello.c -lfcgi; \
    apt-get clean && rm -rf /var/lib/apt/lists/*; 
# && --mount=type=secret,id=gnupgkey,target=/gnupgkey.txt && GNUPG_KEY=$(cat /gnupgkey.txt) && echo "$GNUPG_KEY" > /gnupg.key
# chmod 644 /home/hello.c /home/start_point.sh

WORKDIR /home/dockle

# Set the entrypoint command
# ENTRYPOINT ["sh", "./start_point.sh"]

# Set Docker content trust
# ENV DOCKER_CONTENT_TRUST=1

# Add HEALTHCHECK instruction
USER dockle
HEALTHCHECK --interval=30s --timeout=3s CMD curl --fail http://localhost/ || exit 1

CMD ["/bin/bash", "-c", "nginx -g 'daemon off;' | nginx -s reload | spawn-fcgi -p 8080 -n /home/dockle/mini_server"]