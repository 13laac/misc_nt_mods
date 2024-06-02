
global.safety = 0
global.level_start = 0
#define level_start
global.safety = 60
#define game_start
skill_set_active("mut_boiling_veins",0)
#define step
if instance_exists(Player) and !instance_exists(Spiral)
global.safety =  max(global.safety-(1*current_time_scale),0)

with instances_matching_le(Portal,"endgame",0) global.safety = 10000

//trace(global.safety)

with instances_matching(GenCont,"newlevel",null)
    global.level_start = 1   
if global.level_start and !instance_exists(GenCont){
    level_start()
    global.level_start = 0
}

with Player{ 
    if ((current_frame mod 200)+global.safety) = 1
        if fork(){
            var dir = irandom(360)
            var _x = x+lengthdir_x(32,dir);
            var _y = y+lengthdir_y(32,dir);
            sound_play(sndRogueAim)
            for(var i = 0;i<32/current_time_scale;i++){
                
                if !instance_exists(self) exit
                if i < 24/current_time_scale
                var dir = point_direction(_x,_y,x,y)
                _x+=lengthdir_x(0.3,dir)
                _y+=lengthdir_y(0.3,dir)
                script_bind_draw("arrows",0,_x,_y,dir)
                wait 0
                
            }
            if !instance_exists(self) exit
            with instance_create(_x,_y,RogueStrike){
                image_angle = dir
                direction = image_angle
            }
            exit
        }
}

#define arrows(_x,_y,dir)
    draw_sprite_ext(sprRogueStrike,current_frame*0.4,_x,_y,1,1,dir,c_white,1)
    instance_delete(id)