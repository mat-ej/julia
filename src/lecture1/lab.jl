#=
lab:
- Julia version: 
- Author: m
- Date: 2021-10-08
=#

### Functions
function polynomial(a, x)
    accumulator = 0
    for i in length(a):-1:1
        accumulator += x^(i-1) * a[i] # ! 1-based indexing for arrays
    end
    return accumulator
end

a = [-19, 7, -4, 6, 1.5] # list coefficients a from a^0 to a^n
x = 3
ξ = polynomial(a, x)

println(ξ)
println(round(ξ, digits = 1))

### Ranges
#NOTE start:step:end
ρ = 10:-1:-5
println(ρ)
typeof(ρ)
println(collect(ρ))

### Iterators
ac = [2i^2 + 1 for i in 1:10]
# println(ac)
println(typeof(ac)," ", eltype(ac))

ac = (2i^2 + 1 for i in 1:10)
# println(ac)
println(typeof(ac)," ", eltype(ac))

###
arr = ['A', 'B', 'C']
println(eltype(arr) == Char)

function polynomial(a, x)
    if eltype(a) == Char
        throw(ArgumentError("Invalid coefficients in arr=$(a) of type Char"))
    else
        accumulator = 0
        for i in length(a):-1:1
            accumulator += x^(i-1) * a[i] # ! 1-based indexing for arrays
        end
        return accumulator
    end
end


# println(polynomial(arr, 3))
a = [-19, 7, -4, 6]
x = 3

function f_iter(a, x)
    acc = 0
    for i in length(a):-1:1
        acc += x^(i-1) * a[i] # ! 1-based indexing for arrays
    end
    println(acc)
end

f_iter(a, x)
### map, enumerate, lambda functions
function polynomial(a, x)
    powers = map(enumerate(a)) do (i, a_i)
        x^(i-1) * a_i
    end
    accumulator = sum(powers)
    return accumulator
end

polynomial(a, x) = sum(ia -> x^(ia[1]-1) * ia[2], enumerate(a))

print(polynomial(a, x))
# x = 3
# f = (index, val) -> x^(index-1) * val
# print(typeof(f))
# map(f, enumerate(a))
# for (index, value) in enumerate(a)
#     f = (x, i) -> x^(i-1) * value
# end


function circlemat(n)
    mat = zeros(n,n)
    for i in 1:n
        for j in 1:n
            if ((i == j - 1 && j > 1) || (i == n && j == 1)) || ((i == j + 1 && j < n) || (i==1 && j == n))
                mat[i,j] = 1
            end
        end
    end
    return mat
end





# import Pkg
# Pkg.add("BenchmarkTools")
#
# aexp = ones(10) ./ factorial.(0:9)
# x = 1.1
# using BenchmarkTools
# @btime polynomial(aexp, x)




