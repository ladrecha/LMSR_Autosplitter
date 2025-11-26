state("LMSR_Windows64_Steam") 
{
   uint loading : "GameAssembly.dll", 0x04C3C228, 0xB8, 0x0, 0x70, 0x78;
   uint current_cp : "GameAssembly.dll", 0x04C013E8, 0x38, 0xF8, 0x28, 0x178, 0x18;
   uint cp_count : "GameAssembly.dll", 0x04C010E0, 0xB8, 0x20, 0x138, 0x420, 0x18;
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