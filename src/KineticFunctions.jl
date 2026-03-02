module KineticFunctions
    using StaticArrays
    using Statistics
    using CSV
    using DataFrames
include("functions.jl")
include("rateconstant.jl")
include("temperaturemodels.jl")
include("KineticLinearRegressionTools.jl")
include("data_parser.jl")
include("utils.jl")
const R = 8.31;
export 
    R,
    TGParser, TGDataFrame,
    fn, pn, af, pt, ks, sb,
    FNModel,PNModel,AFModel,PTModel,KSModel,SBModel,
    K,
    KModel,
    LinearHeating,
    smooth_data, moving_average
end
