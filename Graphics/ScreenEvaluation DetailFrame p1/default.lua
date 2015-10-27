return Def.ActorFrame {
	LoadActor("frame"),

	-- Use the traditional order: NumSteps, Jumps, Holds, Mines, Hands, Rolls

	LoadActor(THEME:GetPathG("PaneDisplay", "label NumSteps")) .. {
		InitCommand = function(self)
			self
				:horizalign(right)
				:xy(-22, -12 + 16 * 0)
				:shadowlengthx(0)
				:shadowlengthy(2)
				:shadowcolor(color("#000000AA"))
		end
	},
	LoadActor(THEME:GetPathG("PaneDisplay", "label Jumps")) .. {
		InitCommand = function(self)
			self
				:horizalign(right)
				:xy(-22, -12 + 16 * 1)
				:shadowlengthx(0)
				:shadowlengthy(2)
				:shadowcolor(color("#000000AA"))
		end
	},
	LoadActor(THEME:GetPathG("PaneDisplay", "label Holds")) .. {
		InitCommand = function(self)
			self
				:horizalign(right)
				:xy(-22, -12 + 16 * 2)
				:shadowlengthx(0)
				:shadowlengthy(2)
				:shadowcolor(color("#000000AA"))
		end
	},
	LoadActor(THEME:GetPathG("PaneDisplay", "label Mines")) .. {
		InitCommand = function(self)
			self
				:horizalign(right)
				:xy(-22, -12 + 16 * 3)
				:shadowlengthx(0)
				:shadowlengthy(2)
				:shadowcolor(color("#000000AA"))
		end
	},
	LoadActor(THEME:GetPathG("PaneDisplay", "label Hands")) .. {
		InitCommand = function(self)
			self
				:horizalign(right)
				:xy(-22, -12 + 16 * 4)
				:shadowlengthx(0)
				:shadowlengthy(2)
				:shadowcolor(color("#000000AA"))
		end
	},
	LoadActor(THEME:GetPathG("PaneDisplay", "label Rolls")) .. {
		InitCommand = function(self)
			self
				:horizalign(right)
				:xy(-22, -12 + 16 * 5)
				:shadowlengthx(0)
				:shadowlengthy(2)
				:shadowcolor(color("#000000AA"))
		end
	}
}
