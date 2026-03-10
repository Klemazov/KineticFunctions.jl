
#differential equations and initial values 


# function s!(du, u, p, t)
#     du[1] = -kfmodel(t,u[1])
#     du[2] = 
# end

abstract type DifferentialEquationModel end

struct ODESModel{T} <: DifferentialEquationModel
    u₀ :: SVector{2, T}
    kfmodel:KFModel    
    function ODESModel(a::T, b::T, kfmodel::KFModel) where {T}
        new{T}(SVector{2,T}(a, b), kfmodel)
	end

end
