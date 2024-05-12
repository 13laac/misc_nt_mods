global.enemies = [
Bandit,
Maggot,
RadMaggot,
BigMaggot,
MaggotSpawn,
Scorpion,
GoldScorpion,
Rat,
FastRat,
Ratking,
Exploder,
Gator,
BuffGator,
MeleeFake,
Raven,
Sniper,
Salamander,
Spider,
LaserCrystal,
LightningCrystal,
Wolf,
SnowBot,
SnowTank,
GoldSnowTank,
Freak,
ExploFreak,
RhinoFreak,
Necromancer,
Guardian,
ExploGuardian,
DogGuardian,
BoneFish,
Crab,
Turtle,
Molefish,
Molesarge,
FireBaller,
SuperFireBaller,
Jock,
InvSpider,
InvLaserCrystal,
JungleBandit,
JungleAssassinHide,
JungleFly
    ]
global.props = [
    Cactus,
    BonePile,
    BigSkull,
    Barrel,
    Pipe,
    ToxicBarrel,
    Tires,
    Car,
    CrystalProp,
    Cocoon,
    StreetLight,
    Hydrant,
    SnowMan,
    Tube,
    MutantTube,
    Terminal,
    Server,
    Pillar,
    SmallGenerator,
    Torch,
    OasisBarrel,
    WaterPlant,
    Anchor,
    WaterMine,
    PizzaBox,
    MoneyPile,
    YVStatue,
    GoldBarrel,
    Bush
    ]

global.newlevel = false
    
global.debug = false


loc_set("Crowns:11:Text","A LOT MORE @pCURSED CHESTS@s#REPLACES RANDOM @wENEMIES@s")
#define level_start




var count = 0;
if global.debug
var howmany = 0;
with instances_matching(Crown,"spr_idle",sprCrown11Idle)
    count += 1
    
for (var i = 0;i<array_length_1d(mod_variable_get("mod","crowns","crowns"));i++)
if mod_variable_get("mod","crowns","crowns")[i] = "curses"
    count += 1



if count > 0{
for(var i = 0;i<array_length(global.enemies);i++){
    with global.enemies[i]{
        if !irandom(max(50/count,1)){
            var r = irandom(array_length(global.enemies)-1);
            with instance_create(x,y,global.enemies[r]){
                cursed = 1
                if global.debug
                howmany += 1
                //trace(object_get_name(object_index))
            }
            instance_delete(id)
        }
    }
}
for(var i = 0;i<array_length(global.props);i++){
    with global.props[i]{
        if !irandom(max(50/count,1)){
            var r = irandom(array_length(global.props)-1);
            with instance_create(x,y,global.props[r]){
                cursed = 1
                if global.debug
                howmany += 1
                //trace(object_get_name(object_index))
            }
            instance_delete(id)
        }
    }
}
}




if global.debug
trace(count,howmany)
#define step
with GenCont
if !global.newlevel global.newlevel = true

if global.newlevel and !instance_exists(GenCont){
    global.newlevel = false
    level_start()
    }

with instances_matching(enemy,"cursed",1)
    if !irandom(75) instance_create(x,y,Curse)
with instances_matching(prop,"cursed",1)
    if !irandom(75) instance_create(x,y,Curse)
