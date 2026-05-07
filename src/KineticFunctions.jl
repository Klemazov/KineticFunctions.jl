module KineticFunctions
    using StaticArrays
    using Statistics
    using CSV
    using DataFrames
#include("functions.jl")
include("rateconstant.jl")
include("concentration_functions.jl")
include("data_parser.jl")
export 
    TGParser, TGDataFrame,
    FN,An,
    KFModel,
    KModel
end
