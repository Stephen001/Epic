/*
Global datums containing actions that certain AI can do.
*/
Action
	proc
		/*
		Whether or not the action can be performed.
		*/
		canDo(var/Enemy/ai)
			return true


		/*
		Executes the action for the specified AI.
		Returns true if it was executed and the AI stops looking for actions
		for the tick.
		*/
		doAction(var/Enemy/ai)
			return true


		/*
		Returns the probability of the ai executing the action.
		*/
		getProbability(var/Enemy/ai)
			return 50






Action
	FindTarget
		canDo(var/Enemy/ai)
			return (ai.target == null)
		doAction(var/Enemy/ai)
			for(var/player/m in oview(ai.vrange+2, ai))
				if(m.team == 0)
					if(m.target_by == ai.name)
						ai.target = m
						return
					else
						continue
				if(m.team == ai.team) continue
				if(m.live == 0) continue
				if(istype(m, /turret/)) continue

				var/s = ai.vrange - m.passive("Undetected")

				if(s <= 0) s = 2

				if(get_dist(m, src >= s)) continue

				ai.vrange = 10

				ai.target = m
				return

			for(var/liv/m in oview(ai.vrange+2, src))
				if(m.team == 0)
					if(m.target_by == ai.name)
						ai.target = m
					else
						continue
				if(m.team == ai.team) continue
				if(m.live == 0) continue
				if(istype(m, /turret)) continue

				var/s = ai.vrange-m.passive("Undetected")
				if(s <= 0 ) s = 2
				if(get_dist(m, src) >= s) continue
				ai.vrange = 10
				ai.target = m
			return (ai.target != null) // if the AI is not null it will return true
		getProbability(var/Enemy/ai)
			return 100


/*
		get_target()

			for(var/liv/m in oview(vrange+2, src))

				if(m.team == 0)
					if(m.target_by == src.name)
						return m
					else
						continue
				if(m.team == team) continue

				if(m.live==0) continue
				if(istype(m,/turret/)) continue

				var/s = vrange-m.passive("Undetected")
				if(s <=0) s=2
				if(get_dist(m,src) >= s) continue
				vrange = 10
				return m
			for(var/player/p in oview(vrange,src))
				if(p == summon_owner)
					return p
*/

Enemy

	var
		list/actions

	proc
		addActions() // Actions are added in this proc for enemies.
			addAction(action_list.findTarget)
		addAction(var/Action/action)
			if(actions == null)
				actions = new/list()
			actions.Add(action)

	proc
		execActions()
			if(actions != null && actions.len > 0)
				for(var/Action/action in actions)
					if(action.canDo() && prob(action.getProbability()))
						if(action.doAction()) return
						else continue



//Start --List of actions.

Actions // Dat list
	var
		Action
			FindTarget/findTarget = new/Action/FindTarget()

var/Actions/action_list = new/Actions() // Constant list of actions

//End --List of actions