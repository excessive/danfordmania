local gc   = Var("GameCommand")
local font = Def.BitmapText {
	Text = Screen.String(gc:GetText()),
	Font = "_venacti bold 24px"
}

function font:InitCommand()
	self
		:uppercase(true)
		:horizalign(center)
		:shadowlengthx(0)
		:shadowlengthy(2)
		:strokecolor(color("#00000044"))
end

function font:GainFocusCommand()
	self
		:stoptweening()
		:diffuseshift()
		:effectperiod(0.5)
		:effectcolor1(0.5, 1, 0.5, 1)
		:effectcolor2(0.25, 0.5, 0.25, 1)
end

function font:LoseFocusCommand()
	self
		:stoptweening()
		:stopeffect()
end

function font:DisabledCommand()
	self:diffuse { 0.5, 0.5, 0.5, 1 }
end

return Def.ActorFrame { font }
