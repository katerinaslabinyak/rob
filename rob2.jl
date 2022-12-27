include("roblib.jl")

function rob2(r::Robot)
    y=numsteps(r,Sud)
    x=numsteps(r,West)

    for i in range (Ost, Nord, West, Sud)
        markerside(r, i)
    end
    somesteps(r,Ost,x)
    somesteps(r,Nord,y)
    
end
