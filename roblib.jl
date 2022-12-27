invert(side::HorizonSide) = HorizonSide(mod(Int(side)+2, 4))
sidebefore(side::HorizonSide) = HorizonSide(mod(Int(side)+1,4))
sideafter(side::HorizonSide) = HorizonSide(mod(Int(side)-1,4))

function markerside(r,side::HorizonSide)
    while isborder(r,side)==false
        putmarker!(r)    
        move!(r,side)
    end
    putmarker!(r)
end

function go_NO(r::Robot)
    while isborder(r,Nord)==false
        move!(r,Nord)
    end
    while isborder(r,Ost)==false
        move!(r,Ost)
    end
end

function go_SW(r::Robot)
    while isborder(r,West)==false || isborder(r,Sud)==false
        if isborder(r,West)==false
            move!(r,West)
        end
        if isborder(r,Sud)==false
            move!(r,Sud)
        end
    end
end

function numsteps(r::Robot,side::HorizonSide) :: Int
    n=0
    while isborder(r,side)==false
        move!(r,side)
        n=n+1
    end 
    return n
end

function somesteps(r::Robot,side::HorizonSide,n::Int)
    while n>0
        move!(r,side)
        n=n-1
    end
end

function go_NO_way(r::Robot) ::Array
    way=[]
    while isborder(r,Nord)==false || isborder(r,Ost)==false
        if isborder(r,Nord)==false
            move!(r,Nord)
            push!(way,Sud)
        end
        if isborder(r,Ost)==false
            move!(r,Ost)
            push!(way,West)
        end
    end
    return way
end

function go_WS_way(r::Robot) ::Array
    way=[]
    while isborder(r,Sud)==false || isborder(r,West)==false
        if isborder(r,Sud)==false
            move!(r,Sud)
            push!(way,Nord)
        end
        if isborder(r,West)==false
            move!(r,West)
            push!(way,Ost)
        end
    end
    return way
end

function go_way(r,way::Array)
    n=length(way)
    while n>0
        move!(r,way[n])
        n=n-1
    end
end

function go_NO_xy(r,x,y)
    for i in 1:x
        move!(r,Ost)
    end
    for j in 1:y
        move!(r,Nord)
    end
end

function go_WS_xy(r::Robot)
    x=0
    y=0
    while isborder(r,West)==false
        move!(r,West)
        x=x+1
    end
    while isborder(r,Sud)==false
        move!(r,Sud)
        y=y+1
    end
    return (x,y)
end

function go_if_can(r::Robot, direct_side::HorizonSide)::Bool
    orthogonal_side = sideafter(direct_side)
    reverse_side = invert(orthogonal_side)
    num_steps=0
    if isborder(r,direct_side)==false
        move!(r,direct_side)
        result=true
    else
        while isborder(r,direct_side) == true
            if isborder(r, orthogonal_side) == false
                move!(r, orthogonal_side)
                num_steps += 1
            else
                break
            end
        end
        if isborder(r,direct_side) == false
            move!(r,direct_side)
            while isborder(r,reverse_side) == true
                move!(r,direct_side)
            end
            result = true
        else
            result = false
        end
        while num_steps>0
            num_steps=num_steps-1
            move!(r,reverse_side)
        end
    end
    return result
end
