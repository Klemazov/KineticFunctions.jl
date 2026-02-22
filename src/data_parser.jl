
using CSV, DataFrames
mutable struct TGParser
    time
    temperature
    mass
    function TGParser(path)
        df = CSV.read(path, comment="#", header=["temperature", "time", "mass"],delim = ";", DataFrame)
        df.mass[@. df.mass > eltype(df.mass[1])(100.0)] .= 100.0
        new(df.time, df.temperature, df.mass)
    end
end

mutable struct TGDataFrame
    time
    temperature
    mass
    α
    dαdt
    function TGDataFrame(tgparser::TGParser)
        time = tgparser.time
        temperature = @. tgparser.temperature + 273.15
        mass = tgparser.mass

        α = @. abs(mass[1] - mass) / (mass[1] - mass[end])
        dαdt = diff(α)./diff(time)
        push!(dαdt, dαdt[end])
        dαdt[@. dαdt < 0.0] .= 0.001

        new(time, temperature, mass, α, dαdt)
    end
end

function tgdftodf(x::TGDataFrame)
	DataFrame(time=x.time, temperature = x.temperature, mass = x.mass, α = x.α, dαdt = x.dαdt)
end


tg_α(α) = @. abs(α[1]-α)/(α[1]-α[end])

function calculate_dadt(α,t)
     res = diff(α)./diff(t)
     push!(res,res[end])
end 

function calculate_dadt(df::TGParser)
    α =  df.mass
    time = df.time
    calculate_dadt(α,t)
end


function calculate_α(dαdt)
    integral = cumsum(dαdt)
    return integral/integral[end]
end


