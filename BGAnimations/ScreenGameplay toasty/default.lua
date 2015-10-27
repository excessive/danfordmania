return Def.ActorFrame {
	LoadActor("toasty") .. {
		OnCommand = function(self)
			self
				:xy(SCREEN_WIDTH, SCREEN_HEIGHT)
				:horizalign(left)
				:vertalign(bottom)
				:decelerate(0.3)
				:x(468)
				:sleep(1.0)
				:accelerate(0.3)
				:x(SCREEN_WIDTH)
		end
	},
	LoadActor(THEME:GetPathS("", "_toasty")) .. {
		StartTransitioningCommand = function(self)
			self:play()
		end
	}
}
