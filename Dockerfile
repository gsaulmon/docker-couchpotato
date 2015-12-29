FROM fedora:23

RUN dnf update -y \
	&& dnf install -y --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm \
	&& dnf install -y git wget python-cheetah pyOpenSSL par2cmdline unzip unrar tar \
	&& dnf clean all \
	&& git clone https://github.com/RuudBurger/CouchPotatoServer.git /opt/couchpotato

VOLUME /opt/config
VOLUME /opt/data

EXPOSE 5050

ENTRYPOINT ["python", "/opt/couchpotato/CouchPotato.py", "--data_dir=/opt/config/couchpotato"]