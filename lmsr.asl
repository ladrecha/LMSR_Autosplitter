/*
** Lonely Mountains Snow Riders autosplitter
** By GrosHiken with the help of Lyliya's LMD autosplitter
*/


state("LMSR_Windows64_Steam") 
{
   uint loading : "GameAssembly.dll", 0x04EE2990, 0xB8, 0x0, 0x70, 0x78;
   uint current_cp : "GameAssembly.dll", 0x04DCD808, 0xB8, 0x38, 0x130, 0xB8;
   uint cp_count : "GameAssembly.dll", 0x050C3E10, 0xCA8, 0x50, 0x48, 0xB8;
}

state("LMSR_Windows64_Steam") 
{
   uint loading : "GameAssembly.dll", 0x04EE2990, 0xB8, 0x0, 0x70, 0x78;
   uint current_cp : "GameAssembly.dll", 0x04DCD808, 0xB8, 0x38, 0x130, 0xB8;
   uint cp_count : "GameAssembly.dll", 0x050C3E10, 0xCA8, 0x50, 0x48, 0xB8;
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