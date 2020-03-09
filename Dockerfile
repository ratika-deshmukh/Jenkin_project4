FROM yogi9312/centos:7
MAINTAINER "yogita" yogitasoni9312@gmail.com
ENV container docker
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in ; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done);
RUN rm -rf /lib/systemd/system/multi-user.target.wants/;
RUN rm -rf /etc/systemd/system/.wants/;
RUN rm -rf /lib/systemd/system/local-fs.target.wants/;
RUN rm -rf /lib/systemd/system/sockets.target.wants/udev;
RUN rm -rf /lib/systemd/system/sockets.target.wants/initctl;
RUN rm -rf /lib/systemd/system/basic.target.wants/;
RUN rm -rf /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ “/sys/fs/cgroup” ]
RUN yum install openssh* -y
VOLUME [ “/sys/fs/cgroup” ]
ARG package1="openssh-server"
ARG op=install
RUN yum ${op} ${package1} -y
RUN echo "UseDNS no" >> /etc/ssh/sshd_config
ENTRYPOINT ["/usr/sbin/init"]
