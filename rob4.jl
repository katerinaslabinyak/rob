include("roblib2.jl")


function rob4!(r::Robot) #задача 4
    sides = (Nord, Ost, Sud, West)
    for i in 1:4
        first_side = sides[i]
        second_side = sides[i % 4 + 1]
        direction = (first_side, second_side)
        n_steps = putmarkers_until_border!(r, direction)
        moves!(r, inverse_side(direction), n_steps)
    end
    putmarker!(r)
end