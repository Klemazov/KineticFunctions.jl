import DifferentialEquations as DE

fn! = @ode_def fn begin
    dα = kmodel(t)*fnmodel(α)
end