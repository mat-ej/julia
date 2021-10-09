#=
hw:
- Julia version: 
- Author: m
- Date: 2021-10-08
=#

#
# if (i=j−1∧j>1)∨(i=n∧j=1)
# if (i=j+1∧j<n)∨(i=1∧j=n)

using Pkg
Pkg.activate(".")

# function circlemat(n)
#     mat = zeros(n,n)
#     for i in 1:n
#         for j in 1:n
#             if ((i == j - 1 && j > 1) || (i == n && j == 1)) || ((i == j + 1 && j < n) || (i==1 && j == n))
#                 mat[i,j] = 1
#             end
#         end
#     end
#     return mat
# end
circlemat(n) = [((i == j - 1 && j > 1) || (i == n && j == 1)) || ((i == j + 1 && j < n) || (i==1 && j == n)) for i in 1:n, j in 1:n]


# polynomial(a, x) = sum(ia -> x^(ia[1]-1) * ia[2], enumerate(a))
function polynomial(a, x)
    powers = map(enumerate(a)) do (i, a_i)
        x^(i-1) * a_i
    end
    accumulator = sum(powers)
    return accumulator
end

A = circlemat(10)
arr = [1,1,1,1]
f = polynomial(arr, A)
println(f)

### Plotting
#TODO how to display from cli
using GraphRecipes, Plots
display(graphplot(f))