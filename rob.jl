function rob39(robot)
    int(n) = 0
    side=[Ost, Sud, West, Nord, Ost, Sud, West, Nord, Ost, Sud, West, Nord]
    putmarker!(robot)
    while ismarker(robot) == false
        check(robot)
    end
    if n>0
        print('робот снаружи лабиринта')
    else:
        print('робот внутри лабиринта')
    end
end

function check(robot)
    for i in range(4,8)
        if isborder(robot, side[i]) == true
            corner(robot)
        end
    end
end

function corner(robot)
    if isborder(robot, side[i-1]) == true
        n-=1
        i-=1
    else
        bot(robot)
    end
end

function bot(robot)
    move!(robot, side[i-1])
    if isborder(robot, side[i]) == true
        break
    else
        move!(robot, side[i])