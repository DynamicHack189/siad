if not game:IsLoaded() then
    game.Loaded:Wait()
end
local Lib = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

-- Save Things


function Notify(title,txt,dur)
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()
OrionLib:MakeNotification({
	Name = title,
	Content = txt,
	Image = "rbxassetid://96495493705878",
	Time = dur
})
end

Notify("Jailbreak Script","Starting All",3)
local RayfieldThemeList = {"Default","Ocean","AmberGlow","Light","Amethyst","Green","Bloom","DarkBlue","Serenity"}
local Win = Lib:CreateWindow({
   Name = "Jailbreak",
   Icon = "banana",
   LoadingTitle = "SS. Starkield",
   LoadingSubtitle = "Starkield Series Scripts",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = true,
   DisableBuildWarnings = false, 

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})
local LibOk = true
local CoreAssets = Instance.new("Folder",game.CoreGui)

CoreAssets.Name = "Starkield Assets"

-- Tables

-- Functions

local function GetPlayer()
pcall(function()
    return game.Players.LocalPlayer
end)
end

-- Get the player's humanoid
local function GetHumanoid()
pcall(function()
    local Character = game.Players.LocalPlayer.Character
    if Character then
        return Character:FindFirstChild("Humanoid")
    end
    return nil -- Return nil if no humanoid is found
end)
end

-- Get the player's humanoid root part

function TPCF(CF)
pcall(function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CF
end)
end

local function GetHRP()
pcall(function()
    local Character = game.Players.LocalPlayer.Character
    if Character then
        return Character:FindFirstChild("HumanoidRootPart")
    end
    return nil -- Return nil if no humanoid root part is found
    end)
end

-- Get the player's character
local function GetCharacter()
pcall(function()
    local Character = game.Players.LocalPlayer.Character
    if Character then
        return Character
    end
    return nil -- Return nil if no character is found
    end)
end

local function FindOnDes(obj, Target)
pcall(function() 
    local Des = obj:GetDescendants()

    for _, child in pairs(Des) do
        if child.Name == Target then
            return child
        end
    end

    return nil 
end)
end

function Shoot()
    local VIM = game:GetService("VirtualInputManager")
    local UIS = game:GetService("UserInputService")
    local MousePosition = UIS:GetMouseLocation()

    VIM:SendMouseButtonEvent(MousePosition.X, MousePosition.Y, 0, true, game, 1)
    task.wait(0.1)
    VIM:SendMouseButtonEvent(MousePosition.X, MousePosition.Y, 0, false, game, 1)
end

function AimToPart(Object)
	local camera = game.Workspace.CurrentCamera
	camera.CFrame = CFrame.new(camera.CFrame.Position, Object.Position)
end

function ChangeRayfieldTheme(Theme)
Win.ModifyTheme(Theme)
end

--[[
function SendHttpRequest(Data, Url)
    local s, e = pcall(function()
        if Data and Url then
            local JSON = game:GetService("HttpService"):JSONEncode(Data)
            if syn then
                syn.request({
                    Url = Url,
                    Method = "POST",
                    Headers = { ["Content-Type"] = "application/json" },
                    Body = JSON
                })
            elseif http_request then
                http_request({
                    Url = Url,
                    Method = "POST",
                    Headers = { ["Content-Type"] = "application/json" },
                    Body = JSON
                })
            end
        end
    end)
    
    if not s then
        error("Http Request Failed by: "..e)
        Notify("Webhook Error:",e,3,"shield-x")
    end
end]]

-- Vars and getgenv()

-- Numbers

local Speed = 16
local JumpHeight = 7.2
local JumpPower = 40
local Gravity = 196

-- Boleans

local AutoSetSpeed = false
local AutoSetJumpHeight = false
local AutoSetJumpPower = false
local AutoSetGravity = false
local Noclip = false
local Aimbot = false
local AimbotPolice = true

-- Strings

-- Misc Code

if PreferencesTable.Theme then
    ChangeRayfieldTheme(PreferencesTable.Theme)
end

local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")

-- ESP Box
local SizeBox = Vector3.new(4,5.5,2)
local ESPBOX = Instance.new("Part",CoreAssets)
local ESPBIL = Instance.new("BillboardGui",ESPBOX)
local ESPFRAME = Instance.new("Frame",ESPBIL)

ESPBOX.Name = "ESP"
ESPBOX.Transparency = 1
ESPBOX.Size = SizeBox
ESPBIL.AlwaysOnTop = true
ESPBIL.Size = UDim2.new(1,0,1,0)
ESPFRAME.Size = UDim2.new(1,0,1,0)

local plr = game:GetService("Players").LocalPlayer
local gotted = false
local marker 

for _,obj in pairs(plr.PlayerGui.WorldMarkersGui:GetChildren()) do
    if obj.ImageLabel.ImageLabel.Image == "rbxassetid://7028057307" and not gotted then
        gotted = true
        local clone = obj:Clone()
        clone.Parent = CoreAssets
        clone.Name = "ESPMarker"
    end
end

-- ESP Func
function ESP(bool)
    local Colors = {}
    local s, e = pcall(function()
        if bool then
            for _, plr in pairs(Players:GetChildren()) do
                if plr ~= game.Players.LocalPlayer and plr.Character and plr.Team ~= LocalPlayer.Team then

                end 
            end
        else
            for _, plr in pairs(Players:GetChildren()) do
                if plr ~= game.Players.LocalPlayer and plr.Character then
                    local esp = plr.Character:FindFirstChild("ESP")
                    if esp then
                        esp:Destroy()
                    end
                end
            end
        end
    end)

    if not s then
        warn("ESP Error: " .. e)
    end
end


-- Tabs

local HomeTab = Win:CreateTab("Home", "home")

local ScriptsTab = Win:CreateTab("Scripts", "scroll-text")

local PlayerTab = Win:CreateTab("Player", "user")

local OPTab = Win:CreateTab("Op & Farm", "banana")

--local BotTab = Win:CreateTab("Ultra Bot Farm", "bot-message-square")

-- Home

HomeTab:CreateButton({
    Name = "Quit",
    Callback = function()
    CoreAssets:Destroy()
    LibOk = false
    script:Destroy()
    Lib:Destroy()
    end
})

HomeTab:CreateDropdown({
    Name = "Custom Theme",
    Options = RayfieldThemeList,
    CurrentOption = {"Default"},
    MultipleOptions = false,
    flag = "ThemeDropdown",
    Callback = function(opt)
       local theme = opt[1]
       ChangeRayfieldTheme(theme)
    end
})

HomeTab:CreateLabel("Creator YT: @Un Robloxxer or Starkield")
HomeTab:CreateLabel("Script Version: 2.0")
HomeTab:CreateLabel("Last Update: 1/17/2025") -- mm/dd/yyyy
HomeTab:CreateLabel("Update Log")


-- Scripts

ScriptsTab:CreateButton({
    Name = "Infinity Yield",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end
})

ScriptsTab:CreateButton({
    Name = "Dex",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MariyaFurmanova/Library/main/dex2.0", true))()
    end
})

ScriptsTab:CreateButton({
    Name = "Bombox Gui By Starkield",
    Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/BvyGGrs1"))()
    end
})

ScriptsTab:CreateButton({
    Name = "Btools",
    Callback = function()
    loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))()
    end
})

ScriptsTab:CreateButton({
    Name = "Copy You Actual Position",
    Callback = function()
    setclipboard(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
    end
})

ScriptsTab:CreateButton({
    Name = "Copy You Actual CFrame",
    Callback = function()
    setclipboard(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
    end
})

-- TP

-- Player

PlayerTab:CreateToggle({
	Name = "Noclip",
	Default = false,
	Callback = function(V)
    Noclip = V
	end    
})
PlayerTab:CreateSlider({
    Name = "Player Speed (Risk if is more that 24)",
    Range = {0, 100},
    Increment = 1,
    Suffix = "",
    CurrentValue = 20,
    Callback = function(V)
        local Hum = GetHumanoid()
        Hum.WalkSpeed = V
        Speed = V
    end
})

PlayerTab:CreateToggle({
    Name = "Auto Set Speed",
    Default = false,
    Callback = function(V)
        AutoSetSpeed = V
    end
})

PlayerTab:CreateSlider({
    Name = "Player Jump Power (Risk)",
    Range = {0, 1000},
    Increment = 1,
    Suffix = "",
    CurrentValue = 40,
    Callback = function(V)
        local Hum = GetHumanoid()
        Hum.JumpPower = V
        JumpPower = V
    end
})

PlayerTab:CreateToggle({
    Name = "Auto Set Jump Power (Risk)",
    Default = false,
    Callback = function(V)
        AutoSetJumpPower = V
    end
})

PlayerTab:CreateSlider({
    Name = "Gravity (Risk)",
    Range = {0, 1000},
    Increment = 1,
    Suffix = "",
    CurrentValue = 196,
    Callback = function(V)
        workspace.Gravity = V
        Gravity = V
    end
})

PlayerTab:CreateToggle({
    Name = "Auto Set Gravity",
    Default = false,
    Callback = function(V)
        AutoSetGravity = V
    end
})

PlayerTab:CreateSlider({
    Name = "Player Jump Height (Risk)",
    Range = {0, 1000},
    Increment = 1,
    Suffix = "",
    CurrentValue = 7,
    Callback = function(V)
        local Hum = GetHumanoid()
        Hum.JumpHeight = V
        JumpHeight = V
    end
})

PlayerTab:CreateToggle({
    Name = "Auto Set Jump Height",
    Default = false,
    Callback = function(V)
        AutoSetJumpHeight = V
    end
})

-- OP

OPTab:CreateLabel("OP Stuff")
OPTab:CreateDivider()

OPTab:CreateToggle({
    Name = "ESP",
    CurrentValue = false,
    Callback = function(v)
       ESP(v)
    end
})

OPTab:CreateButton({
    Name = "Open Enter Prision Door's (just work whit key)",
    Callback = function()
    fireclickdetector(workspace.Button.ClickLeft:WaitForChild("ClickDetector"))
    fireclickdetector(workspace.Button.ClickRight:WaitForChild("ClickDetector"))
    end
})

OPTab:CreateButton({
    Name = "Open The Car Door (Prision)",
    Callback = function()
    for _,obj in pairs(game.workspace:GetDescendants()) do
        if obj.Name == "Click" then
            if obj.Position == Vector3.new(-1284.02978515625, 39.17498779296875, -1562.9122314453125) then
                fireclickdetector(obj)
            end
        end
    end
    end
})

OPTab:CreateButton({
    Name = "Got A Shoot Gun",
    Callback = function()
    pcall(function()
    local target = "Shotgun"
    for _,obj in pairs(workspace.Givers:GetDescendants()) do
        if obj.Name == "Station" then
            if obj.Item.Value == target then
                fireclickdetector(obj.ClickDetector)
            end
        end
    end
    end)
    end
})

OPTab:CreateButton({
    Name = "Got A Pistol",
    Callback = function()
    pcall(function()
    local target = "Pistol"
    for _,obj in pairs(workspace.Givers:GetDescendants()) do
        if obj.Name == "Station" then
            if obj.Item.Value == target then
                fireclickdetector(obj.ClickDetector)
            end
        end
    end
    end)
    end
})

OPTab:CreateButton({
    Name = "Got A Baton",
    Callback = function()
    fireclickdetector(workspace.Givers.Station:WaitForChild("ClickDetector"))
    end
})

OPTab:CreateButton({
    Name = "Got A Donut",
    Callback = function()
    local s,e = pcall(function()
    local Collision = workspace.TouchTrigger:GetChildren()[2]
    local backpack = game:GetService("Players").LocalPlayer.Folder
    local hrp = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart

    local oldCF = Collision.CFrame

    wait(0.1)
    Collision.CFrame = hrp.CFrame
    wait(0.3)
    Collision.CFrame = oldCF

    if not s then warn(e) end
    end)
    end
})

OPTab:CreateButton({
    Name = "Got A Police Hat",
    Callback = function()
    pcall(function()
    local target = "HatPolice"
    for _,obj in pairs(workspace.Givers:GetDescendants()) do
        if obj.Name == "Station" then
            if obj.Item.Value == target then
                fireclickdetector(obj.ClickDetector)
            end
        end
    end
    end)
    end
})

OPTab:CreateButton({
    Name = "Got A Police Shirt",
    Callback = function()
    pcall(function()
    local target = "ShirtPolice"
    for _,obj in pairs(workspace.Givers:GetDescendants()) do
        if obj.Name == "Station" then
            if obj.Item.Value == target then
                fireclickdetector(obj.ClickDetector)
            end
        end
    end
    end)
    end
})

OPTab:CreateButton({
    Name = "Got A Police Pant",
    Callback = function()
    pcall(function()
    local target = "PantsPolice"
    for _,obj in pairs(workspace.Givers:GetDescendants()) do
        if obj.Name == "Station" then
            if obj.Item.Value == target then
                fireclickdetector(obj.ClickDetector)
            end
        end
    end
    end)
    end
})

OPTab:CreateButton({
    Name = "Destroy All Cells",
    Callback = function()
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj.Name == "Cell" then
                local door = obj:FindFirstChild("Door")
                if door then
                    door:Destroy()
                end
            end
        end
    end
})

OPTab:CreateToggle({
    Name = "Bypass Prision Dors",
    CurrentValue = false,
    Callback = function(v) 
    pcall(function()
    for _,obj in pairs(game.workspace:GetDescendants()) do -- white doors
       if obj.Name == "SwingDoor" then
           for _,child in pairs(obj:GetDescendants()) do
               local succes = pcall(function()
                   child.CanCollide = not v
               end)
               if succes then
                   child.CanCollide = not v
               end
           end
       end
   end

   workspace:GetChildren()[1112].Model.Part.CanCollide = not v -- electric door

   workspace:GetChildren()[1112].Model.Part.CanCollide = not v -- other electric door
   end)
    end
})

OPTab:CreateToggle({
    Name = "Aimbot",
    CurrentValue = false,
    Callback = function(v) 
    Aimbot = v
    end
})

OPTab:CreateToggle({
    Name = "Aimbot Police",
    CurrentValue = false,
    Callback = function(v) 
    AimbotPolice = v
    end
})

OPTab:CreateLabel("Farm OP")
OPTab:CreateDivider()

-- Bot
--[[
BotTab:CreateInput({
    Name = "Webhook Url",
    CurrentValue = "",
    PlaceholderText = "hereyouwebhookurl",
    RemoveTextAfterFocusLost = false,
    Callback = function(txt)
       getgenv().HttpRequestUrl = txt
    end
})

BotTab:CreateToggle({
    Name = "Send Money To Webhook",
    CurrentValue =  getgenv().WebhookBotConfig.SendMoney or true,
    Callback = function(v)
       getgenv().WebhookBotConfig.SendMoney = v
    end
})

BotTab:CreateToggle({
    Name = "Send Level To Webhook",
    CurrentValue =  getgenv().WebhookBotConfig.SendLevel or true,
    Callback = function(v)
       getgenv().WebhookBotConfig.SendLevel = v
    end
})

BotTab:CreateToggle({
    Name = "Send Username To Webhook",
    CurrentValue =  getgenv().WebhookBotConfig.SendName or true,
    Callback = function(v)
       getgenv().WebhookBotConfig.SendName = v
    end
})

BotTab:CreateToggle({
    Name = "Send Hour To Webhook",
    CurrentValue =  getgenv().WebhookBotConfig.SendHour or true,
    Callback = function(v)
       getgenv().WebhookBotConfig.SendHour = v
    end
})

BotTab:CreateToggle({
    Name = "Send Date To Webhook",
    CurrentValue =  getgenv().WebhookBotConfig.SendDate or true,
    Callback = function(v)
       getgenv().WebhookBotConfig.SendDate = v
    end
})

BotTab:CreateSlider({
    Name = "Post Request Delay",
    Range = {1,600},
    Increment = 1,
    Suffix = "Seconds",
    CurrentValue = getgenv().WebhookBotConfig.PostDelay or 15,
    Callback = function(v)
       getgenv().WebhookBotConfig.PostDelay = v
    end
})

local SNWWCGC = false
BotTab:CreateToggle({
    Name = "Send Notification When Webhook Cicle Get Completed",
    CurrentValue = true,
    Callback = function(v)
       SNWWCGC = v
    end
})

BotTab:CreateToggle({
    Name = "Active Webhook Post's",
    Default = false,
    Callback = function(v)
       getgenv().HttpWebHook = v
    end
})

BotTab:CreateButton({
    Name = "Fire Webhook",
    Callback = function()
        local plr = GetPlayer()
        local le = plr.leaderstats
        local Hour = os.date("%H:%M:%S")
        local Date = os.date("%m/%d/%Y")

        -- Main Config
        local URL = getgenv().HttpRequestUrl
        local SendMoney = getgenv().WebhookBotConfig.SendMoney
        local SendLevel = getgenv().WebhookBotConfig.SendLevel
        local SendName = getgenv().WebhookBotConfig.SendName
        local SendHour = getgenv().WebhookBotConfig.SendHour
        local SendDate = getgenv().WebhookBotConfig.SendDate
        -- Code

        local Package = {}

        if SendMoney then
            Package.Money = le["Money"].Value
        end

        if SendLevel then
            Package.Level = le["Level"].Value
        end

        if SendName then
            Package.Name = plr.Name
        end

        if SendHour then
            Package.Hour = Hour
        end

        if SendDate then
            Package.Date = Date
        end

        if next(Package) ~= nil and URL then
           SendHttpRequest(Package,URL)
           Notify("Webhook Fisch","Webhook Fired!!!")
           else
           Notify("Webhook Fisch","Ayo wth select almost 1 thing to send or u dont have a url",3,"bell")
        end

    end
})]]

-- Main loop
spawn(function()
while wait(0.1) do

    -- Misc functionality
    if AutoSetGravity then
        workspace.Gravity = Gravity
    end

    -- Player, character, and humanoid updates
    local Hum = GetHumanoid()
    if AutoSetJumpPower and Hum then
        Hum.JumpPower = JumpPower
    end

    if AutoSetJumpHeight and Hum then
        Hum.JumpHeight = JumpHeight
    end

    if AutoSetSpeed and Hum then
        Hum.WalkSpeed = Speed
    end

    -- Exit loop if the library is destroyed
    if not LibOk then
        break
    end
end
end)

spawn(function()
    while task.wait(0.3) do
        if Aimbot then
            local plr = game:GetService("Players").LocalPlayer
            local ms = plr:GetMouse()
            local mstarget = ms.Target
            
            if mstarget and mstarget.Parent and mstarget.Parent:FindFirstChild("Humanoid") then
                local Tarplr = game:GetService("Players"):FindFirstChild(mstarget.Parent.Name)
                if Tarplr then
                    if AimbotPolice and Tarplr.Team == "Police" or not AimbotPolice and Tarplr.Team == "Criminal" then
                    local head = mstarget.Parent:FindFirstChild("Head")
                    if head then
                        repeat 
                            task.wait()
                            AimToPart(head)
                            Shoot()
                        until not ms.Target or ms.Target.Parent ~= mstarget.Parent
                    end
                    end
                end
            end
        end

        if not LibOk then
            break
        end
    end
end)

--[[
spawn(function() -- Webhook
    while wait(getgenv().WebhookBotConfig.PostDelay) do
        local plr = GetPlayer()
        local le = plr.leaderstats
        local Hour = os.date("%H:%M:%S")
        local Date = os.date("%m/%d/%Y")

        -- Main Config
        local URL = getgenv().HttpRequestUrl
        local SendMoney = getgenv().WebhookBotConfig.SendMoney
        local SendLevel = getgenv().WebhookBotConfig.SendLevel
        local SendName = getgenv().WebhookBotConfig.SendName
        local SendHour = getgenv().WebhookBotConfig.SendHour
        local SendDate = getgenv().WebhookBotConfig.SendDate
        -- Code

        local Package = {}

        if SendMoney then
            Package.Money = le["C$"].Value
        end

        if SendLevel then
            Package.Level = le["Level"].Value
        end

        if SendName then
            Package.Name = plr.Name
        end

        if SendHour then
            Package.Hour = Hour
        end

        if SendDate then
            Package.Date = Date
        end

        if next(Package) ~= nil and URL and getgenv().HttpWebHook then
           SendHttpRequest(Package,URL)
           if SNWWCGC then Notify("Webhook Fisch","Webhook Fired!!!") end
           else
           if getgenv().HttpWebHook then Notify("Webhook Ficsh","Ayo wth select almost 1 thing to send or u dont have a url",3,"bell") end
        end

        if not LibOk then
            break
        end
    end
end)]]

spawn(function() -- Noclip While
while wait(0.5) do

	if Noclip then
        local Char = GetCharacter()
        if Char then
            for _, P in pairs(Char:GetChildren()) do
                if P:IsA("BasePart") then
                    P.CanCollide = false
                end
            end
        end
    else
        local Char = GetCharacter()
        if Char then
            for _, P in pairs(Char:GetChildren()) do
                if P:IsA("BasePart") then
                    P.CanCollide = true
                end
            end
        end
    end

    -- Exit loop if the library is destroyed
    if not LibOk then
        break
    end
end
end)
