global.newlevel = false
    
#define level_start
global.newlevel = false
if GameCont.hard = 1{
        with WantPopo instance_delete(id)
        with IDPDSpawn{
            trace("idpdspawn")
            sound_stop(sndIDPDPortalSpawn)
            instance_delete(id)
        }
        //popo mod
        with instances_matching(CustomObject,"name","IDPDPortal"){
            sound_stop(sndIDPDPortalSpawn)
            instance_delete(id)
        }
}


#define step
with GenCont if !global.newlevel global.newlevel = true
if global.newlevel and !instance_exists(GenCont) level_start()
