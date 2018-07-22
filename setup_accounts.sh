#!/bin/sh
ulist=("hzhou" "jsinsheimer" "esobel" "jkim" "bgaucher" "cgerman" "kjablonski" "sji" "sko" "cnieuwoudt" "golbricht" "aparedes" "grochester" "bsimkins" "myoung")
for u in "${ulist[@]}"
  do
    echo "create account for $u"
    useradd -m "$u"
    echo -e "jsmce18c\njsmce18c" | passwd "$u" 
    chsh -s /bin/bash "$u"
    echo "precompile Julia packages"
    su - "$u" -c 'julia -e compilepkgs.jl'
  done
  