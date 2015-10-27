local jl = Var "JudgmentLine"

return Def.ActorFrame {
	LoadActor("frame") .. {
		InitCommand = function(self)
			self:y(4)
		end
	},
	Def.BitmapText {
		Font = "_sf square head 13px",
		InitCommand = function(self)
			self
				:y(2)
				:settext(string.upper(JudgmentLineToLocalizedString(jl)))
				:diffuse(JudgmentLineToColor(jl))
				:strokecolor(JudgmentLineToStrokeColor(jl))
				:shadowlength(0)
				:maxwidth(180)
		end
	}
}
