DismountMe = CreateFrame("Frame")
DismountMe:RegisterEvent("UI_ERROR_MESSAGE")


-- Quriable buff effects from https://wowwiki.fandom.com/wiki/Queriable_buff_effects
DismountMe.Buffs = {
  "Spell_Nature_Swiftness", -- Warlock Summon Felsteed Mount
  "Ability_Mount_Dreadsteed", -- Warlock Summon Dreadsteed Mount
  "_Mount_", --Other Mounts
  
  "Ability_Racial_Bearform", -- Druid Bear form
  "Ability_Druid_Catform",-- Druid Cat form
  "Ability_Druid_Travelform", -- Druid Travel form
  "Ability_Druid_Aquaticform", -- Druid Aquatic form
  "Spell_Nature_Spiritwolf", -- Shaman Spirit Wolf
  
  "Ability_Mount_BlackDireWolf", -- Black Dire Wolf Mount
  "Ability_Mount_WhiteDireWolf", -- White Dire Wolf Mount
  "Ability_Mount_Kodo_01", -- Kodo 01 Mount
  "Ability_Mount_Kodo_03", -- Kodo 01 Mount
  "Ability_Mount_Raptor", -- Raptor Mount
  "Ability_Mount_Undeadhorse", -- Undead Horse Mount
  "Ability_Mount_JungleTiger", -- Jungle Tiger Mount
  "Ability_Mount_WhiteTiger", -- White TigerMount
  "Ability_Mount_PinkTiger" -- Pink Tiger Mount
}
-- Show Errors
DismountMe.Errors = { SPELL_FAILED_NOT_MOUNTED, ERR_ATTACK_MOUNTED, ERR_TAXIPLAYERALREADYMOUNTED,
  SPELL_FAILED_NOT_SHAPESHIFT, SPELL_FAILED_NO_ITEMS_WHILE_SHAPESHIFTED, SPELL_NOT_SHAPESHIFTED,
  SPELL_NOT_SHAPESHIFTED_NOSPACE, ERR_CANT_INTERACT_SHAPESHIFTED, ERR_NOT_WHILE_SHAPESHIFTED,
  ERR_NO_ITEMS_WHILE_SHAPESHIFTED, ERR_TAXIPLAYERSHAPESHIFTED,ERR_MOUNT_SHAPESHIFTED }

-- Function
DismountMe:SetScript("OnEvent", function()
    for id, errorstring in pairs(DismountMe.Errors) do
      if arg1 == errorstring then
        for i=0,15,1 do
          currBuffTex = GetPlayerBuffTexture(i);
          if (currBuffTex) then

            for id, bufftype in pairs(DismountMe.Buffs) do
              if string.find(string.lower(currBuffTex), bufftype) then
                CancelPlayerBuff(i);
              end
            end
          end
        end
      end
    end
  end)

