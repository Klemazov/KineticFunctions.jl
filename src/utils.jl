tg_α(x) = @. abs(x[1]-x)/(x[1]-x[end])

calculate_dadt(α) = diff(α) #TODO remake 

function calculate_α(dαdt)
    integral = cumsum(dαdt)
    return integral/integral[end]
end