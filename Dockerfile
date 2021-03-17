FROM sameersbn/bind
ENV DEBIAN_FRONTEND=noninteractive
RUN echo 'root:yesitispassword' | chpasswd
RUN apt update && apt install -y openssh-server && mkdir /var/run/sshd
RUN mkdir /root/.ssh && chmod 0700 /root/.ssh && ssh-keygen -A
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
ENTRYPOINT service ssh start && /sbin/entrypoint.sh