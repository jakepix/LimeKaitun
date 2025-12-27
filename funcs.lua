local Funcs = {}
local player = game.Players.LocalPlayer
local RS = game:GetService("ReplicatedStorage")

-- Configurações para preços e valores
local Config = {
    StylePrice = 2000000,
    GodhumanPrice = 5000000,
    GodhumanFragmentsRequired = 5000,
    RequiredFragmentsForRaid = 5000,
    FruitForRaid = "Bomb Fruit", -- fruta lixo para usar em raid
}

-- Função para chamadas remotas com retry simples
local function safeInvokeServer(remote, ...)
    local attempts = 3
    local args = {...}
    for i=1, attempts do
        local success, result = pcall(function()
            return remote:InvokeServer(unpack(args))
        end)
        if success then
            return result
        else
            task.wait(0.3)
        end
    end
    warn("Falha na chamada remota: ".. tostring(remote))
    return nil
end

local function safeFireServer(remote, ...)
    local attempts = 3
    local args = {...}
    for i=1, attempts do
        local success, _ = pcall(function()
            remote:FireServer(unpack(args))
        end)
        if success then
            return true
        else
            task.wait(0.3)
        end
    end
    warn("Falha na FireServer: ".. tostring(remote))
    return false
end

-- [[ MOVIMENTAÇÃO INTELIGENTE ]]
function Funcs.SmartTween(targetCFrame)
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
    local hrp = player.Character.HumanoidRootPart
    
    for _, v in pairs(player.Character:GetDescendants()) do
        if v:IsA("BasePart") then v.CanCollide = false end
    end

    if (hrp.Position - targetCFrame.Position).Magnitude > 150 then
        hrp.CFrame = CFrame.new(hrp.Position.X, targetCFrame.Y + 100, hrp.Position.Z)
        task.wait(0.1)
    end
    hrp.CFrame = targetCFrame
end

-- [[ FAST ATTACK & EQUIP ]]
function Funcs.FastAttack()
    local tool = player.Character and player.Character:FindFirstChildOfClass("Tool")
    if tool then
        local attackRemote = RS.Modules.Net["RE/RegisterAttack"]
        local hitRemote = RS.Modules.Net["RE/RegisterHit"]
        safeFireServer(attackRemote, 0)
        safeFireServer(hitRemote, nil, {}, nil, "40763608")
    end
end

function Funcs.EquipBest()
    local tool = player.Backpack and player.Backpack:FindFirstChildOfClass("Tool")
    if tool and (tool.ToolTip == "Melee" or tool.ToolTip == "Sword") then
        player.Character.Humanoid:EquipTool(tool)
    end
end

-- [[ SISTEMA DE ELITE (YAMA/CDK) ]]
function Funcs.AutoElite()
    local elites = {"Deandre", "Diablo", "Urban"}
    for _, name in pairs(elites) do
        local e = workspace.Enemies and workspace.Enemies:FindFirstChild(name)
        if e and e:FindFirstChild("Humanoid") and e.Humanoid.Health > 0 then
            return e
        end
    end
    return nil
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

-- [[ BRING MOBS & HITBOX ]]
function Funcs.BringMobs(name, pos)
    if not workspace.Enemies then return end
    for _, v in pairs(workspace.Enemies:GetChildren()) do
        if v.Name:find(name) and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            v.HumanoidRootPart.CanCollide = false
            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
            v.HumanoidRootPart.CFrame = pos
            v.Humanoid.WalkSpeed = 0
        end
    end
end

-- [[ AUTO STATS ]]
function Funcs.AutoStats()
    local stats = {"Melee", "Defense", "Blox Fruit"}
    local points = player.Data and player.Data.StatsPoints and player.Data.StatsPoints.Value or 0
    if points > 0 then
        local perStat = math.floor(points / #stats)
        for _, stat in pairs(stats) do
            local remote = RS.Remotes.CommF_
            safeInvokeServer(remote, "AddPoint", stat, perStat)
        end
    end
end

-- [[ VERIFICADORES DE PROGRESSO ]]
function Funcs.HasStyle(styleName)
    local remote = RS.Remotes.CommF_
    local s = safeInvokeServer(remote, "Buy" .. styleName:gsub(" ", ""), "Check")
    return s == "Already Learned"
end

function Funcs.BuyStyle(styleName)
    if Funcs.HasStyle(styleName) then return true end
    local money = player.Data and player.Data.Money and player.Data.Money.Value or 0
    if money >= Config.StylePrice then
        local remote = RS.Remotes.CommF_
        safeInvokeServer(remote, "Buy" .. styleName:gsub(" ", ""), "Buy")
        task.wait(1)
        return true
    else
        return false
    end
end

function Funcs.UseFruitForRaid()
    local fragments = player.Data and player.Data.Fragments and player.Data.Fragments.Value or 0
    if fragments >= Config.RequiredFragmentsForRaid then return false end

    local fruit = player.Backpack:FindFirstChild(Config.FruitForRaid) or player.Character:FindFirstChild(Config.FruitForRaid)
    if fruit then
        local remote = RS.Remotes.CommF_
        safeInvokeServer(remote, "RaidsEntity", "Select", "Flame")
        safeInvokeServer(remote, "RaidsEntity", "Buy", 1)
        safeInvokeServer(remote, "RaidsEntity", "Start")
        return true
    end
    return false
end

function Funcs.EquipStyle(style)
    local tool = nil
    for _, t in pairs(player.Backpack:GetChildren()) do
        if t:IsA("Tool") and t.ToolTip == style then
            tool = t
            break
        end
    end
    if tool and player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid:EquipTool(tool)
    end
end

-- Agora sem loop infinito interno
function Funcs.FarmLevelAndMastery(Data, UI)
    -- Você deve chamar essa função repetidamente de fora para controle do loop
    local fightingStyles = {"Dark Step", "Electric Claw", "Water Kung Fu", "Dragon Breath", "Death Step", "Sharkman Karate", "Dragon Talon"}
    local currentStyleIndex = 1
    local godhumanPrice = Config.GodhumanPrice
    local godhumanFragmentsRequired = Config.GodhumanFragmentsRequired

    local playerLevel = player.Data.Level.Value
    local statsPoints = player.Data.StatsPoints.Value
    local money = player.Data.Money.Value
    local fragments = player.Data.Fragments.Value

    local currentStyle = fightingStyles[currentStyleIndex]

    if not Funcs.HasStyle(currentStyle) then
        if money >= Config.StylePrice then
            UI.Status.Main = "Comprando estilo: " .. currentStyle
            Funcs.BuyStyle(currentStyle)
            task.wait(2)
        else
            UI.Status.Main = "Sem dinheiro para comprar estilo " .. currentStyle
            if Funcs.UseFruitForRaid() then
                UI.Status.Main = "Fazendo raid para farmar fragments"
                task.wait(15)
            end
        end
        return currentStyleIndex
    else
        Funcs.EquipStyle(currentStyle)

        local mastery = safeInvokeServer(RS.Remotes.CommF_, "Buy" .. currentStyle:gsub(" ", ""), "CheckMastery") or 0
        UI.Status.Main = "Farmando estilo: " .. currentStyle .. " Maestria: " .. mastery .. "/400"

        if mastery >= 400 then
            currentStyleIndex = currentStyleIndex + 1
            if currentStyleIndex > #fightingStyles then
                currentStyleIndex = 1
            end
        end

        if statsPoints > 0 then
            Funcs.AutoStats()
        end

        if money >= godhumanPrice and fragments >= godhumanFragmentsRequired then
            if not Funcs.HasStyle("Godhuman") then
                UI.Status.Main = "Comprando Godhuman"
                safeInvokeServer(RS.Remotes.CommF_, "BuyGodhuman", "Buy")
                task.wait(5)
            end
        elseif fragments < godhumanFragmentsRequired then
            if Funcs.UseFruitForRaid() then
                UI.Status.Main = "Fazendo raid para farmar fragments"
                task.wait(15)
            end
        end
    end
    return currentStyleIndex
end

-- Funções placeholder para implementar depois
function Funcs.BartiloFinished() print("Implementar BartiloFinished") return false end
function Funcs.BartiloQuest() print("Implementar BartiloQuest") end
function Funcs.HasRaceV2() print("Implementar HasRaceV2") return false end
function Funcs.AutoRaceV2() print("Implementar AutoRaceV2") end
function Funcs.DonSwanDefeated() print("Implementar DonSwanDefeated") return false end
function Funcs.KillDonSwan() print("Implementar KillDonSwan") end
function Funcs.V3_Human() print("Implementar V3_Human") end
function Funcs.V3_Mink() print("Implementar V3_Mink") end
function Funcs.V3_Fishman() print("Implementar V3_Fishman") end
function Funcs.V3_Angel() print("Implementar V3_Angel") end

return Funcs
