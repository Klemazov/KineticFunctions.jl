function smooth_data(data::TGParser, alg, params)
    data.temperature = alg(data.temperature, params);
    data.mass = alg(data.mass, params);
end;

function smooth_data(data::DSCParser, alg, params)
    data.temperature = alg(data.temperature, params);
    data.DSC = alg(data.mass, params);
end;

function moving_average(x, w)
	    n = length(x)
	    y = similar(x, n)
	    half = fld(w, 2)
	    for i in 1:n
	        lo = max(1, i - half)
	        hi = min(n, i + half)
	        y[i] = mean(@view x[lo:hi])
	    end
	    return y
	end;

function calc_dαdt(x::TGParser)
	#TODO create ALG 
end


function calc_α(x::DSCParser)
	#TODO create ALG 
end