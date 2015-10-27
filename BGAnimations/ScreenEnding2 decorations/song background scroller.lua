local template = Def.ActorFrame {
	Def.Sprite {
		OnCommand = function(self)
			self
				:LoadBackground(GetRandomSongBackground())
				:scaletoclipped(226,1 65)
				:y(0)
		end
	},
	LoadActor("background frame")
}

local frame = Def.ActorScroller {
	SecondsPerItem = 4.25,
	NumItemsToDraw = 4,
	TransformFunction = function(self, offset, itemIndex, numItems)
		self:y(-188 * offset)
	end,
	OnCommand = function(self)
		self:scrollwithpadding(2, 3)
	end
}

for i=1, 10 do
	table.insert(frame, template)
end

return frame
