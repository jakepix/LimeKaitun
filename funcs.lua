local Funcs = {}
local player = game.Players.LocalPlayer
local RS = game:GetService("ReplicatedStorage")

-- [[ MOVIMENTAÇÃO ULTRA RÁPIDA ]]
function Funcs.Tween(target)
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
    local hrp = player.Character.HumanoidRootPart
    local bv = hrp:FindFirstChild("KaitunBV") or Instance.new("BodyVelocity", hrp)
    bv.Name = "KaitunBV"
    bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
    
    for _, v in pairs(player.Character:GetDescendants()) do
        if v:IsA("BasePart") then v.CanCollide = false end
    end
    
    bv.Velocity = (target.Position - hrp.Position).Unit * 350
    if (hrp.Position - target.Position).Magnitude < 10 then 
        bv.Velocity = Vector3.zero 
    end
end

-- [[ FAST ATTACK (SEM DELAY) ]]
function Funcs.FastAttack()
    local tool = player.Character:FindFirstChildOfClass("Tool")
    if tool then
        RS.Modules.Net["RE/RegisterAttack"]:FireServer(0) 
        RS.Modules.Net["RE/RegisterHit"]:FireServer(nil, {}, nil, "40763608")
    end
end

-- [[ HITBOX GIGANTE E BRING ]]
function Funcs.BringMobs(name, pos)
    for _, v in pairs(workspace.Enemies:GetChildren()) do
        if v.Name:find(name) and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            v.HumanoidRootPart.CanCollide = false
            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
            v.HumanoidRootPart.CFrame = pos
            v.Humanoid.WalkSpeed = 0
            v.Humanoid.PlatformStand = true
        end
    end
end

function Funcs.BringBoss(bossObj)
    if bossObj and bossObj:FindFirstChild("HumanoidRootPart") then
        bossObj.HumanoidRootPart.CanCollide = false
        bossObj.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
        bossObj.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5)
        bossObj.Humanoid.WalkSpeed = 0
        bossObj.Humanoid.PlatformStand = true
    end
end

-- [[ VERIFICADORES DE PROGRESSO ]]
function Funcs.HasRaceV2()
    return RS.Remotes.CommF_:InvokeServer("Alchemist","Check") == "Finished"
end

function Funcs.BartiloFinished()
    return RS.Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 3
end

function Funcs.DonSwanDefeated()
    return RS.Remotes.CommF_:InvokeServer("GetDonSwanQuest") == "Finished"
end

function Funcs.HasStyle(styleName)
    local s = RS.Remotes.CommF_:InvokeServer("Buy" .. styleName:gsub(" ", ""), "Check")
    return s == "Already Learned"
end

-- [[ QUEST DON SWAN ]]
function Funcs.KillDonSwan()
    -- Tenta dar a fruta de 1M+ para o Trevor
    RS.Remotes.CommF_:InvokeServer("BuyDonSwanAccess")
    local swan = workspace.Enemies:FindFirstChild("Don Swan")
    if swan then
        Funcs.BringBoss(swan)
        Funcs.FastAttack()
    else
        Funcs.Tween(CFrame.new(2289, 15, 863)) -- Pos do Boss
    end
end

-- [[ QUESTS V3 POR RAÇA ]]
function Funcs.V3_Human()
    local bosses = {"Diamond", "Jeremy", "Fajita"}
    for _, name in pairs(bosses) do
        local b = workspace.Enemies:FindFirstChild(name)
        if b and b.Humanoid.Health > 0 then
            Funcs.BringBoss(b)
            Funcs.FastAttack()
            return
        end
    end
end

function Funcs.V3_Mink()
    for _, v in pairs(workspace:GetChildren()) do
        if v.Name:find("Chest") then
            player.Character.HumanoidRootPart.CFrame = v.CFrame
            task.wait(0.1)
        end
    end
end

function Funcs.V3_Fishman()
    local sb = workspace:FindFirstChild("Sea Beast")
    if sb then
        Funcs.BringBoss(sb)
        Funcs.FastAttack()
    else
        -- Voa no mar aberto para spawnar
        Funcs.Tween(CFrame.new(player.Character.HumanoidRootPart.Position.X, 100, player.Character.HumanoidRootPart.Position.Z + 5000))
    end
end

function Funcs.V3_Angel()
    -- Mata o Diamond (Boss) como alternativa ou um player
    local boss = workspace.Enemies:FindFirstChild("Diamond")
    if boss then
        Funcs.BringBoss(boss)
        Funcs.FastAttack()
    end
end

-- [[ AUTO RAID ]]
function Funcs.AutoRaid()
    if not workspace:FindFirstChild("RaidMap") then
        local chipPos = (game.PlaceId == 4442272183) and CFrame.new(-6415, 250, -4493) or CFrame.new(-5415, 312, -2825)
        Funcs.Tween(chipPos)
        RS.Remotes.CommF_:InvokeServer("RaidsEntity","Select","Flame")
        RS.Remotes.CommF_:InvokeServer("RaidsEntity","Buy",1)
        RS.Remotes.CommF_:InvokeServer("RaidsEntity","Start")
    else
        for _, enemy in pairs(workspace.Enemies:GetChildren()) do
            if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                Funcs.Tween(enemy.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                Funcs.BringBoss(enemy)
                Funcs.FastAttack()
            end
        end
    end
end

-- [[ QUEST DO SABER (SEA 1) ]]

function Funcs.SaberQuest()

    UI.Status.Main = "QUEST: SABER EXPERT"

    -- 1. Ativa os 5 botões da Jungle (Bypass)

    local buttons = {

        CFrame.new(-1611, 35, 149), CFrame.new(-1526, 38, 30),

        CFrame.new(-1382, 35, -485), CFrame.new(-1670, 35, -3),

        CFrame.new(-1564, 35, -127)

    }

    for _, btn in pairs(buttons) do

        player.Character.HumanoidRootPart.CFrame = btn

        task.wait(0.2)

    end

    -- 2. Pega a Tocha e vai pro Deserto

    Funcs.Tween(CFrame.new(-1610, 12, 163)) -- Local da Tocha

    task.wait(0.5)

    Funcs.Tween(CFrame.new(1113, 5, 4349)) -- Casa no Deserto

    -- 3. Mata o Boss (Saber Expert) se tiver lvl 200

    if player.Data.Level.Value >= 200 then

        local boss = workspace.Enemies:FindFirstChild("Saber Expert")

        if boss then

            Funcs.BringBoss(boss)

            Funcs.FastAttack()

        end

    end

end



-- [[ QUEST DO BARTILO (SEA 2) ]]

function Funcs.BartiloQuest()

    UI.Status.Main = "QUEST: BARTILO"

    -- 1. Mata 50 Swan Pirates

    local quest = RS.Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo")

    if quest == 0 then

        RS.Remotes.CommF_:InvokeServer("StartQuest","BartiloQuest",1)

        Funcs.BringMobs("Swan Pirate", CFrame.new(878, 122, 1235))

        Funcs.FastAttack()

    -- 2. Mata o Jeremy

    elseif quest == 1 then

        local jeremy = workspace.Enemies:FindFirstChild("Jeremy")

        if jeremy then 

            Funcs.BringBoss(jeremy) 

            Funcs.FastAttack() 

        end

    -- 3. Libera os Gladiadores (Código do Coliseu)

    elseif quest == 2 then

        local code = {"Y", "infinity", "C", "S", "M", "F", "N", "B"}

        for _, name in pairs(code) do

            local plate = workspace.Birdy:FindFirstChild(name)

            if plate then

                player.Character.HumanoidRootPart.CFrame = plate.CFrame

                task.wait(0.3)

            end

        end

    end

end



-- [[ QUEST DO CITIZEN (SEA 3)]]

function Funcs.CitizenQuest()

    UI.Status.Main = "QUEST: CITIZEN"

    -- 1. Mata 50 Forest Pirates

    RS.Remotes.CommF_:InvokeServer("StartQuest","CitizenQuest",1)

    Funcs.BringMobs("Forest Pirate", CFrame.new(-13333, 483, -7853))

    Funcs.FastAttack()

    

    -- 2. Mata o Capitão Elephant

    local boss = workspace.Enemies:FindFirstChild("Captain Elephant")

    if boss then

        Funcs.BringBoss(boss)

        Funcs.FastAttack()

    end

end



-- [[ AUTO V2 E V3 ]]

function Funcs.AutoRaceV2()

    UI.Status.Main = "BUSCANDO FLORES (V2)"

    -- O script varre os pontos de spawn de flores usando a lista do Data.lua

    for i, flowerPos in pairs(Data.RaceConfig.Flowers.Red) do

        Funcs.Tween(flowerPos)

        task.wait(0.1) -- Seu PC é rápido, não precisa de mais que isso

    end

    -- Entrega pro Alchemist

    Funcs.Tween(Data.RaceConfig.Alchemist)

    RS.Remotes.CommF_:InvokeServer("Alchemist","Finish")

end

return Funcs