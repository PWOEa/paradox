local BadgeService = game:GetService("BadgeService")
local UILibrary = loadstring(game:HttpGet("https://pastebin.com/raw/V1ca2q9s"))()

local MainUI = UILibrary.Load("ParadoX.win | " .. tostring(game.MarketplaceService:GetProductInfo(game.PlaceId).Name))
local Aim = MainUI.AddPage("Aimbot")
local Visuals = MainUI.AddPage("Visuals")
local Misc = MainUI.AddPage("Misc")

local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()
ESP:Toggle(true)
ESP.Players = false 
ESP.Tracers = false 
ESP.Boxes = false 
ESP.Names = false

local Aimbot = loadstring(game:HttpGet("https://raw.githubusercontent.com/PWOEa/paradox/main/aimlib"))()

getgenv().Aimbot.Settings = {
    SendNotifications = false,
    SaveSettings = false, -- Re-execute upon changing
    ReloadOnTeleport = false,
    Enabled = false,
    TeamCheck = false,
    AliveCheck = true,
    WallCheck = false, -- Laggy
    Sensitivity = 0, -- Animation length (in seconds) before fully locking onto target
    TriggerKey = "MouseButton2",
    Toggle = false,
    LockPart = (Value) -- Body part to lock on (Character part's name)
}

getgenv().Aimbot.FOVSettings = {
    Enabled = false,
    Visible = true,
    Amount = 90,
    Color = "255, 255, 255",
    LockedColor = "255, 70, 70",
    Transparency = 0.5,
    Sides = 60,
    Thickness = 1,
    Filled = false
}


Aim.AddToggle("Aimbot", false, function(Value)
    getgenv().Aimbot.Settings.Enabled = Value
end)
Aim.AddDropdown("Part", {
    "Head",
    "Body"
    }, function(Value)
    getgenv().Aimbot.Settings.LockPart = (Value)
end)

Aim.AddToggle("Aimbot FOV", false, function(Value)
    getgenv().Aimbot.FOVSettings.Enabled = Value  
end)
Aim.AddSlider("FOV Size", {Min = 0, Max = 255, Def = 90}, function(Value)
    getgenv().Aimbot.FOVSettings.Amount = Value
end)
Aim.AddSlider("Aim Smooth", {Min = 0.1, Max = 1, Def = 0}, function(Value)
    getgenv().Aimbot.Settings.Sensitivity = Value
end)

Aim.AddToggle("Aimbot Wallcheck", false, function(Value)
    getgenv().Aimbot.Settings.WallCheck = Value  
end)

Aim.AddToggle("Aimbot Team", false, function(Value)
    getgenv().Aimbot.Settings.TeamCheck = Value  
end)

Visuals.AddToggle("ESP", false, function(Value)
    ESP:Toggle(Value)
end)

Visuals.AddToggle("ESP Boxes", false, function(Value)
    ESP.Boxes = Value  
end)

Visuals.AddToggle("ESP Tracers", false, function(Value)
    ESP.Tracers = Value 
end)

Visuals.AddToggle("ESP Nametags", false, function(Value)
    ESP.Names = Value 
end)

Visuals.AddToggle("Show Players", false, function(Value)
    ESP.Players = Value 
end)

Misc.AddToggle("Show Players", false, function(Value)
    ESP.Players = Value 
end)