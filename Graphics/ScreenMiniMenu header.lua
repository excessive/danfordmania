return Def.ActorFrame {
	Def.BitmapText {
		Font = "Common Normal",
		InitCommand = function(self)
			self
				:shadowlength(0)
				:settext(ScreenString("HeaderText"))
		end
	}
}
