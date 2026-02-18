module DataParser
    using CSV,DataFrames

    struct TGParser
	temperature::Vector{Float64}
	time::Vector{Float64} 
	mass::Vector{Float64} 
	function TGParser(path::String, header::Int64)
		df = CSV.read(path, header = header, DataFrame)
		temperature = df."##Temp./\xb0C"
		time = df."Time/min"
		mass = df."Mass/%"
		new(temperature, time, mass)
	end
end


end