
Pkg.update()
libs = strip.(readlines("julia_packages.txt"))
for l in libs
    info("Adding package $l...")
    Pkg.add(l)
end

Pkg.clone("https://github.com/OpenMendel/MendelBase.jl.git")
Pkg.clone("https://github.com/OpenMendel/MendelGWAS.jl.git")
Pkg.clone("https://github.com/OpenMendel/MendelKinship.jl.git")
Pkg.clone("https://github.com/OpenMendel/SnpArrays.jl.git")
Pkg.clone("https://github.com/OpenMendel/VarianceComponentModels.jl.git")
