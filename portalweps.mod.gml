#define step
//unfuck the weapons
with Portal{
    with WepPickup{
        if "lastx" not in self{
            lastx = x;
            lasty = y;
            lasta = rotation;
        }
        if lasta != rotation{
            while lastx == x and lasty == y{
                x+=lengthdir_x(friction+1,point_direction(x,y,other.x,other.y));
                y+=lengthdir_y(friction+1,point_direction(x,y,other.x,other.y));
                xprevious = x
                yprevious = y
            }
        }
        lastx = x;
        lasty = y;
        lasta = rotation;
    }
}