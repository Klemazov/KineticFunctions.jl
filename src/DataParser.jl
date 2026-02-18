module DataParser
    using CSV,DataFrames

	

struct TGParser
	time
	temperature
	mass
	function TGParser(path)
		df =  CSV.read(path,comment="#", header=["temperature", "time", "mass"], DataFrame)
		df.mass[@. df.mass>100.0] .= 100.0
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
		
		α = @. abs(mass[1]-mass)/(mass[1]-mass[end])
		dαdt = diff(α)
		push!(dαdt,dαdt[end])
		dαdt[@. dαdt<0.0] .= 0.000001

		new(time, temperature, mass, α, dαdt)
	end
end
export 
	TGParser, TGDataFrame
end

