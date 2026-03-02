#nth order
fn(e,n) = e^n


r2(e) = 2*e^0.5
r3(e) = 3*e^(2.0/3.0)

#diffusion models
d1(e) = 0.5/(1-e)
d2(e) = -1/(log(e))
d3(e) = 1.5*e^(1/3)*(e^(-1/3)-1)
d4(e) = 1.5/(e^(-1/3)-1)


#prout-tompkins models
b1(e,p) = e*p
bna(e,p,n,a) = e^n*p^a


#autocatalysis
c1_x(e,p,Kcat) = e*(1+Kcat*p)
cn_x(e,p,n,Kcat) = e^n*(1+Kcat*p)

#nuclearization models
a2(e) = 2*e*(-log(e))^0.5
a3(e) = 3*e*(-log(e))^(2/3)
an(e,n) = n*e*(-log(e))^((n-1)/n)


# composite types for models 

abstract type ConcentrationFunModel{n} end

#Number of parameters = 1 FunctionModel{1}
for struct_name in (:FN,:An,:AFModel)
    @eval struct $struct_name{T} <:FunctionModel{1}
            params::MVector{1,T}
            names::NTuple{1,Symbol}
            function $struct_name(n::T) where T
                params = MVector{1,T}(n)  
                new{T}(params,(:n,))
            end
    end
end

