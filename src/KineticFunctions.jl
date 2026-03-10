module KineticFunctions
    using StaticArrays
    using Statistics
    using CSV
    using DataFrames
#include("functions.jl")
include("rateconstant.jl")
include("concentration_functions.jl")
#include("temperaturemodels.jl")
#include("KineticLinearRegressionTools.jl")
include("data_parser.jl")
include("kf_models.jl")
#include("utils.jl")
const R = 8.31;
export 
    R,
    TGParser, TGDataFrame,
    FN,An,
    KFModel,
    KModel
end
