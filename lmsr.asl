/*
** Lonely Mountains Snow Riders autosplitter
** By GrosHiken with the help of Lyliya's LMD autosplitter
*/


state("LMSR_Windows64_Steam") 
{
   uint loading : "GameAssembly.dll", 0x04CFB830, 0x40, 0xE8, 0xD0, 0x28, 0x38, 0x88;
   uint current_cp : "GameAssembly.dll", 0x04FA6108, 0x0, 0x98, 0x78, 0xB8;
   uint cp_count : "GameAssembly.dll", 0x04FA6130, 0xCA8, 0x50, 0x48, 0xB8;
}

state("LMSR_Windows64_Xbox") 
{
   uint loading : "GameAssembly.dll", 0x04CFB830, 0x40, 0xE8, 0xD0, 0x28, 0x38, 0x88;
   uint current_cp : "GameAssembly.dll", 0x04FA6108, 0x0, 0x98, 0x78, 0xB8;
   uint cp_count : "GameAssembly.dll", 0x04FA6130, 0xCA8, 0x50, 0x48, 0xB8;
}

startup
{
}

init
{
    refreshRate = 30;
    vars.level_finished = false;
}

update
{
    if (vars.level_finished && current.current_cp < current.cp_count) {
        vars.level_finished = false;
    }
}

isLoading
{
	if (current.loading == 1) {
		return true;
	}
	else {
		return false;
	}
}

split
{
    if (!vars.level_finished && current.cp_count != 0 && current.current_cp == current.cp_count + 1) {
        vars.level_finished = true;
        return true;
    }
    return false;
}

shutdown
{
}