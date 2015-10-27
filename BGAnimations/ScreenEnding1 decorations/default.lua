local fontPath = THEME:GetPathF("Common", "Normal")
local songs = tableslice(tableshuffle(SONGMAN:GetAllSongs()), 100)
local spacing_y = 24
local num_items_to_draw = math.ceil(480 / spacing_y)
local num_padding_items = (num_items_to_draw / 2) + 2
local seconds_per_item = 0.1
local begin_fading_out_seconds = (#songs + num_padding_items * 2) * seconds_per_item

local frame = LoadFallbackB()

table.insert(frame, Def.ActorFrame {
	InitCommand = function(self)
		self:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y)
	end,
	BeginCommand = function(self)
		SCREENMAN
			:GetTopScreen()
			:PostScreenMessage("SM_BeginFadingOut", begin_fading_out_seconds)
	end,
	LoadActor("bg"),
	LoadActor("char left") .. {
		InitCommand = function(self)
			self:xy(-250 + 4, 50 + 4)
		end
	},
	LoadActor("char right") .. {
		InitCommand = function(self)
			self:xy(250 + 10, 50 + 7)
		end
	}
}


local scroller = Def.ActorScroller {
	NumItemsToDraw = num_items_to_draw,
	SecondsPerItem = seconds_per_item,
	TransformFunction = function(self, offset, itemIndex, numItems)
		self:y(offset * spacing_y)
	end,
	BeginCommand = function(self)
		self
			:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y)
			:scrollwithpadding(num_padding_items, num_padding_items)
	end
}

for i, song in ipairs(songs) do
	table.insert(scroller, Def.ActorFrame {
		Def.BitmapText {
			_Level = 1,
			File = fontPath,
			InitCommand = function(self)
				self
					:settext(song:GetDisplayFullTitle())
					:diffuse(SONGMAN:GetSongColor(song))
					:strokecolor(color("#575100"))
					:shadowlength(0)
			end
		}
	})
end

table.insert(frame, scroller)

return frame
