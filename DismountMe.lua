local f = CreateFrame("Frame", "DismountMe", UIParent)
f:RegisterEvent("UI_ERROR_MESSAGE")
f:RegisterEvent("TAXIMAP_OPENED")

f:SetScript("OnEvent", function(self, event, arg1, arg2, ...)
	--print("arg1:", arg1, "| arg2:", arg2)
	if event == "UI_ERROR_MESSAGE" then
		if arg1 == 50 then
			if arg2 == "You must be standing to do that" then
				DoEmote("STAND")
			elseif arg2 == "You are mounted" then
				Dismount()
			end
		elseif arg1 == 213 then
			if arg2 == "You are already mounted! Dismount first." then
				Dismount()
			end
		elseif arg1 == 504 then
			if arg2 == "You can't do that while mounted." then
				Dismount()
			end
		end
	elseif event == "TAXIMAP_OPENED" then
		Dismount()
	end
end)

f:Hide()
