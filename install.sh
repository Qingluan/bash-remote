#!/bin/sh
cd /tmp && git clone https://github.com/Qingluan/bash-remote.git && sleep 1 cd bash-remote/src && cp remote-vi.sh /usr/local/bin/ss  && sudo chmod +x /usr/local/bin/ss && echo "#tag    xxx@xxx.domain.com" >> ~/.tag_for_remote ;
