function recompile_packages()
    for pkg in keys(Pkg.installed())
        try
            info("Compiling: $pkg")
            eval(Expr(:toplevel, Expr(:using, Symbol(pkg))))
            println(SEPARATOR)
        catch err
            warn("Unable to precompile: $pkg")
            warn(err)
            println(SEPARATOR)
        end
    end
end

emerge() = (Pkg.update(); Pkg.build(); recompile_packages())
