local Breed = require("scripts/utilities/breed")
local Breeds = require("scripts/settings/breed/breeds")

local localization = {
	mod_name = {
		en = "Take Aim",
	},
	mod_description = {
		en = "Special thanks to defallt and reisei for the encouragement to make this mod.",
	},
	enabled = {
		en = "Enabled",
	},
	enabled_description = {
		en = "Enable the standalone auto-aim assist.",
	},
	activation_mode = {
		en = "Activation Mode",
	},
	activation_mode_description = {
		en = "Choose when the auto-aim assist is active.",
	},
	activation_mode_ads_only = {
		en = "ADS only",
	},
	activation_mode_ranged = {
		en = "Always while ranged",
	},
	activation_mode_ranged_hold_shoot = {
		en = "Ranged (holding shoot input)",
	},
	activation_mode_keybind = {
		en = "Keybind (hold to aim)",
	},
	activation_mode_disabled = {
		en = "Disabled",
	},
	aim_assist_keybind = {
		en = "Aim Assist Keybind",
	},
	aim_assist_keybind_description = {
		en = "Hold this key to activate Take Aim's camera snap and aim assist while a ranged weapon is equipped. Only used when Activation Mode is set to Keybind.",
	},
	assist_cone = {
		en = "Assist Cone",
	},
	assist_cone_description = {
		en = "Controls how far away from the crosshair a visible enemy can be and still get selected.",
	},
	assist_cone_narrow = {
		en = "Narrow",
	},
	assist_cone_slim = {
		en = "Slim",
	},
	assist_cone_wide = {
		en = "Wide",
	},
	assist_cone_very_wide = {
		en = "Very wide",
	},
	target_range = {
		en = "Target Range",
	},
	target_range_description = {
		en = "Controls how far the stronger cone assist searches for targets.",
	},
	target_range_short = {
		en = "Short",
	},
	target_range_medium = {
		en = "Medium",
	},
	target_range_long = {
		en = "Long",
	},
	target_filter = {
		en = "Target Filter",
	},
	target_filter_description = {
		en = "Choose which enemies the stronger cone assist is allowed to target.",
	},
	priority_list = {
		en = "Target Preference",
	},
	priority_list_description = {
		en = "Chooses how Take Aim ranks valid targets before fine-tuning by aim angle and distance.",
	},
	priority_list_custom = {
		en = "Weighted enemy list",
	},
	priority_list_threats = {
		en = "Threats first",
	},
	priority_list_bosses = {
		en = "Bosses first",
	},
	priority_list_specials = {
		en = "Specials first",
	},
	priority_list_closest = {
		en = "Closest to aim",
	},
	threat_override = {
		en = "Threat Override",
	},
	threat_override_description = {
		en = "Lets a stronger weighted target take over while Take Aim is briefly holding aim on another enemy.",
	},
	aim_weighting_settings = {
		en = "Aim Weighting",
	},
	aim_weighting_settings_description = {
		en = "Tune which enemy families Take Aim may pull toward, and how hard each breed wins target selection.",
	},
	include_bosses = {
		en = "Bosses and Monsters",
	},
	include_bosses_description = {
		en = "Allow awakened bosses and monsters into the weighted aim pool.",
	},
	include_specialists = {
		en = "Specialists",
	},
	include_specialists_description = {
		en = "Allow specialists such as snipers, trappers, flamers, mutants, and hounds into the weighted aim pool.",
	},
	include_elites = {
		en = "Elites",
	},
	include_elites_description = {
		en = "Allow armored and squad-leader threats into the weighted aim pool.",
	},
	include_regulars = {
		en = "Regular Enemies",
	},
	include_regulars_description = {
		en = "Allow basic enemies into the weighted aim pool. This stays off by default.",
	},
	aim_weight_snap_first = {
		en = "Snap first",
	},
	aim_weight_strong = {
		en = "Strong pull",
	},
	aim_weight_normal = {
		en = "Normal pull",
	},
	aim_weight_light = {
		en = "Light pull",
	},
	aim_weight_last_resort = {
		en = "Last resort",
	},
	aim_weight_ignore = {
		en = "Ignore",
	},
	camera_snap = {
		en = "Camera Snap",
	},
	camera_snap_description = {
		en = "Pulls the camera toward the selected assist target while Take Aim is active. Crosshair modes aim the crosshair (weapon aim) at the target instead of the camera center, accounting for recoil and sway.",
	},
	camera_snap_soft = {
		en = "Soft",
	},
	camera_snap_strong = {
		en = "Strong",
	},
	camera_snap_instant = {
		en = "Instant",
	},
	camera_snap_crosshair_soft = {
		en = "Crosshair (Soft)",
	},
	camera_snap_crosshair_strong = {
		en = "Crosshair (Strong)",
	},
	camera_snap_crosshair_instant = {
		en = "Crosshair (Instant)",
	},
	camera_snap_off = {
		en = "Off",
	},
	aim_point = {
		en = "Aim Point",
	},
	aim_point_description = {
		en = "Choose the enemy aim node the assisted shot should use.",
	},
	aim_point_head = {
		en = "Head",
	},
	aim_point_torso = {
		en = "Torso",
	},
	aim_offset = {
		en = "Vertical Aim Offset",
	},
	aim_offset_description = {
		en = "Adds a vertical offset to the targeted node. Useful for aiming slightly above or below the head/torso.",
	},
	aim_grace_window = {
		en = "Aim Grace Window",
	},
	aim_grace_window_description = {
		en = "Controls how long the auto-aim stays active after you stop aiming.",
	},
	shooting_grace_window = {
		en = "Shooting Grace Window",
	},
	shooting_grace_window_description = {
		en = "Controls how long the auto-aim stays active after you release the shoot input.",
	},
	target_retention_window = {
		en = "Target Retention Window",
	},
	target_retention_window_description = {
		en = "Controls how long Take Aim stays locked on the current target before looking for a new one.",
	},
	shot_blockers = {
		en = "Shot Blockers",
	},
	shot_blockers_description = {
		en = "Choose which enemies block the path to a target. When a toggled enemy is in the way, Take Aim will not aim toward the target behind it.",
	},
}

local function add_breed_localization(breed_name, breed_data)
	local display_name = breed_data.is_boss
		and type(breed_data.boss_display_name) == "string"
		and breed_data.boss_display_name
		or breed_data.display_name
	local text = display_name and Localize(display_name) or breed_name

	if breed_name ~= "chaos_mutator_daemonhost" and string.find(breed_name, "mutator") then
		text = text .. " (mutator)"
	end

	localization[breed_name] = {
		en = text,
	}
end

local SHOT_BLOCKER_BREEDS = {
	chaos_ogryn_executor = "block_chaos_ogryn_executor",
	chaos_ogryn_bulwark = "block_chaos_ogryn_bulwark",
	chaos_ogryn_gunner = "block_chaos_ogryn_gunner",
	renegade_executor = "block_renegade_executor",
	cultist_captain = "block_cultist_captain",
	renegade_captain = "block_renegade_captain",
	renegade_twin_captain = "block_renegade_twin_captain",
	renegade_twin_captain_two = "block_renegade_twin_captain_two",
}

local MONSTROSITY_BREEDS = {
	chaos_beast_of_nurgle = "block_chaos_beast_of_nurgle",
	chaos_spawn = "block_chaos_spawn",
	chaos_daemonhost = "block_chaos_daemonhost",
	chaos_mutator_daemonhost = "block_chaos_mutator_daemonhost",
	chaos_ogryn_houndmaster = "block_chaos_ogryn_houndmaster",
	chaos_plague_ogryn = "block_chaos_plague_ogryn",
}

local function add_shot_blocker_localization(breed_name, breed_data)
	local display_name = breed_data.is_boss
		and type(breed_data.boss_display_name) == "string"
		and breed_data.boss_display_name
		or breed_data.display_name
	local text = display_name and Localize(display_name) or breed_name

	if breed_name ~= "chaos_mutator_daemonhost" and string.find(breed_name, "mutator") then
		text = text .. " (mutator)"
	end

	localization["block_" .. breed_name] = {
		en = text,
	}
end

local REQUESTED_BREEDS = {
	cultist_assault = true,
	cultist_vanguard = true,
	renegade_assault = true,
	renegade_rifleman = true,
	renegade_vanguard = true,
}

for breed_name, breed_data in pairs(Breeds) do
	if Breed.is_minion(breed_data) and (breed_data.smart_tag_target_type == "breed" or REQUESTED_BREEDS[breed_name]) then
		add_breed_localization(breed_name, breed_data)

		if SHOT_BLOCKER_BREEDS[breed_name] or MONSTROSITY_BREEDS[breed_name] then
			add_shot_blocker_localization(breed_name, breed_data)
		end
	end
end

return localization
