

abstract type LinearRegressionProblem end
#=
Y= AX+B
ln(dαdt/f(α)) = lnA-Ea/R 1/T
=#
struct KineticLinearRegressionProblem{F} <: LinearRegressionProblem
    f::F
end

function (x::KineticLinearRegressionProblem)(data::Union{TGParser, DSCParser})
    temperature = data.temperature
    dαdt = data.dαdt

    oneT = one(temperature) / temperature
    y = log(dαdt/x.f(α))
    return (oneT, y)
end

