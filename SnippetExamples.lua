-- "Show Enemy Nameplates" and "Show Friendly Nameplates"
local frame = CreateFrame("Frame", "TogglePlatesKeyFrame", UIParent)
frame:RegisterEvent("PLAYER_LOGIN")

frame:SetScript(
    "OnEvent", 
    function(self, event, ...)
        -- Bind the V key to a custom function
        SetBinding("V", "CLICK TogglePlatesButton:LeftButton")

        -- Create a hidden button to catch the click
        local btn = CreateFrame("Button", "TogglePlatesButton", UIParent, "SecureActionButtonTemplate")
        btn:SetScript(
            "OnClick", 
            function()
                local enemyShown = GetCVar("nameplateShowEnemies") == "1"
                local friendShown = GetCVar("nameplateShowFriends") == "1"

                print("Toggling nameplates: enemies=" .. tostring(enemyShown) .. ", friends=" .. tostring(friendShown))

                SetCVar("nameplateShowEnemies", enemyShown and "0" or "1")
                SetCVar("nameplateShowFriends", friendShown and "0" or "1")
            end
        )
    end
)
