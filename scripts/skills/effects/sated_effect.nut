this.sated_effect <- this.inherit("scripts/skills/skill", {
	m = {
		Duration = 0,
		LastRageSoundTime = 0
	},
	function create()
	{
		this.m.ID = "effects.sated";
		this.m.Name = "Sated";
		this.m.Icon = "ui/perks/sated.png";
		this.m.IconMini = "status_effect_34_mini";
		this.m.Overlay = "status_effect_34";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
	}

	function getDescription()
	{
		local actor = this.getContainer().getActor();
		return "Flesh has been torn appart, skulls were smashed. For now, your bloodthirst is sated. Regenerates " + this.Math.floor(actor.getHitpointsMax()/10) + " each turn. Lasts for " + this.m.Duration + " more rounds";
	}

	function effectProc()
	{
		this.m.Duration += this.Math.abs(2 - this.m.Duration);
		local actor = this.getContainer().getActor();

		this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " \'s flesh starts to fume ! It's healing !");

	}

	function onUpdate( _properties )
	{
		this.m.IsHidden = this.m.Duration == 0;
	}

	function onTurnStart()
	{
		if (this.getContainer().hasSkill("effects.sated"))
		{
			if (this.m.Duration > 0)
			{
				local actor = this.getContainer().getActor();
				actor.setHitpoints(this.Math.floor(actor.getHitpoints() + actor.getHitpointsMax()/10));
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " regenerated " + this.Math.floor(actor.getHitpointsMax()/10) + " from sated.");
			}

			this.m.Duration = this.Math.max(0, this.m.Duration - 1);
		}
	}

	function onCombatFinished()
	{
		this.m.Duration = 0;
	}

});