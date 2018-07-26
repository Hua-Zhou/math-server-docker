#!/bin/sh

echo "precompile Julia packages as root"
julia compilepkgs.jl

ulist=("hzhou" "jsinsheimer" "esobel" "jzhou" "jkim" "bgaucher" "cgerman" "kjablonski" "sji" "sko" "cnieuwoudt" "golbricht" "aparedes" "grochester" "bsimkins" "myoung")
for u in "${ulist[@]}"
  do
    echo "create account for $u"
    useradd -m "$u"
    echo -e "jsmce18c\njsmce18c" | passwd "$u"
    echo "copy precompiled Julia packages to $u"
    mkdir "/home/$u/.julia"
    cp -r /usr/local/julia/share/julia/site/lib "/home/$u/.julia"
    chown -R "$u:$u" "/home/$u/.julia"
  done

