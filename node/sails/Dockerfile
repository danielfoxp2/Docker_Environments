FROM nodebox

RUN apk add --update build-base sudo python \
    && sudo npm install -g --unsafe-perm sails \ 
    && apk del build-base \
    && rm -rf /tmp/* /var/log/* /var/tmp/* /var/cache/apk/* 


EXPOSE 1337
#For some reason that I do not know, sails is just completely installed if you run npm with sudo permissions.
#And to be abble to run npm with sudo, the --unsafe-perm is needed.
#In fact, the one who mess up with all is node-gyp.
#then, it was needed make to run something for node-gyp. So to be sure I installed build-base (because I suposed that gcc would be a dependency too).
#So that's the result. 

