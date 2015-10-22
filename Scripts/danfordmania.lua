function ScreenTitleMenu_ScrollerTransform(self, offset, itemIndex, numItems)
	self:y(32 * (itemIndex - (numItems - 1) / 2))
end
