FROM stocks29/plenv-vanilla:5.18.0

RUN . /etc/profile; plenv global 5.18.0
RUN . /etc/profile; plenv install-cpanm
RUN . /etc/profile; plenv rehash
RUN . /etc/profile; cpanm Carton
