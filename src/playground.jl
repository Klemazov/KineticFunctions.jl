using KineticFunctions
#using Plots
const R = 8.31

testpath = raw"C:\\Users\\Kirill\\.julia\\dev\\KineticFunctions.jl\\assets\\";

test_names = ["fn_600_1_tg.txt", "fn_700_5_tg.txt", "fn_800_10_tg.txt", "fn_1000_20_tg.txt", "fn_1000_30_tg.txt"]

TGDataFrame
# #testing kinetic
# α = range(0.001,0.999, 100)
# temperature = range(300.0,1300.0, 100)

# fnmodel = FNModel(1.0);
# kmodel = KModel(1000,1000);
# #dadt = kmodel.(temperature)*fnmodel.(α)'

# kinlinprob = KineticLinearRegressionProblem(fnmodel)

# #contourf(temperature,α,dadt)

# dadt = @. kmodel(temperature)*fnmodel(α)


# a= cumsum(dadt)./cumsum(dadt)[end]

# res = @. kinlinprob(a,dadt,temperature)


# plot(res)