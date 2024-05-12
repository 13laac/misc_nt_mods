#define crown_take
sound_play(sndCrownCurses)
GameCont.crown = crwn_curses
#define step
    with Crown{
        GameCont.crown = crwn_curses
    }

#define crown_name // Crown Name
return "CROWN OF CURSES";

#define crown_text // Description
return "A LOT MORE @pCURSED CHESTS@s#REPLACES RANDOM @wENEMIES@s";

#define crown_avail
return GameCont.loops > 0;

#define crown_button
image_index = 11
