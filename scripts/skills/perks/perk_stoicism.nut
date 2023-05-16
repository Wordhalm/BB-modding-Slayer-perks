this.perk_stoicism <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.stoicism";
		this.m.Name = this.Const.Strings.PerkName.Stoicism;
		this.m.Description = this.Const.Strings.PerkDescription.Stoicism;
		this.m.Icon = "ui/perks/Stoicisim.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		local actor = this.getContainer().getActor();
		actor.getSkills().add(this.new("scripts/skills/effects/ingrained_effect"));

	}
});
