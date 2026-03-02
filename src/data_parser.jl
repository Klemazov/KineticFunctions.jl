
abstract type AbstractThermalDataParser end

mutable  struct TGParser{T<:AbstractVector} <: AbstractThermalDataParser
    time::T
    temperature::T
    mass::T
    function TGParser(path)
        df = CSV.read(path,
            comment="#",
            header=["temperature", "time", "mass"],
            delim=";",
            DataFrame)
        df.mass[@. df.mass > eltype(df.mass[1])(100.0)] .= 100.0

        new{typeof(df.time)}(df.time, df.temperature, df.mass)
    end
end

struct DSCParser{T<:AbstractVector} <: AbstractThermalDataParser
    time::T
    temperature::T
    DSC::T
    sensit::T
    function DSCParser(path)
        df = CSV.read(path,
            comment="#",
            header=["temperature", "time", "DSC", "sensit"],
            delim=";",
            DataFrame)

        new{typeof(df.time)}(df.time, df.temperature, df.DSC, df.sensit)
    end
end

abstract type AbstractThermalDataFrame end

mutable struct TGDataFrame <: AbstractThermalDataFrame
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
        dαdt = diff(α) ./ diff(time)
        push!(dαdt, dαdt[end])
        dαdt[@. dαdt < 0.0] .= 0.001

        new(time, temperature, mass, α, dαdt)
    end
end






