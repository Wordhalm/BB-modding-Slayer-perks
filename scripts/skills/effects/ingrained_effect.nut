this.ingrained_effect <- this.inherit("scripts/skills/skill", {
	m = {
		Bonus = 0,
		LastTile = null,
		Stayed = 0
	},
	function create()
	{
		this.m.ID = "effects.ingrained";
		this.m.Name = "Ingrained";
		this.m.Icon = "ui/perks/Ingrained.png";
		this.m.IconMini = "status_effect_34_mini";
		this.m.Overlay = "status_effect_34";
		this.m.Type = ::Const.SkillType.StatusEffect;
		this.m.IsActive = false;
	}

	function getDescription()
	{
		return "As time passes, you hold still. Grants " + this.m.Bonus + " Resolve and Melee defense.";
	}

	function incrementBonus()
	{
		this.m.Bonus = ::Math.min(this.m.Bonus + 3, 15);
	}

	function resetBonus()
	{
		this.m.Bonus = 0
	}

	function onMovementFinished( _tile)
	{
		this.resetBonus();
	}

	function onUpdate( _properties)
	{
		_properties.Bravery += this.m.Bonus;
		_properties.MeleeDefense += this.m.Bonus;
		this.m.IsHidden = this.m.Bonus == 0;
	}


	function onTurnStart()
	{
		local actor = this.getContainer().getActor();
		if (this.getContainer().hasSkill("effects.ingrained") && this.m.LastTile != null)
		{
			if (this.m.LastTile.ID == this.getContainer().getActor().getTile().ID)
			{
				::Tactical.EventLog.log("Incremented");
				this.incrementBonus();
			}
			else
			{
				::Tactical.EventLog.log("Reseted");
				this.resetBonus();
			}
		}
		this.m.LastTile = actor.getTile();
	}

	function onCombatFinished()
	{
		this.resetBonus();
	}

});