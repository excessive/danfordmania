return Def.ActorFrame {
	Def.DeviceList {
		Font = "Common Normal",
		InitCommand = function(self)
			self
				:xy(SCREEN_LEFT + 20, SCREEN_TOP + 80)
				:zoom(1.4)
				:horizalign(left)
		end
	},
	Def.InputList {
		Font = "Common Normal",
		InitCommand = function(self)
			self
				:xy(SCREEN_CENTER_X - 250, SCREEN_CENTER_Y)
				:zoom(1.4)
				:horizalign(left)
				:vertspacing(8)
		end
	}
}
