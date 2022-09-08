local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/OsRaMoSaO/Fuzzy-UI-Library/main/Source.lua?token=GHSAT0AAAAAABYCKUXAPDHNU3CD7D2FCC3GYY2DN6Q"))()
local Window = Library.CreateLib("Fuzzy Fishing Simulator", "Ocean")

    --AUTO
    local Player = Window:NewTab("Auto Fishing")
    local PlayerSection = Player:NewSection("Auto Fishing")

    --AUTO FISH:
    PlayerSection:NewToggle("Auto fish!", "Activate script and enjoy!", function(state)
        if state then           
            local args = {
                [1] = 1
                }
                game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.SetEquippedItem:InvokeServer(unpack(args))
            loop = true
            while loop do            
            local catch = coroutine.create(
                function()
                    wait(0.1)
                    game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.FishCaught:FireServer()
                end)

            coroutine.resume(catch)
            game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.FishBiting:InvokeServer()                                
            wait(0.1)
            game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.SetEquippedItem:InvokeServer(unpack(args))
            end
        else
            loop = false
            game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.SetEquippedItem:InvokeServer()
            local args = {
            [1] = game:GetService("Players").LocalPlayer.Character.magicrod
            }
            
            game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.UneqipTool:FireServer(unpack(args))           
        end
    end)

    
    PlayerSection:NewToggle("Sell all 1min (Sells all each minute)", "Sells your inventory each minute", function(state)
        if state then
            
            loop = true
            while loop do
            
            local args = {
            [1] = "SellEverything"
            }
        
            game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.processGameItemSold:InvokeServer(unpack(args))
            wait(60)
            end
        else
            
            loop = false    
        end
    end)

    
    PlayerSection:NewButton("Sell all", "Sells your intire inventory", function()
     local args = {
            [1] = "SellEverything"
        }
        
        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.processGameItemSold:InvokeServer(unpack(args))
    end)

    PlayerSection:NewButton("Anti Afk script", "Not mine!", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/2dgeneralspam1/scripts-and-stuff/master/scripts/LoadstringypVvhJBq4QNz", true))()
       end)


    --Other
    local Other = Window:NewTab("Boat")
    local OtherSection = Other:NewSection("Custom boat settings")

    OtherSection:NewSlider("Boat Speed", "Set your boat speed", 350, 50, function(s)
        for i, v in pairs(game.Workspace:GetChildren()) do
        if v.Name == (game.Players.LocalPlayer.Name .. "'s Boat") then
             v.Controller.VehicleSeat.MaxSpeed = s
             v.TakeDamage:Destroy()
         end
    end
    end)

    OtherSection:NewButton("Tp To boat", "Tp you to your boat", function()
        playerName = game.Players.LocalPlayer.Name
        
        local args = {
            [1] = workspace:FindFirstChild(playerName.."'s Boat"),
            [2] = workspace:FindFirstChild(playerName.."'s Boat").Controller.VehicleSeat
        }
        
        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.SeatPlayer:FireServer(unpack(args))
    end)
    
    --Eggs
    local eggs = Window:NewTab("Eggs")
    local e = eggs:NewSection("Egg menu")
    
    e:NewButton("Royal", "Opens the royal egg for 1.5K", function()
        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenLootboxFunction:InvokeServer("royalegg")
    end)
    
    e:NewButton("Normal", "Opens the normal egg for 750", function()
        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenLootboxFunction:InvokeServer("normalegg")
    end)
    
    e:NewButton("Ruby", "Opens the Ruby egg for 1K Diamonds", function()
        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenLootboxFunction:InvokeServer("rubyegg")
    end)

    e:NewButton("Void", "Opens the Void egg for 2.5K Diamonds", function()
        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenLootboxFunction:InvokeServer("voidegg")
    end)
    
    local Feed = Window:NewTab("Feedback!")
    local Feedback = Feed:NewSection("Give feedback!")
    Feedback:NewButton("Want anything added?", "Add me on dicscord and suggest something!", function()

    end)
    
    Feedback:NewButton("Your_Local_Furry#3965", "Add me on dicscord and suggest something!", function()

    end)

    
