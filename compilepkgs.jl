function recompile_packages()
    for pkg in ["BenchmarkTools", "SCS", "Convex", "CSV", "DataFrames", 
        "Distributions", "FFTW", "GeneticVariation", "GLM", "GR", 
        "HDF5", "HypothesisTests", 
        "ImageMagick", "Images", "Ipopt", "IterativeSolvers", 
        "JuliaDB", "JuMP", "LinearMaps", "MathProgBase", "MendelBase", 
        "MendelGWAS", "MendelKinship", "MixedModels", "NullableArrays", 
        "Plots", "Plotly", "PlotlyJS", 
        "Gadfly", # need to be after Plotly to successfully compile
        "ProgressMeter",
        "PyCall", "RCall", "SnpArrays", "VCFTools"]
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
