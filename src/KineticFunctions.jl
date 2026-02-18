module KineticFunctions
    using StaticArrays
include("functions.jl")
include("rateconstant.jl")
include("temperaturemodels.jl")
include("KineticLinearRegressionTools.jl")
include("DataParser.jl")
const R = 8.31;
export 
    R,
    fn, pn, af, pt, ks, sb,
    FNModel,PNModel,AFModel,PTModel,KSModel,SBModel,
    K,
    KModel,
    LinearHeating,
    TGParser, TGDataFrame
end
