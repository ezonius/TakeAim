return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`TakeAim` encountered an error loading the Darktide Mod Framework.")

		new_mod("TakeAim", {
			mod_script = "TakeAim/scripts/mods/TakeAim/TakeAim",
			mod_data = "TakeAim/scripts/mods/TakeAim/TakeAim_data",
			mod_localization = "TakeAim/scripts/mods/TakeAim/TakeAim_localization",
		})
	end,
	load_before = { "HoldFire" },
	packages = {},
}
