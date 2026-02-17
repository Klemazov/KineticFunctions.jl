using KineticFunctions
using Test

@testset "KineticFunctions.jl" begin
    @test fn(0.5,1.0) == 0.5
end
