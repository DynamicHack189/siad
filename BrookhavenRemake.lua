if game:IsLoaded() == false then
    game.Loaded:Wait()
end

local OrionLib = loadstring(game:HttpGet(('https://pastebin.com/raw/87ESbY5w')))()
function Notify(title,txt,dur)
    OrionLib:MakeNotification({
        Name = title,
        Content = txt,
        Image = "rbxassetid://96495493705878",
        Time = dur
    })
end
Notify("Brookhaven Script","Loading key system...")

local foldername = "Starkield Key System Saved.txt"
local Lib1 = loadstring(game:HttpGet(("https://pastebin.com/raw/87ESbY5w")))()
local KeyLib = loadstring(game:HttpGet("https://cdn.keyguardian.org/library/v1.0.0.lua"))()
local KSW = Lib1:MakeWindow({Name = "Starkiel Scripts | Brookhaven🏠🌳 KEY SYSTEM", HidePremium = false, SaveConfig = true, ConfigFolder = "SSB2"})
local pubt = "efe37d10fe6042dc80603871f3b03224"
local privt = "5525b05af99f41af885121d41a65278b"
local key = ""
local valid = "Key Valid Key Succes"
local invalid = "Key Invalid Key not Succes"
if isfile(foldername) then
    key = readfile(foldername)
    Notify("Key System","last key has been loaded")
end

KeyLib.Set({
  publicToken = "efe37d10fe6042dc80603871f3b03224",
  privateToken = "5525b05af99f41af885121d41a65278b",
  trueData = valid,
  falseData = invalid,
})

local KSTab = KSW:MakeTab({
	Name = "Key System 🔑",
	Icon = "rbxassetid://98389898506367",
	PremiumOnly = false
})

KSTab:AddButton({
    Name = "Exit",
    Callback = function()
    OrionLib:Destroy()
    Lib1:Destroy()
    end
})

KSTab:AddButton({
    Name = "Get Link",
    Callback = function()
    setclipboard(KeyLib.getLink())
    Notify("Key System","Link Copied, Good Luck U Will Need It...")
    end
})

local KeyTextBox = KSTab:AddTextbox({
    Name = "Enter You Key!!!",
    Default = key,
    Callback = function(txt)
    key = txt
    end
})

KSTab:AddButton({
    Name = "Check Key",
    Callback = function(txt)
    local DefRes = KeyLib.validateDefaultKey(key)
    local PreRes = KeyLib.validatePremiumKey(key)
    print(DefRes,PreRes)
    if DefRes == valid or PreRes == valid then

    Notify("Key System","Key Succes")
    writefile(foldername,key)
    Lib1:Destroy()

if PreRes == valid then
    Notify("Thanks","I see that you have a premium key Thanks For Support Me!!!")
else
    Notify("Thanks","Thanks For Got A Ad Key You're Supporting Me!!!")
end

--[[
    Loading Script
]]

local Lib = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

Notify("Brookhaven Script","Setuping up all...")

Notify("Jailbreak Script","Setuping all",3)
local RayfieldThemeList = {"Default","Ocean","AmberGlow","Light","Amethyst","Green","Bloom","DarkBlue","Serenity"}
local Win = Lib:CreateWindow({
   Name = "Brookhaven",
   Icon = "banana",
   LoadingTitle = "Remake",
   LoadingSubtitle = "Starkield Deluxe Scripts",
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

local HomeTab = Win:CreateTab("Home","home")

HomeTab:CreateButton({
    Name = "Quit",
    Callback = function()
        OrionLib:Destroy()
        Lib:Destroy()
        LibOk = false
    end
})

-- Misc Code
local updfps

local ScriptsTab = Win:CreateTab("Scripts","scroll-text")

local TPTab = Win:CreateTab("Tp","telescope")

local MainTab = Win:CreateTab("Funny Stuff","banana")

local Gravity = {g = 192, ag = false}
local Speed = {s = 16, as = false}
local JumpPower = {jp = 50, ajp = false}
local JumpHeight = {jh = 7.2, ajh = false}
local FlingCar = {ctf = "", fm = 1, nf = Vector3.new(10000, 10000, 10000), nv = Vector3.new(10000, 15000, 10000)}
local Noclip = false

local ESPBOXSIZE = Vector3.new(3,5,1)

local plr = game:GetService("Players").LocalPlayer

local ImportantEvents = { -- All Important Events That I Know
SpawnCar = game:GetService("ReplicatedStorage").RE["1Ca1r"],
NameBioTxt = game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"],
NameBioColor = game:GetService("ReplicatedStorage").RE["1RPNam1eColo1r"], -- I Think That All Colors Events Require A Color3.fromRGB()
Job = game:GetService("ReplicatedStorage").RE["1Jo1b"],
House1 = game:GetService("ReplicatedStorage").RE["1Player1sHous1e"]
}

local ImportantArgs = { -- All Args Of The Importants Events
SpawnCar = "PickingCar",
NameTxt = "RolePlayName",
BioTxt = "RolePlayBio",
NameColor = "PickingRPNameColor",
BioColor = "PickingRPBioColor",
Job = "GiveJobUIMenu", -- re:FireServer(arg, job.Name, job.Name, job.JobTitle.JobValue)
HouseColor = "ColorPickHouse"
}

function FireEvent(event,args)
    if event == "Car" then
        local re = ImportantEvents.SpawnCar
        local arg1 = ImportantArgs.SpawnCar
        re:FireServer(arg1, args.arg1)

    elseif event == "Name" then 
        local re = ImportantEvents.NameBioTxt
        local arg1 = ImportantArgs.NameTxt
        re:FireServer(arg1,args.arg1)

    elseif event == "Bio" then 
        local re = ImportantEvents.NameBioTxt
        local arg1 = ImportantArgs.BioTxt
        re:FireServer(arg1,args.arg1)

    elseif event == "Job" then 
        local re = ImportantEvents.Job
        local arg1 = ImportantArgs.Job
        re:FireServer(arg1,args.arg1,args.arg1,true)

    elseif event == "NameColor" then
        local re = ImportantEvents.NameBioColor
        local arg1 = ImportantArgs.NameColor
        re:FireServer(arg1,args.arg1)

    elseif event == "BioColor" then
        local re = ImportantEvents.NameBioColor
        local arg1 = ImportantArgs.BioColor
        re:FireServer(arg1,args.arg1)

    end
end

function StopVelocity()
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local rootPart = character:WaitForChild("HumanoidRootPart")
    rootPart.Velocity = Vector3.new(0, 0, 0)
    rootPart.RotVelocity = Vector3.new(0, 0, 0)
    rootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
    rootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
    for _, v in ipairs(rootPart:GetChildren()) do
        if v:IsA("BodyVelocity") or v:IsA("BodyForce") then
            v:Destroy()
        end
    end
end

function GetChar()
    local s,e,chr pcall(function()
        return plr.Character
    end)
    return chr
end

function GetHum()
    return plr.Character.Humanoid
end

function GetRoot()
    return plr.Character.HumanoidRootPart
end

function FindOnDescendents(Name:String,Obj)
    local target = nil
    for _,des in pairs(obj:GetDescendants()) do 
        if des.Name == Name then
            target = des
        end
    end
    return target
end

function ChangeRayfieldTheme(Theme)
    Win.ModifyTheme(Theme)
end

function FlingACar()
    local CarToFling = game.workspace.Vehicles:FindFirstChild(FlingCar.ctf.."Car")
    if CarToFling then
        local seat = FindOnDescendents("VehicleSeat")
        if seat and seat.Ocuppant ~= nil then
            local root = GetRoot()
            local Hum = GetHum()
            local pos1 = root.CFrame
            if root then 
                local Velocity = Instance.new("BodyVelocity")
                local NormalForce = FlingCar.nf
                local ForceMult = FlingCar.fm

                Velocity.MaxForce = Vector3.new(NormalForce.X*ForceMult,NormalForce.Y*ForceMult,NormalForce.Z*ForceMult)
                Velocity.P = 7500

                root.CFrame = seat.CFrame

                Velocity.Velocity = Vector3.new(10000,15000,10000)
                task.wait(math.random(5,8))
                Velocity:Destroy()
                Hum:ChangeState(Enum.HumanoidStateType.Jumping)

                task.wait(0.5)

                StopVelocity()
                root.CFrame = pos1

                Notify("Brookhaven Script","you're having a good time ya?")
            else
                Notify("Brookhaven Script","Root Part Cant Be Finded!")
            end
        else
            Notify("Brookhaven Script","The Main Seat Is Already Taked!")
        end
    else
        Notify("Brookhaven Script","Car Cant be Indentified or You Dont Selext A Car!")
    end
end

-- Main Code

FireEvent("Name",{arg1 = "Using Starkield Scripts..."})
FireEvent("NameColor",{arg1 = Color3.fromRGB(122,0,122)})
FireEvent("Bio",{arg1 = "I Use Deluxe Scripts"})
FireEvent("BioColor",{arg1 = Color3.fromRGB(255,0,0)})



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

HomeTab:CreateToggle({
    Name = "Update FPS",
    Callback = function(v)
        updfps = v
    end
})

local FPSText = HomeTab:CreateLabel("Actual FPS: x")

MainTab:CreateSlider({
    Name = "Speed",
    Range = {0, 1000},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Callback = function(v)
        local hum = GetHum()
        hum.WalkSpeed = v
        Speed[1] = v
    end
})

MainTab:CreateToggle({
    Name = "Auto Set Speed",
    Callback = function(v)
        Speed[2] = v
    end
})

MainTab:CreateSlider({
    Name = "Gravity",
    Range = {0, 1000},
    Increment = 1,
    Suffix = "The Gravity Dont Need Auto Set",
    CurrentValue = 16,
    Callback = function(v)
        workspace.Gravity = v
    end
})

MainTab:CreateSlider({
    Name = "Jump Height",
    Range = {0, 1000},
    Increment = 1,
    Suffix = "Jump Height",
    CurrentValue = 16,
    Callback = function(v)
        local hum = GetHum()
        hum.JumpHeight = v
        JumpHeight[1] = v
    end
})

MainTab:CreateToggle({
    Name = "Auto Set Jump Height",
    Callback = function(v)
        JumpHeight[2] = v
    end
})

MainTab:CreateSlider({
    Name = "Jump Power",
    Range = {0, 1000},
    Increment = 1,
    Suffix = "Jump Power",
    CurrentValue = 16,
    Callback = function(v)
        local hum = GetHum()
        hum.JumpPower = v
        JumpPower[1] = v
    end
})

MainTab:CreateToggle({
    Name = "Auto Set Jump Power",
    Callback = function(v)
        JumpPower[2] = v
    end
})

MainTab:CreateToggle({
    Name = "Noclip",
    Callback = function(v)
        Noclip = v
    end
})

MainTab:CreateDivider()

MainTab:CreateSlider({
    Name = "Car Turbo",
    Range = {0,10000},
    Increment = 1,
    Suffix = "Deluxe & Op",
    CurrentValue = 11,
    Callback = function(v)
        pcall(function()
            local CarName = game.Players.LocalPlayer.Name.."Car"
            local Car = game.workspace.Vehicles:FindFirstChild(CarName)
        
            Car.Body.VehicleSeat.Turbo.Value = v
        end)
    end
})

MainTab:CreateSlider({
    Name = "Car Top Speed",
    Range = {0,10000},
    Increment = 1,
    Suffix = "Deluxe & Op",
    CurrentValue = 25,
    Callback = function(v)
        pcall(function()
            local CarName = game.Players.LocalPlayer.Name.."Car"
            local Car = game.workspace.Vehicles:FindFirstChild(CarName)
        
            Car.Body.VehicleSeat.TopSpeed.Value = v
        end)
    end
})

local fdd = MainTab:CreateDropdown({
    Name = "Car To Fling",
    Options = {"The Cars","Are Not Loaded Pls","Wait A Fer Seconds..."},
    CurrentOption = {"No Car Selected Yet"},
    MultipleOptions = false,
    Callback = function(opt)
        local option = opt[1]
        FlingCar.ctf = option
    end
})

MainTab:CreateSlider({
    Name = "Fling A Car Force Multiplier",
    Range = {0,100},
    Increment = 1,
    Suffix = "Deluxe & Op",
    CurrentValue = 1,
    Callback = function(v)
        FlingCar.fm = v
    end
})

MainTab:CreateButton({
    Name = "Fling A Car",
    Callback = function()
        FlingACar()
    end
})

-- Loops





spawn(function()
    pcall(function()
        local fps = 0
        local lastUpdate = tick()

        game:GetService("RunService").RenderStepped:Connect(function()
        if LibOk then
            if updfps then
            local currentTime = tick()
            local deltaTime = currentTime - lastUpdate
            lastUpdate = currentTime
    
            fps = math.floor(1 / deltaTime)
                FPSText:Set("Actual FPS: "..tostring(fps))
            end
        end
        end)
    end)
end)

spawn(function() -- Main Loop
    pcall(function()
        while wait(0.1) do

            if Speed.as == true then
                local hum = GetHum()
                hum.WalkSpeed = Speed.s
            end
            
            if JumpHeight.ajh == true then
                local hum = GetHum()
                hum.JumpHeight = JumpHeight.jh
            end

            if JumpPower.ajp == true then
                local hum = GetHum()
                hum.JumpPower = JumpPower.jp
            end



            if not LibOk then
                break
            end

        end
    end)
end)

spawn(function() -- Noclip Loop
    pcall(function()
        while wait(0.5) do
            if Noclip then
                for _,part in pairs(GetChar():GetDescendants()) do
                    if part:IsA("BasePart") then
                        if part.CanCollide == not Noclip then
                            part.CanCollide = Noclip
                        end
                    end
                end
            else
                for _,part in pairs(GetChar():GetDescendants()) do
                    if part:IsA("BasePart") then
                        if part.CanCollide == not Noclip then
                            part.CanCollide = Noclip
                        end
                    end
                end
            end

            if not LibOk then
                break
            end

        end
    end)
end)

-- Events

game.workspace.Vehicles.ChildRemoving:Connect(function()
    local carTable = {}
    for _,plr in pairs(game.Players:GetChildren()) do
        local Vehicles = game.workspace.Vehicles -- Get Vehicles Folder...
                
        if Vehicles:FindFirstChild(plr.Name.."Car") and plr ~= LocalPlayer then -- Valid Car...
            table.insert(carTable,plr.Name.."Car") -- Insert Car name...
        end
    end
    
    -- Refresh Section...
    
    fdd:Refresh(carTable)
end)

game.workspace.Vehicles.ChildAdded:Connect(function()
    local carTable = {}
    for _,plr in pairs(game.Players:GetChildren()) do
        local Vehicles = game.workspace.Vehicles -- Get Vehicles Folder...
                
        if Vehicles:FindFirstChild(plr.Name.."Car") and plr ~= LocalPlayer then -- Valid Car...
            table.insert(carTable,plr.Name.."Car") -- Insert Car name...
        end
    end
    
    -- Refresh Section...
    
    fdd:Refresh(carTable)
end)


else
    Notify("Key System","Please insert a valid key")
    end
    end
})
