using StaticArrays


fn(α,n) = (1-α)^n
pn(α,n) = n*α^((n-1)/n)
af(α,n) = n*(1-α)*((-log(1-α))^((n-1)/n))

pt(α, n, m) = α^n*(1-α)^m

ks(α,n,m,Kcat) = fn(α, n)*(1+Kcat*α^m)
sb(α,n,m,p) = α^m*(1-α)^n*((-log(1-α))^p)


abstract type FunctionModel{N} end 

#Number of parameters = 1 FunctionModel{1}
for struct_name in (:FNModel,:PNModel,:AFModel)
    @eval struct $struct_name{T} <:FunctionModel{1}
            params::MVector{1,T}
            names::NTuple{1,Symbol}
            function $struct_name(n::T) where T
                params = MVector{1,T}(n)  
                new{T}(params,(:n,))
            end
    end
end

#Number of parameters = 2     FunctionModel{2}
for struct_name in (:PTModel,)
    @eval struct $struct_name{T} <:FunctionModel{2}
            params::MVector{2,T}
            names::NTuple{2,Symbol}
            function $struct_name(n::T, m::T) where T
                params = MVector{2,T}(n,m)  
                new{T}(params,(:n,:m))
            end
    end
end

#Number of parameters = 3     FunctionModel{3}
for struct_name in (:KSModel,:SBModel)
    @eval struct $struct_name{T} <:FunctionModel{3}
            params::MVector{3,T}
            names::NTuple{3,Symbol}
            function $struct_name(n::T, m::T,p::T) where T
                params = MVector{3,T}(n,m,p)  
                new{T}(params,(:n,:m, :p))
            end
    end
end




for (struct_name, f_name) in zip((:FNModel,:PNModel,:AFModel,:PTModel,:KSModel,:SBModel), 
                                (:fn,:pn,:af, :pt,:ks,:sb))
    @eval (fmodel::$struct_name)(α) = $f_name(α,getfield(fmodel, :params)...)
end

