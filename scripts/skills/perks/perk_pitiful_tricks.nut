this.perk_pitiful_tricks <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.pitiful_tricks";
		this.m.Name = this.Const.Strings.PerkName.PitifulTricks;
		this.m.Description = this.Const.Strings.PerkDescription.PitifulTricks;
		this.m.Icon = "ui/perks/Pitiful_tricks.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onTurnStart()
	{
		local actor = this.getContainer().getActor();
		// actor.setHitpoints(400); // Debug
		if (this.getContainer().hasSkill("actives.break_free"))
  			this.getContainer().getSkillByID("actives.break_free").use(actor.getTile(), true);

	}

	function onUpdate( _properties )
	{
		_properties.TargetAttractionMult *= 1.025;
		_properties.IsImmuneToPoison = true;
		
	}
});
