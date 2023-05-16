this.perk_quick_thinking <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.quick_thinking";
		this.m.Name = this.Const.Strings.PerkName.QuickThinking;
		this.m.Description = this.Const.Strings.PerkDescription.QuickThinking;
		this.m.Icon = "ui/perks/Quick_thinking.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		_properties.TargetAttractionMult *= 1.025;
		_properties.ActionPoints += 1;
	}
});
