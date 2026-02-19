
abstract type LinearRegressionProblem end
#=
Y= AX+B
ln(dαdt/f(α)) = lnA-Ea/R 1/T
=#
struct KineticLinearRegressionProblem{F} <: LinearRegressionProblem
    f::F
end
function (x::KineticLinearRegressionProblem)(α, dαdt, temperature)
    oneT = one(temperature) / temperature
    y = log(dαdt / f(α))
    return (oneT, y)
end

export KineticLinearRegressionProblem

