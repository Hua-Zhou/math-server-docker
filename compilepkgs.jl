function recompile_packages()
    for pkg in ["BenchmarkTools", "SCS", "Convex", "CSV", "DataFrames", 
        "Distributions", "GLM", "GR", "HDF5", "Ipopt", "IterativeSolvers", 
        "JuliaDB", "JuMP", "LinearMaps", "MathProgBase", "MendelBase", 
        "MendelGWAS", "MendelKinship", "MixedModels", "Plots", "Plotly", 
        "PlotlyJS", "PyCall", "RCall", "SnpArrays"]
        try
            info("Compiling: $pkg")
            eval(Expr(:toplevel, Expr(:using, Symbol(pkg))))
            println()
        catch err
            warn("Unable to precompile: $pkg")
            warn(err)
            println()
        end
    end
end

emerge() = (Pkg.update(); Pkg.build(); recompile_packages())
emerge()
