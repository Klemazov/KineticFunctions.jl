module KineticFunctions
    using StaticArrays
include("functions.jl")
include("rateconstant.jl")
include("temperaturemodels.jl")
include("KineticLinearRegressionTools.jl")
include("data_parser.jl")
const R = 8.31;
export 
    R,
    TGParser, TGDataFrame, tgdftodf
    fn, pn, af, pt, ks, sb,
    FNModel,PNModel,AFModel,PTModel,KSModel,SBModel,
    K,
    KModel,
    LinearHeating
end
