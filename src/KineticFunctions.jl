module KineticFunctions
    using StaticArrays
    #using Revise

include("functions.jl")
include("rateconstant.jl")
include("temperaturemodels.jl")
const R = 8.31;
export 
    R,
    fn, pn, af, pt, ks, sb,
    FNModel,PNModel,AFModel,PTModel,KSModel,SBModel,
    K,
    KModel,
    LinearHeating
end
