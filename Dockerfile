FROM rockylinux:8.7
RUN dnf update
# Set up base packages that are expected
RUN dnf -y install openssh-server openssh-clients crontabs NetworkManager firewalld selinux-policy ncurses which net-tools
RUN systemctl mask dev-mqueue.mount dev-hugepages.mount \
     systemd-remount-fs.service sys-kernel-config.mount \
     sys-kernel-debug.mount sys-fs-fuse-connections.mount \
     graphical.target systemd-logind.service \
     NetworkManager.service systemd-hostnamed.service

# Install Ansible
RUN dnf install epel-release -y
RUN dnf install ansible -y
STOPSIGNAL SIGRTMIN+3
# SSHd setup
EXPOSE 22
#COPY docker.pub /root/.ssh/authorized_keys
CMD ["/sbin/init"]
ENTRYPOINT ["/lib/systemd/systemd"]
