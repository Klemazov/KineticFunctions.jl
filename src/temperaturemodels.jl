using StaticArrays


linear_heating(t,β) = β*t 

abstract type TemperatureModel end

struct LinearHeating{T}<:TemperatureModel
    β::T
end
function (tempmodel::LinearHeating)(t)
    linear_heating(t,tempmodel.β)
end
