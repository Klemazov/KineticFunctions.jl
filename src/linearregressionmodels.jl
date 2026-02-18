abstract type LinRegressEquation end


#=
y = ln(dαdt/f(α)) = lnA-Ea/R 1/T
=#
struct Equation{T, F}<:LinRegressEquation
    dαdt::T
    f::F
    oneT::T
    y::T
    function Equation(f,α,dαdt,temperature)
        oneT = one(temperature)/temperature
        y = log(dαdt/f(α))
        new(f,α,dαdt,oneT, y)
    end
end
