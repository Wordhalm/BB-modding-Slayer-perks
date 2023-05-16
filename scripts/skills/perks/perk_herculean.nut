this.perk_herculean <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.herculean";
		this.m.Name = this.Const.Strings.PerkName.Herculean;
		this.m.Description = this.Const.Strings.PerkDescription.Herculean;
		this.m.Icon = "ui/perks/Herculean.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		local actor = this.getContainer().getActor();
		actor.setHitpoints(this.Math.floor(actor.getHitpointsMax() + 100));
	}

	function onUpdate( _properties )
	{
		_properties.Hitpoints += 100;
		_properties.Stamina += 60;
	}
});
