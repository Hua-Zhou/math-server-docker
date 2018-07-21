#!/bin/sh
ulist=("hzhou" "jsinsheimer" "esobel" "jkim" "bgaucher" "cgerman" "kjablonski" "sji" "sko" "cnieuwoudt" "golbricht" "aparedes" "grochester" "bsimkins" "myoung")
for u in "${ulist[@]}"
  do
    echo "create account for $u"
    useradd -m "$u"
    echo -e "jsmce18c\njsmce18c" | passwd "$u" 
    chsh -s /bin/bash "$u"
    echo "precompile Julia packages"
    su - "$u" -c 'julia -e "using BenchmarkTools, SCS, Convex, CSV, DataFrames, Distributions, GLM, GR, HDF5, Ipopt, IterativeSolvers, JuliaDB, JuMP, LinearMaps, MathProgBase, MendelBase, MendelGWAS, MendelKinship, MixedModels, Plots, Plotly, PlotlyJS, PyCall, PyPlot, RCall, SnpArrays, StatsBase"'
    exit
  done
  