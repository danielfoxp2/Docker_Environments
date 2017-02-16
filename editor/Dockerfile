FROM alpine:latest

RUN apk add --update \
    bash \
    tree \
    tmux \
    git \
    python \
    python-dev \
    ruby \
    ruby-dev \
    ctags \
    build-base \
    make \
    libxpm-dev \
    libx11-dev \
    libxt-dev \
    ncurses-dev \
    && cd /tmp \
    && git clone https://github.com/vim/vim.git/ \
    && cd /tmp/vim \
    && ./configure --with-features=big \
                   --enable-multibyte \
                   --enable-pythoninterp \
                   --with-python-config-dir=/usr/lib/python2.7/config \
                   --enable-rubyinterp \
                   --with-ruby-command=/usr/bin/ruby \
                   --disable-gui \
                   --disable-netbeans \
                   --prefix /usr \
    && make VIMRUNTIMEDIR=/usr/share/vim/vim80 \
    && make install \
    && apk del ctags build-base make libxpm-dev libx11-dev libxt-dev ncurses-dev \
    && apk add --update libsm libice libxt libx11 ncurses \
    && rm -rf /tmp/* /var/log/* /var/tmp/* /var/cache/apk/* \
    && cd $HOME \
    && git clone https://github.com/danielfoxp2/dotfiles.git \
    && git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim \
    && git config --global core.editor vim \
    && mv $HOME/dotfiles/.vim/colors $HOME/.vim/colors \
    && mv $HOME/dotfiles/.vimrc $HOME/.vimrc \
    && mv $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf \
    && rm -rf /var/cache/apk/* $HOME/dotfiles \
    && apk --no-cache add docker


