this.perk_ravenous_one <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.ravenous_one";
		this.m.Name = this.Const.Strings.PerkName.RavenousOne;
		this.m.Description = this.Const.Strings.PerkDescription.RavenousOne;
		this.m.Icon = "ui/perks/Ravenous_one.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		local actor = this.getContainer().getActor();
		actor.getSkills().add(this.new("scripts/skills/perks/perk_ravenous_one"));
		actor.getSkills().add(this.new("scripts/skills/actives/rip_and_tear"));
		actor.getSkills().add(this.new("scripts/skills/effects/sated_effect"));
	}

	function onUpdate( _properties )
	{
		_properties.TargetAttractionMult *= 1.025;
	}
});
