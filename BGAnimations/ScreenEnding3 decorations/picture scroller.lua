local names = {
	{ "chris", "Chris Danford", "Seattle, WA, USA" },
	{ "glenn", "Glenn Maynard", "Boston, MA, USA" },
	{ "steve", "Steve Checkoway", "San Diego, CA, USA" }
}

local frame = Def.ActorFrame {
	BeginCommand = function(self)
		SCREENMAN
			:GetTopScreen()
			:PostScreenMessage("SM_BeginFadingOut", (3 * #names))
	end
}

for i=1, #names do
	local name = names[i]

	table.insert(frame, Def.ActorFrame {
		OnCommand = function(self)
			self
				:addx(SCREEN_WIDTH)
				:sleep((i - 1) * 3)
				:decelerate(0.5)
				:addx(-SCREEN_WIDTH)
				:sleep(2)
				:accelerate(0.5)
				:addx(-SCREEN_WIDTH)
		end,
		LoadActor(name[1]) .. {
			InitCommand = function(self)
				self
					:scaletoclipped(520, 342)
					:y(0)
			end
		},
		LoadActor("picture frame"),
		Def.BitmapText {
			Font = "_venacti bold 15px",
			InitCommand = function(self)
				self
					:horizalign(left)
					:xy(100, 138)
					:settext(string.upper(name[2] .. "\n" .. name[3]))
					:strokecolor(color("#00000077"))
			end
		}
	})
end

return frame
