module KineticFunctions
    using StaticArrays

include("functions.jl")
include("rateconstant.jl")
include("temperaturemodels.jl")
export 
    fn, pt, ks, 
    FNModel, PTModel
    K
    KModel
    LinearHeating

end
