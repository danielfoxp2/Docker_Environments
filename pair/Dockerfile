FROM devbox

RUN apk add --update \
    openssh \
    && gem install github-auth --no-rdoc --no-ri \
    && rc-update add sshd \
    && rc-status \
    && touch /run/openrc/softlevel \
    && /etc/init.d/sshd start \
    && echo "AllowAgentForwarding yes" >> /etc/ssh/sshd_config \
    && /etc/init.d/sshd stop \
    
    && git clone git://github.com/zolrath/wemux.git /usr/local/share/wemux \
    && ln -s /usr/local/share/wemux/wemux /usr/local/bin/wemux \
    && mkdir /usr/local/etc/ \
    && cp /usr/local/share/wemux/wemux.conf.example /usr/local/etc/wemux.conf \
    && echo "host_list=(root)" >> /usr/local/etc/wemux.conf \
    && echo "Welcome to the world of Pair Programming. To start is just type wemux attach or wemux rogue" > /etc/motd \

    && git clone https://github.com/danielfoxp2/dotfiles \
    && mv dotfiles/ssh_key_adder.rb /root/ \
    && chmod 700 /root/ssh_key_adder.rb \
    && rm -rf dotfiles/ /var/cache/apk/*

EXPOSE 22

CMD ruby /root/ssh_key_adder.rb && /usr/sbin/sshd -D 
