this.perk_dragonslayer <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.dragonslayer";
		this.m.Name = this.Const.Strings.PerkName.DragonSlayer;
		this.m.Description = this.Const.Strings.PerkDescription.DragonSlayer;
		this.m.Icon = "ui/perks/Dragonslayer.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		_properties.DamageRegularMin += 30;
		_properties.DamageRegularMax += 30;
	}
});