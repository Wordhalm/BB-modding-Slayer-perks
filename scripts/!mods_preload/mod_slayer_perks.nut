local modID = "mod_WordsSlayerPerks";

::mods_registerMod(modID, 1.3, "Word\'s Slayer Perks");
::mods_queue(modID, "mod_legends,mod_msu", function() {
	local gt = this.getroottable();

	// new perk names
	gt.Const.Strings.PerkName.Herculean <- "Herculean";
	gt.Const.Strings.PerkName.QuickThinking <- "Quick Thinking";
	gt.Const.Strings.PerkName.PitifulTricks <- "Pitiful Tricks";
	gt.Const.Strings.PerkName.RavenousOne <- "Ravenous One";
	gt.Const.Strings.PerkName.Stoicism <- "Stoicism";
	gt.Const.Strings.PerkName.DragonSlayer <- "Dragon Slayer";

	// new perk descriptions
	gt.Const.Strings.PerkDescription.Herculean <- "This body is everything but mortal, and it's time to show'em all. You gain 100 hp and 60 fatigue.";
	gt.Const.Strings.PerkDescription.QuickThinking <- "Quick to draw, quicker to hit. Your maximum action points increases by 1.";
	gt.Const.Strings.PerkDescription.PitifulTricks <- "\'Mere tricks won't work agaisnt this one. Bring me the ballista !\' - A wise man. You gain poison immunity and one free try of breaking free when caught in net or web.";
	gt.Const.Strings.PerkDescription.RavenousOne <- "Hungry. Always. You know what it takes to ensure victory. Grants you the  \'Rip and Tear\' skill.";
	gt.Const.Strings.PerkDescription.Stoicism <- "Wind, arrows and blows don't wobble you. You gain the \'Ingrained\' effect, granting you +3 resolve and melee defense for each turn not moving, up a a maximum +15.";
	gt.Const.Strings.PerkDescription.DragonSlayer <- "Slayer of a spawn of the great old wyrms, this one\'s strikes are something to be careful of. You gain 30 min and max damage.";

	local perkDefObjects = [
		{
			ID = "perk.herculean",
			Script = "scripts/skills/perks/perk_herculean",
			Name = this.Const.Strings.PerkName.Herculean,
			Tooltip = this.Const.Strings.PerkDescription.Herculean,
			Icon = "ui/perks/Herculean.png",
			IconDisabled = "ui/perks/Herculean_nb.png",
			Const = "Herculean"
		},
		{
			ID = "perk.quick_thinking",
			Script = "scripts/skills/perks/perk_quick_thinking",
			Name = this.Const.Strings.PerkName.QuickThinking,
			Tooltip = this.Const.Strings.PerkDescription.QuickThinking,
			Icon = "ui/perks/Quick_thinking.png",
			IconDisabled = "ui/perks/Quick_thinking_nb.png",
			Const = "QuickThinking"
		},
		{
			ID = "perk.pitiful_tricks",
			Script = "scripts/skills/perks/perk_pitiful_tricks",
			Name = this.Const.Strings.PerkName.PitifulTricks,
			Tooltip = this.Const.Strings.PerkDescription.PitifulTricks,
			Icon = "ui/perks/Pitiful_tricks.png",
			IconDisabled = "ui/perks/Pitiful_tricks_nb.png",
			Const = "PitifulTricks"
		},
		{
			ID = "perk.ravenous_one",
			Script = "scripts/skills/perks/perk_ravenous_one",
			Name = this.Const.Strings.PerkName.RavenousOne,
			Tooltip = this.Const.Strings.PerkDescription.RavenousOne,
			Icon = "ui/perks/Ravenous_one.png",
			IconDisabled = "ui/perks/Ravenous_one_nb.png",
			Const = "RavenousOne"
		},
		{
			ID = "perk.stoicism",
			Script = "scripts/skills/perks/perk_stoicism",
			Name = this.Const.Strings.PerkName.Stoicism,
			Tooltip = this.Const.Strings.PerkDescription.Stoicism,
			Icon = "ui/perks/Stoicisim.png",
			IconDisabled = "ui/perks/Stoicisim_nb.png",
			Const = "Stoicism"
		},
		{
			ID = "perk.dragonslayer",
			Script = "scripts/skills/perks/perk_dragonslayer",
			Name = this.Const.Strings.PerkName.DragonSlayer,
			Tooltip = this.Const.Strings.PerkDescription.DragonSlayer,
			Icon = "ui/perks/Dragonslayer.png",
			IconDisabled = "ui/perks/Dragonslayer_nb.png",
			Const = "DragonSlayer"
		}
	];

	gt.Const.Perks.addPerkDefObjects(perkDefObjects);

	::mods_hookExactClass("entity/tactical/enemies/legend_rock_unhold", function(obj)
	{
		local oldOnDeath = obj.onDeath;
		obj.onDeath = function( _killer, _skill, _tile, _fatalityType )
		{
	    	local result = this.Math.rand(0, 100);
			if (result < 6) // 6
			{
				_killer.getBackground().addPerk(::Const.Perks.PerkDefs.Herculean, 5);
				_killer.getSkills().add(this.new("scripts/skills/perks/perk_herculean"));
			}
			return oldOnDeath(_killer, _skill, _tile, _fatalityType);
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/legend_white_direwolf", function(obj)
	{
		local oldOnDeath = obj.onDeath;
		obj.onDeath = function( _killer, _skill, _tile, _fatalityType )
		{
	    	local result = this.Math.rand(0, 100);
			if (result < 5) // 5
			{
				_killer.getBackground().addPerk(::Const.Perks.PerkDefs.QuickThinking, 2);
				_killer.getSkills().add(this.new("scripts/skills/perks/perk_quick_thinking"));
			}
			return oldOnDeath(_killer, _skill, _tile, _fatalityType);
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/legend_redback_spider", function(obj)
	{
		local oldOnDeath = obj.onDeath;
		obj.onDeath = function( _killer, _skill, _tile, _fatalityType )
		{
	    	local result = this.Math.rand(0, 100);
			if (result < 3) // 3
			{
				_killer.getBackground().addPerk(::Const.Perks.PerkDefs.PitifulTricks, 3);
				_killer.getSkills().add(this.new("scripts/skills/perks/perk_pitiful_tricks"));
			}
			return oldOnDeath(_killer, _skill, _tile, _fatalityType);
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/legend_skin_ghoul", function(obj)
	{
		local oldOnDeath = obj.onDeath;
		obj.onDeath = function( _killer, _skill, _tile, _fatalityType )
		{
	    	local result = this.Math.rand(0, 100);
			if (result < 4) // 4
			{
				_killer.getBackground().addPerk(::Const.Perks.PerkDefs.RavenousOne, 1);
				_killer.getSkills().add(this.new("scripts/skills/perks/perk_ravenous_one"));
			}
			return oldOnDeath(_killer, _skill, _tile, _fatalityType);
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/legend_greenwood_schrat", function(obj)
	{
		local oldOnDeath = obj.onDeath;
		obj.onDeath = function( _killer, _skill, _tile, _fatalityType )
		{
	    	local result = this.Math.rand(0, 100);
			if (result < 7) // 7
			{
				_killer.getBackground().addPerk(::Const.Perks.PerkDefs.Stoicism, 4);
				_killer.getSkills().add(this.new("scripts/skills/perks/perk_stoicism"));
			}
			return oldOnDeath(_killer, _skill, _tile, _fatalityType);
		}
	});

	::mods_hookExactClass("entity/tactical/enemies/legend_stollwurm", function(obj)
	{
		local oldOnDeath = obj.onDeath;
		obj.onDeath = function( _killer, _skill, _tile, _fatalityType )
		{
	    	local result = this.Math.rand(0, 100);
			if (result < 4) // 4
			{
				_killer.getBackground().addPerk(::Const.Perks.PerkDefs.DragonSlayer, 6);
				_killer.getSkills().add(this.new("scripts/skills/perks/perk_dragonslayer"));
			}
			return oldOnDeath(_killer, _skill, _tile, _fatalityType);
		}
	});

});