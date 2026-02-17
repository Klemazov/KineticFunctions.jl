using StaticArrays
fn(α,n) = (1-α)^n
pt(α, n, m) = α^n*(1-α)^m
ks(α,n,m,Kcat) = fn(α, n)*(1+Kcat*α^m)


abstract type FunctionModel end 


struct FNModel{T}<:FunctionModel
    params::MVector{1,T}
    names::NTuple{1,Symbol}
    function FNModel(n::T) where T
        params = MVector{1,T}(n)  
        new{T}(params,(:n,))
    end
end
function (fmodel::FNModel)(α)
    fn(α,fmodel.params)
end


struct PTModel{T}<:FunctionModel
    params::MVector{2,T}
    names::NTuple{2,Symbol}
    function PTModel(n::T,m::T) where {T}
        params = MVector{2,T}(n,m)  
        new{T}(params,(:n,:m))
    end
end
function (fmodel::PTModel)(α)
    pt(α,fmodel.params...)
end
