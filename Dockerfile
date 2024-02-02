FROM ubuntu
RUN apt update
RUN apt install -y curl openssl xdg-utils
RUN curl -OL https://downloads.mongodb.org/migrator/1.4.4/mongodb-relational-migrator_1.4.4_amd64.deb
RUN mkdir -p /usr/share/desktop-directories
RUN dpkg -i mongodb-relational-migrator_1.4.4_amd64.deb
EXPOSE 8278
RUN mkdir -p /root/Migrator
COPY user.properties /root/Migrator/user.properties

CMD /opt/mongodb-relational-migrator/bin/mongodb-relational-migrator
