/*
** Lonely Mountains Snow Riders autosplitter
** By GrosHiken with the help of Lyliya's LMD autosplitter
*/


state("LMSR_Windows64_Steam") 
{
   uint loading : "GameAssembly.dll", 0x069C41B8, 0xB8, 0x40, 0x20, 0xF0, 0x78, 0x60;
   uint current_cp : "GameAssembly.dll", 0x06A14230, 0x38, 0xF8, 0x28, 0x178, 0x18;
   uint cp_count : "GameAssembly.dll", 0x0699D3A0, 0xB8, 0x0, 0x0, 0x190, 0x18;
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