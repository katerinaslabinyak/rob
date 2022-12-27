include("roblib.jl")

function rob1(r)
    for i in range(0,3)
        mark(r,HorizonSide(i))
    end
    putmarker!(r)
end

function mark(r, side::HorizonSide) 
    while isborder(r,side)==false
        move!(r,side)
        putmarker!(r)
    end
    side=invert(side)
    while ismarker(r)==true 
        move!(r,side)
    end
end
