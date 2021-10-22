using Test
using Ecosystem  # in your code this line as to be uncommented ;)

# @testset "agent_count" begin
#     @test agent_count(Mushroom(1,1,1)) == 1
# end

# @testset "agent_count" begin
#     grass1 = Grass(1,1,5)
#     grass2 = Grass(2,2,5)
# end


@testset "agent_count" begin
    grass1 = Grass(1,1,5)
    grass2 = Grass(2,2,5)
    sheep  = Sheep(3,1,1,1,1)
    wolf   = Wolf(5,2,2,2,2)
    world  = World([sheep,grass1,grass2,wolf])

    @test agent_count(grass1) ≈ 0.2
    @test agent_count(sheep) == 1
    @test agent_count([grass2,grass1]) ≈ 0.6
    res = agent_count(world)
    tst = Dict(:Sheep=>1,:Wolf=>1,:Grass=>0.6)
    for (k,_) in res
        @test res[k] ≈ tst[k]
    end
end