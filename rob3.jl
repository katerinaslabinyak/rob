include("roblib.jl")


function rob3(r::Robot)
    y=numsteps(r,Sud)
    x=numsteps(r,West)

    go_NO(r)

    start_putmarker(r,Sud)
    if isborder(r,Sud)
        markerside(r,Nord)
    end
    markerside(r,Sud)

    somesteps(r,Nord,y)
    somesteps(r,Ost,x)
end

function start_putmarker(r::Robot,side::HorizonSide)
    
    while isborder(r,West)==false
        markerside(r,side)
        side=invert(side)
        move!(r,West)
    end
end
