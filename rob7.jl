include("roblib.jl")

function rob7(r::Robot)
    side=Ost
    while isborder(r,Nord)==true
        putmarker!(r)
        go_to_markers(r,side)
        side=invert(side)
    end
end

function go_to_markers(r::Robot,side::HorizonSide)
    while ismarker(r)==true
        move!(r,side)
    end
end
