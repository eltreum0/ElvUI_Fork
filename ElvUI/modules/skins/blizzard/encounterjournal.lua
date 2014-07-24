local E, L, V, P, G = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local S = E:GetModule('Skins')

local function LoadSkin()
	if E.private.skins.blizzard.enable ~= true or E.private.skins.blizzard.encounterjournal ~= true then return end
	EncounterJournal:StripTextures(true)
	
	if E.PixelMode then
		EncounterJournal.backdrop = EncounterJournal:CreateTexture(nil, "BACKGROUND")
		EncounterJournal.backdrop:SetDrawLayer("BACKGROUND", -7)
		EncounterJournal.backdrop:SetTexture(unpack(E['media'].bordercolor))
		EncounterJournal.backdrop:Point("TOPLEFT", EncounterJournal, "TOPLEFT", -E.mult, E.mult)
		EncounterJournal.backdrop:Point("BOTTOMRIGHT", EncounterJournal, "BOTTOMRIGHT", E.mult, -E.mult)

		EncounterJournal.backdrop2 = EncounterJournal:CreateTexture(nil, "BACKGROUND")
		EncounterJournal.backdrop2:SetDrawLayer("BACKGROUND", -4)
		EncounterJournal.backdrop2:SetTexture(unpack(E['media'].backdropcolor))
		EncounterJournal.backdrop2:SetAllPoints()							
	else
		EncounterJournal.backdrop = EncounterJournal:CreateTexture(nil, "BACKGROUND")
		EncounterJournal.backdrop:SetDrawLayer("BACKGROUND", -7)
		EncounterJournal.backdrop:SetTexture(0, 0, 0)
		EncounterJournal.backdrop:Point("TOPLEFT", EncounterJournal, "TOPLEFT", -E.mult*3, E.mult*3)
		EncounterJournal.backdrop:Point("BOTTOMRIGHT", EncounterJournal, "BOTTOMRIGHT", E.mult*3, -E.mult*3)
		
		EncounterJournal.backdrop2 = EncounterJournal:CreateTexture(nil, "BACKGROUND")
		EncounterJournal.backdrop2:SetDrawLayer("BACKGROUND", -6)
		EncounterJournal.backdrop2:SetTexture(unpack(E['media'].bordercolor))
		EncounterJournal.backdrop2:Point("TOPLEFT", EncounterJournal, "TOPLEFT", -E.mult*2, E.mult*2)
		EncounterJournal.backdrop2:Point("BOTTOMRIGHT", EncounterJournal, "BOTTOMRIGHT", E.mult*2, -E.mult*2)						

		EncounterJournal.backdrop3 = EncounterJournal:CreateTexture(nil, "BACKGROUND")
		EncounterJournal.backdrop3:SetDrawLayer("BACKGROUND", -5)
		EncounterJournal.backdrop3:SetTexture(0, 0, 0)
		EncounterJournal.backdrop3:Point("TOPLEFT", EncounterJournal, "TOPLEFT", -E.mult, E.mult)
		EncounterJournal.backdrop3:Point("BOTTOMRIGHT", EncounterJournal, "BOTTOMRIGHT", E.mult, -E.mult)					

		EncounterJournal.backdrop4 = EncounterJournal:CreateTexture(nil, "BACKGROUND")
		EncounterJournal.backdrop4:SetDrawLayer("BACKGROUND", -4)
		EncounterJournal.backdrop4:SetTexture(unpack(E['media'].backdropcolor))
		EncounterJournal.backdrop4:SetAllPoints()		
	end
	EncounterJournalNavBar:StripTextures(true)
	EncounterJournalNavBarOverlay:StripTextures(true)
	
	EncounterJournalNavBar:CreateBackdrop("Default")
	EncounterJournalNavBar.backdrop:Point("TOPLEFT", -2, 0)
	EncounterJournalNavBar.backdrop:SetPoint("BOTTOMRIGHT")
	S:HandleButton(EncounterJournalNavBarHomeButton, true)
	
	S:HandleEditBox(EncounterJournalSearchBox)
	S:HandleCloseButton(EncounterJournalCloseButton)
	
	EncounterJournalInset:StripTextures(true)
	EncounterJournal:HookScript("OnShow", function()
		if not EncounterJournalInstanceSelect.backdrop then	
			if E.PixelMode then
				EncounterJournalInstanceSelect.backdrop = EncounterJournalInstanceSelect:CreateTexture(nil, "BACKGROUND")
				EncounterJournalInstanceSelect.backdrop:SetDrawLayer("BACKGROUND", -3)
				EncounterJournalInstanceSelect.backdrop:SetTexture(unpack(E['media'].bordercolor))
				EncounterJournalInstanceSelect.backdrop:Point("TOPLEFT", EncounterJournalInstanceSelect.bg, "TOPLEFT", -E.mult, E.mult)
				EncounterJournalInstanceSelect.backdrop:Point("BOTTOMRIGHT", EncounterJournalInstanceSelect.bg, "BOTTOMRIGHT", E.mult, -E.mult)

				EncounterJournalInstanceSelect.backdrop2 = EncounterJournalInstanceSelect:CreateTexture(nil, "BACKGROUND")
				EncounterJournalInstanceSelect.backdrop2:SetDrawLayer("BACKGROUND", -2)
				EncounterJournalInstanceSelect.backdrop2:SetTexture(unpack(E['media'].backdropcolor))
				EncounterJournalInstanceSelect.backdrop2:SetAllPoints(EncounterJournalInstanceSelect.bg)					
			else
				EncounterJournalInstanceSelect.backdrop = EncounterJournalInstanceSelect:CreateTexture(nil, "BACKGROUND")
				EncounterJournalInstanceSelect.backdrop:SetDrawLayer("BACKGROUND", -3)
				EncounterJournalInstanceSelect.backdrop:SetTexture(0, 0, 0)
				EncounterJournalInstanceSelect.backdrop:Point("TOPLEFT", EncounterJournalInstanceSelect.bg, "TOPLEFT", -E.mult*3, E.mult*3)
				EncounterJournalInstanceSelect.backdrop:Point("BOTTOMRIGHT", EncounterJournalInstanceSelect.bg, "BOTTOMRIGHT", E.mult*3, -E.mult*3)
				
				EncounterJournalInstanceSelect.backdrop2 = EncounterJournalInstanceSelect:CreateTexture(nil, "BACKGROUND")
				EncounterJournalInstanceSelect.backdrop2:SetDrawLayer("BACKGROUND", -2)
				EncounterJournalInstanceSelect.backdrop2:SetTexture(unpack(E['media'].bordercolor))
				EncounterJournalInstanceSelect.backdrop2:Point("TOPLEFT", EncounterJournalInstanceSelect.bg, "TOPLEFT", -E.mult*2, E.mult*2)
				EncounterJournalInstanceSelect.backdrop2:Point("BOTTOMRIGHT", EncounterJournalInstanceSelect.bg, "BOTTOMRIGHT", E.mult*2, -E.mult*2)						

				EncounterJournalInstanceSelect.backdrop3 = EncounterJournalInstanceSelect:CreateTexture(nil, "BACKGROUND")
				EncounterJournalInstanceSelect.backdrop3:SetDrawLayer("BACKGROUND", -1)
				EncounterJournalInstanceSelect.backdrop3:SetTexture(0, 0, 0)
				EncounterJournalInstanceSelect.backdrop3:Point("TOPLEFT", EncounterJournalInstanceSelect.bg, "TOPLEFT", -E.mult, E.mult)
				EncounterJournalInstanceSelect.backdrop3:Point("BOTTOMRIGHT", EncounterJournalInstanceSelect.bg, "BOTTOMRIGHT", E.mult, -E.mult)	
			end
		end
		
		if not EncounterJournalEncounterFrameInfo.backdrop then
			if E.PixelMode then
				EncounterJournalEncounterFrameInfo.backdrop = EncounterJournalEncounterFrameInfo:CreateTexture(nil, "BACKGROUND")
				EncounterJournalEncounterFrameInfo.backdrop:SetDrawLayer("BACKGROUND", -2)
				EncounterJournalEncounterFrameInfo.backdrop:SetTexture(unpack(E['media'].bordercolor))
				EncounterJournalEncounterFrameInfo.backdrop:Point("TOPLEFT", EncounterJournalEncounterFrameInfoBG, "TOPLEFT", -E.mult, E.mult)
				EncounterJournalEncounterFrameInfo.backdrop:Point("BOTTOMRIGHT", EncounterJournalEncounterFrameInfoBG, "BOTTOMRIGHT", E.mult, -E.mult)

				EncounterJournalEncounterFrameInfo.backdrop2 = EncounterJournalEncounterFrameInfo:CreateTexture(nil, "BACKGROUND")
				EncounterJournalEncounterFrameInfo.backdrop2:SetDrawLayer("BACKGROUND", -1)
				EncounterJournalEncounterFrameInfo.backdrop2:SetTexture(unpack(E['media'].backdropcolor))
				EncounterJournalEncounterFrameInfo.backdrop2:SetAllPoints(EncounterJournalEncounterFrameInfoBG)				
			else
				EncounterJournalEncounterFrameInfo.backdrop = EncounterJournalEncounterFrameInfo:CreateTexture(nil, "BACKGROUND")
				EncounterJournalEncounterFrameInfo.backdrop:SetDrawLayer("BACKGROUND", -3)
				EncounterJournalEncounterFrameInfo.backdrop:SetTexture(0, 0, 0)
				EncounterJournalEncounterFrameInfo.backdrop:Point("TOPLEFT", EncounterJournalEncounterFrameInfoBG, "TOPLEFT", -E.mult*3, E.mult*3)
				EncounterJournalEncounterFrameInfo.backdrop:Point("BOTTOMRIGHT", EncounterJournalEncounterFrameInfoBG, "BOTTOMRIGHT", E.mult*3, -E.mult*3)
				
				EncounterJournalEncounterFrameInfo.backdrop2 = EncounterJournalEncounterFrameInfo:CreateTexture(nil, "BACKGROUND")
				EncounterJournalEncounterFrameInfo.backdrop2:SetDrawLayer("BACKGROUND", -2)
				EncounterJournalEncounterFrameInfo.backdrop2:SetTexture(unpack(E['media'].bordercolor))
				EncounterJournalEncounterFrameInfo.backdrop2:Point("TOPLEFT", EncounterJournalEncounterFrameInfoBG, "TOPLEFT", -E.mult*2, E.mult*2)
				EncounterJournalEncounterFrameInfo.backdrop2:Point("BOTTOMRIGHT", EncounterJournalEncounterFrameInfoBG, "BOTTOMRIGHT", E.mult*2, -E.mult*2)						

				EncounterJournalEncounterFrameInfo.backdrop3 = EncounterJournalEncounterFrameInfo:CreateTexture(nil, "BACKGROUND")
				EncounterJournalEncounterFrameInfo.backdrop3:SetDrawLayer("BACKGROUND", -1)
				EncounterJournalEncounterFrameInfo.backdrop3:SetTexture(0, 0, 0)
				EncounterJournalEncounterFrameInfo.backdrop3:Point("TOPLEFT", EncounterJournalEncounterFrameInfoBG, "TOPLEFT", -E.mult, E.mult)
				EncounterJournalEncounterFrameInfo.backdrop3:Point("BOTTOMRIGHT", EncounterJournalEncounterFrameInfoBG, "BOTTOMRIGHT", E.mult, -E.mult)				
			end							
		end	

	end)
		
	S:HandleScrollBar(EncounterJournalInstanceSelectScrollFrameScrollBar, 4)
	S:HandleScrollBar(EncounterJournalEncounterFrameInfoDetailsScrollFrameScrollBar, 4)
	S:HandleScrollBar(EncounterJournalEncounterFrameInfoLootScrollFrameScrollBar, 4)
	S:HandleScrollBar(EncounterJournalEncounterFrameInstanceFrameLoreScrollFrameScrollBar, 4)
	S:HandleScrollBar(EncounterJournalEncounterFrameInfoBossesScrollFrameScrollBar, 4)
	
	--[[EncounterJournalEncounterFrameInfoBossTab:GetNormalTexture():SetTexture(nil)
	EncounterJournalEncounterFrameInfoBossTab:GetPushedTexture():SetTexture(nil)
	EncounterJournalEncounterFrameInfoBossTab:GetDisabledTexture():SetTexture(nil)
	EncounterJournalEncounterFrameInfoBossTab:GetHighlightTexture():SetTexture(nil)

	EncounterJournalEncounterFrameInfoLootTab:GetNormalTexture():SetTexture(nil)
	EncounterJournalEncounterFrameInfoLootTab:GetPushedTexture():SetTexture(nil)
	EncounterJournalEncounterFrameInfoLootTab:GetDisabledTexture():SetTexture(nil)
	EncounterJournalEncounterFrameInfoLootTab:GetHighlightTexture():SetTexture(nil)	

	EncounterJournalEncounterFrameInfoModelTab:GetNormalTexture():SetTexture(nil)
	EncounterJournalEncounterFrameInfoModelTab:GetPushedTexture():SetTexture(nil)
	EncounterJournalEncounterFrameInfoModelTab:GetDisabledTexture():SetTexture(nil)
	EncounterJournalEncounterFrameInfoModelTab:GetHighlightTexture():SetTexture(nil)		
		
	EncounterJournalEncounterFrameInfoBossTab:Point('TOPLEFT', EncounterJournalEncounterFrameInfo, 'TOPRIGHT', E.PixelMode and -3 or 0, -35)
	hooksecurefunc(EncounterJournalEncounterFrameInfoBossTab, "SetPoint", function(self, point, attachTo, anchorPoint, xOffset, yOffset)
		if point ~= "TOPLEFT" or attachTo ~= EncounterJournalEncounterFrameInfo or anchorPoint ~= "TOPRIGHT" or xOffset ~= (E.PixelMode and -3 or 0) or yOffset ~= -35 then
			EncounterJournalEncounterFrameInfoBossTab:Point('TOPLEFT', EncounterJournalEncounterFrameInfo, 'TOPRIGHT', E.PixelMode and -3 or 0, -35)
		end
	end)
	
	EncounterJournalEncounterFrameInfoBossTab:CreateBackdrop('Default')
	EncounterJournalEncounterFrameInfoBossTab.backdrop:Point('TOPLEFT', 11, -8)
	EncounterJournalEncounterFrameInfoBossTab.backdrop:Point('BOTTOMRIGHT', -6, 8)
	EncounterJournalEncounterFrameInfoLootTab:CreateBackdrop('Default')
	EncounterJournalEncounterFrameInfoLootTab.backdrop:Point('TOPLEFT', 11, -8)
	EncounterJournalEncounterFrameInfoLootTab.backdrop:Point('BOTTOMRIGHT', -6, 8)		
	EncounterJournalEncounterFrameInfoModelTab:CreateBackdrop('Default')
	EncounterJournalEncounterFrameInfoModelTab.backdrop:Point('TOPLEFT', 11, -8)
	EncounterJournalEncounterFrameInfoModelTab.backdrop:Point('BOTTOMRIGHT', -6, 8)		
	
	EncounterJournalEncounterFrameInfoBossTab.backdrop.backdropTexture:SetVertexColor(189/255, 159/255, 88/255)
	EncounterJournalEncounterFrameInfoLootTab.backdrop.backdropTexture:SetVertexColor(189/255, 159/255, 88/255)
	EncounterJournalEncounterFrameInfoModelTab.backdrop.backdropTexture:SetVertexColor(189/255, 159/255, 88/255)]]
end

S:RegisterSkin('Blizzard_EncounterJournal', LoadSkin)