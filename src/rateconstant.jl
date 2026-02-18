using StaticArrays

#=
K(T) = Aexp(-Ea/RT)
R - gas constant
A - predexponential coeffinient
Ea - activation energy
if process isothermal then 
T = const
if nonisothermal then
T = T(t) 
    T(t,β) = βT if linear process
    T(t,pp) if polynomial interpolation 
=#

K(T,A,Ea) = A*exp(-Ea/(R*T))

abstract type RateConstantModel end

struct KModel{T}<:RateConstantModel
    params::MVector{2,T}
    names::NTuple{2,Symbol}
    function KModel(A::T,Ea::T) where {T}
        params = MVector{2,T}(A,Ea)  
        new{T}(params,(:A,:Ea))
    end
end
function (kmodel::KModel)(temperature)
    K(temperature,kmodel.params...)
end