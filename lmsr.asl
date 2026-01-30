/*
** Lonely Mountains Snow Riders autosplitter
** By GrosHiken with the help of Lyliya's LMD autosplitter
*/


state("LMSR_Windows64_Steam") 
{
   uint loading : "GameAssembly.dll", 0x04EDC710, 0xB8, 0x0, 0x70, 0x78;
   uint current_cp : "GameAssembly.dll", 0x050BE9B8, 0x0, 0x98, 0x78, 0xB8;
   uint cp_count : "GameAssembly.dll", 0x050BE9E0, 0xCA8, 0x28, 0x18, 0x78, 0x480, 0x18;
}

state("LMSR_Windows64_Xbox") 
{
   uint loading : "GameAssembly.dll", 0x04EDC710, 0xB8, 0x0, 0x70, 0x78;
   uint current_cp : "GameAssembly.dll", 0x04E76830, 0x330, 0x0, 0x180, 0xB8;
   uint cp_count : "GameAssembly.dll", 0x04DED180, 0xB8, 0x8, 0x1F0, 0xB8;
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