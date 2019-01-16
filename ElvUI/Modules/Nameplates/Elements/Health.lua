local E, L, V, P, G = unpack(ElvUI); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB

local NP = E:GetModule('NamePlates')

function NP:Construct_Health(nameplate)
	local Health = CreateFrame('StatusBar', nameplate:GetDebugName()..'Health', nameplate)
	Health:SetFrameStrata(nameplate:GetFrameStrata())
	Health:SetFrameLevel(5)
	Health:SetPoint('CENTER')
	Health:CreateBackdrop('Transparent')
	Health:SetStatusBarTexture(E.LSM:Fetch('statusbar', NP.db.statusbar))
	NP.StatusBars[Health] = true

	function Health:PostUpdate(unit, min, max)
		if NP.db.DarkTheme then
			if min ~= max then
				nameplate.Health:SetStatusBarColor(_G.ElvUI.oUF:ColorGradient(min, max, 1, .1, .1, .6, .3, .3, .2, .2, .2))
			else
				nameplate.Health:SetStatusBarColor(0.2, 0.2, 0.2, 1)
			end
		end

		Health.r, Health.g, Health.b, Health.a = nameplate.Health:GetStatusBarColor()
	end

	Health:SetStatusBarColor(0.29, 0.69, 0.3, 1) -- need option

	Health.frequentUpdates = true
	Health.colorTapping = true
	Health.colorDisconnected = false
	Health.colorReaction = true

	Health.Smooth = true

	return Health
end

function NP:Update_Health(nameplate)
	local db = NP.db.units[nameplate.frameType]

	nameplate.Health.colorClass = db.healthbar.useClassColor

	if db.healthbar.enable then
		if not nameplate:IsElementEnabled('Health') then
			nameplate:EnableElement('Health')
		end
	else
		if nameplate:IsElementEnabled('Health') then
			nameplate:DisableElement('Health')
		end
	end

	if db.healthbar.text.enable then
		nameplate.Health.Text:Show()
	else
		nameplate.Health.Text:Hide()
	end

	nameplate.Health.width = db.healthbar.width
	nameplate.Health.height = db.healthbar.height
	nameplate.Health:SetSize(db.healthbar.width, db.healthbar.height)
end

function NP:Construct_HealthPrediction(nameplate)
	local HealthPrediction = CreateFrame('Frame', nameplate:GetDebugName()..'HealthPrediction', nameplate)

	for _, Bar in pairs({ 'myBar', 'otherBar', 'absorbBar', 'healAbsorbBar' }) do
		HealthPrediction[Bar] = CreateFrame('StatusBar', nil, nameplate.Health)
		HealthPrediction[Bar]:SetFrameStrata(nameplate:GetFrameStrata())
		HealthPrediction[Bar]:SetStatusBarTexture(E.LSM:Fetch('statusbar', NP.db.statusbar))
		HealthPrediction[Bar]:SetPoint('TOP')
		HealthPrediction[Bar]:SetPoint('BOTTOM')
		HealthPrediction[Bar]:SetWidth(150)
		NP.StatusBars[HealthPrediction[Bar]] = true
	end

	HealthPrediction.myBar:SetPoint('LEFT', nameplate.Health:GetStatusBarTexture(), 'RIGHT')
	HealthPrediction.myBar:SetFrameLevel(nameplate.Health:GetFrameLevel() + 2)
	HealthPrediction.myBar:SetStatusBarColor(NP.db.colors.healPrediction.personal.r, NP.db.colors.healPrediction.personal.g, NP.db.colors.healPrediction.personal.b)
	HealthPrediction.myBar:SetMinMaxValues(0, 1)

	HealthPrediction.otherBar:SetPoint('LEFT', HealthPrediction.myBar:GetStatusBarTexture(), 'RIGHT')
	HealthPrediction.otherBar:SetFrameLevel(nameplate.Health:GetFrameLevel() + 1)
	HealthPrediction.otherBar:SetStatusBarColor(NP.db.colors.healPrediction.others.r, NP.db.colors.healPrediction.others.g, NP.db.colors.healPrediction.others.b)

	HealthPrediction.absorbBar:SetPoint('LEFT', HealthPrediction.otherBar:GetStatusBarTexture(), 'RIGHT')
	HealthPrediction.absorbBar:SetFrameLevel(nameplate.Health:GetFrameLevel())
	HealthPrediction.absorbBar:SetStatusBarColor(NP.db.colors.healPrediction.absorbs.r, NP.db.colors.healPrediction.absorbs.g, NP.db.colors.healPrediction.absorbs.b)

	HealthPrediction.healAbsorbBar:SetPoint('RIGHT', nameplate.Health:GetStatusBarTexture())
	HealthPrediction.healAbsorbBar:SetFrameLevel(nameplate.Health:GetFrameLevel() + 3)
	HealthPrediction.healAbsorbBar:SetStatusBarColor(NP.db.colors.healPrediction.healAbsorbs.r, NP.db.colors.healPrediction.healAbsorbs.g, NP.db.colors.healPrediction.healAbsorbs.b)
	HealthPrediction.healAbsorbBar:SetReverseFill(true)

	HealthPrediction.maxOverflow = 1
	HealthPrediction.frequentUpdates = true

	return HealthPrediction
end

function NP:Update_HealthPrediction(nameplate)
	local db = NP.db.units[nameplate.frameType]

	if db.healthbar.enable and db.healthbar.healPrediction then
		if not nameplate:IsElementEnabled('HealthPrediction') then
			nameplate:EnableElement('HealthPrediction')
		end
	else
		if nameplate:IsElementEnabled('HealthPrediction') then
			nameplate:DisableElement('HealthPrediction')
		end
	end

	nameplate.HealthPrediction.myBar:SetStatusBarColor(NP.db.colors.healPrediction.personal.r, NP.db.colors.healPrediction.personal.g, NP.db.colors.healPrediction.personal.b)
	nameplate.HealthPrediction.otherBar:SetStatusBarColor(NP.db.colors.healPrediction.others.r, NP.db.colors.healPrediction.others.g, NP.db.colors.healPrediction.others.b)
	nameplate.HealthPrediction.absorbBar:SetStatusBarColor(NP.db.colors.healPrediction.absorbs.r, NP.db.colors.healPrediction.absorbs.g, NP.db.colors.healPrediction.absorbs.b)
	nameplate.HealthPrediction.healAbsorbBar:SetStatusBarColor(NP.db.colors.healPrediction.healAbsorbs.r, NP.db.colors.healPrediction.healAbsorbs.g, NP.db.colors.healPrediction.healAbsorbs.b)
end
