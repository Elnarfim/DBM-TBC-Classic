local mod	= DBM:NewMod(523, "DBM-Party-BC", 7, 247)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("@file-date-integer@")
mod:SetCreatureID(18371)
mod:SetEncounterID(1890)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"CHAT_MSG_RAID_BOSS_EMOTE"
)

local specWarnFocusFire	= mod:NewSpecialWarningMove(11528, nil, nil, nil, 1, 2)

function mod:CHAT_MSG_RAID_BOSS_EMOTE(_, _, _, _, target, _, _, _, spellId)
	local targetname = DBM:GetUnitFullName(target) or target
	if spellId == 11528 and targetname == UnitName("player") then
		specWarnFocusFire:Show()
	end
end
