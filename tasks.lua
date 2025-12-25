local Tasks = {}
local player = game.Players.LocalPlayer
local RS = game:GetService("ReplicatedStorage")

function Tasks.Run(Data, Funcs, UI)
    local lvl = player.Data.Level.Value
    local world = game.PlaceId
    local beli = player.Data.Beli.Value
    local myRace = player.Data.Race.Value
    
    -- [[ 1. GESTÃO DE TIME E FRUTAS ]]
    if not player.Team or player.Team.Name == "" then
        RS.Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
    end
    RS.Remotes.CommF_:InvokeServer("Cousin", "Buy")
    Funcs.AutoCollectFruits()

    -- [[ 2. EVENTOS PRIORITÁRIOS (FACTORY) ]]
    if world == 4442272183 and workspace:FindFirstChild("Factory") then
        UI.Status.Main = "EVENTO: FACTORY"
        Funcs.Tween(CFrame.new(432, 202, -425))
        Funcs.FastAttack()
        return
    end

    -- [[ 3. LÓGICA DE RAÇA E PROGRESSÃO (V2, DON SWAN, V3) ]]
    if world == 4442272183 then -- Sea 2
        -- Passo 1: Bartilo
        if lvl >= 850 and not Funcs.BartiloFinished() then
            UI.Status.Main = "PROGRESSO: BARTILO"
            Funcs.BartiloQuest()
            return
        end

        -- Passo 2: Race V2
        if lvl >= 1000 and not Funcs.HasRaceV2() and beli >= 500000 then
            UI.Status.Main = "PROGRESSO: V2"
            Funcs.AutoRaceV2()
            return
        end

        -- Passo 3: Don Swan e V3 (REQUISITO 2 MILHÕES)
        if lvl >= 1000 and beli >= 2000000 and Funcs.HasRaceV2() then
            if not Funcs.DonSwanDefeated() then
                UI.Status.Main = "QUEST: MATAR DON SWAN"
                Funcs.KillDonSwan()
                return
            else
                UI.Status.Main = "QUEST V3: " .. myRace
                if myRace == "Human" then Funcs.V3_Human()
                elseif myRace == "Mink" then Funcs.V3_Mink()
                elseif myRace == "Fishman" then Funcs.V3_Fishman()
                elseif myRace == "Angel" then Funcs.V3_Angel() end
                RS.Remotes.CommF_:InvokeServer("Arowe","Finish")
                return
            end
        end
    end

    -- [[ 4. TRANSIÇÃO DE MAR (SEA 1 -> 2) ]]
    if lvl >= 700 and world == 2753915133 then
        UI.Status.Main = "QUEST: SEA 2"
        local progress = RS.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Detective")
        if progress == 0 then
            Funcs.Tween(Data.UnlockSea2.Detective)
            RS.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Detective")
        elseif progress == 1 then
            Funcs.Tween(Data.UnlockSea2.AdmiralPos)
            local adm = workspace.Enemies:FindFirstChild("Ice Admiral")
            if adm then Funcs.BringBoss(adm) Funcs.FastAttack() end
        elseif progress == 2 then
            Funcs.Tween(Data.UnlockSea2.Detective)
            RS.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Detective")
        elseif progress == 3 then
            Funcs.Tween(Data.UnlockSea2.Captain)
            RS.Remotes.CommF_:InvokeServer("TravelDressrosa")
        end
        return
    end

    -- [[ 5. TRANSIÇÃO DE MAR (SEA 2 -> 3) ]]
    if lvl >= 1500 and world == 4442272183 then
        UI.Status.Main = "QUEST: SEA 3"
        local prog = RS.Remotes.CommF_:InvokeServer("ZQuestProgress", "Check")
        if prog == 0 or not prog then
            Funcs.Tween(Data.UnlockSea3.KingRedHead)
            RS.Remotes.CommF_:InvokeServer("ZQuestProgress", "Begin")
        elseif prog == 1 then
            Funcs.Tween(CFrame.new(-454, 65, 1511))
            local indra = workspace.Enemies:FindFirstChild("rip_indra")
            if indra then Funcs.BringBoss(indra) Funcs.FastAttack() end
        elseif prog == 2 then
            Funcs.Tween(Data.UnlockSea3.KingRedHead)
            RS.Remotes.CommF_:InvokeServer("ZQuestProgress", "End")
        elseif prog == 3 then
            Funcs.Tween(Data.UnlockSea3.MrCaptain)
            RS.Remotes.CommF_:InvokeServer("TravelZou")
        end
        return
    end

    -- [[ 6. MAESTRIA (ELECTRIC CLAW) ]]
    local currentStyle = "Electric" 
    local mastery = Funcs.CheckMastery(currentStyle)
    if mastery < 400 and lvl >= 1500 then
        UI.Status.Main = "FARMANDO MAESTRIA"
        UI.Status.Sub = currentStyle .. ": " .. mastery .. "/400"
        Funcs.EquipWeapon(currentStyle)
        local q = Data.Quests[#Data.Quests]
        Funcs.Tween(q.Mob * CFrame.new(0, 25, 0))
        Funcs.BringMobs(q.Name, player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5))
        Funcs.FastAttack()
        return
    end

    -- [[ 7. CAÇA A ELITES ]]
    if world == 7449423635 and lvl >= 1500 then
        for _, eliteName in pairs({"Deandre", "Diablo", "Urban"}) do
            local e = workspace.Enemies:FindFirstChild(eliteName)
            if e and e:FindFirstChild("Humanoid") and e.Humanoid.Health > 0 then
                UI.Status.Main = "ELITE HUNTER"
                UI.Status.Sub = eliteName
                Funcs.Tween(e.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0))
                Funcs.BringBoss(e)
                Funcs.FastAttack()
                return
            end
        end
    end

    -- [[ 8. BOSS HUNTER ]]
    for _, enemy in pairs(workspace.Enemies:GetChildren()) do
        if Data.BossConfig[enemy.Name] and enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
            local info = Data.BossConfig[enemy.Name]
            if lvl >= info.Lvl then
                UI.Status.Main = "BOSS HUNTER"
                UI.Status.Sub = enemy.Name
                if info.HasQuest and not player.PlayerGui.Main.Quest.Visible then
                    Funcs.Tween(info.NPC)
                    RS.Remotes.CommF_:InvokeServer("StartQuest", info.QName, info.QLvl)
                    return
                end
                Funcs.Tween(enemy.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0))
                Funcs.BringBoss(enemy)
                Funcs.FastAttack()
                return
            end
        end
    end

    -- [[ 9. FARM LEVEL PADRÃO ]]
    local q = nil
    for i = #Data.Quests, 1, -1 do
        if lvl >= Data.Quests[i].Lvl then q = Data.Quests[i] break end
    end

    if q then
        UI.Status.Main = "FARMING LEVEL"
        UI.Status.Sub = q.Name
        if not player.PlayerGui.Main.Quest.Visible then
            Funcs.Tween(q.NPC)
            RS.Remotes.CommF_:InvokeServer("StartQuest", q.QName, q.QLvl)
        else
            Funcs.Tween(q.Mob * CFrame.new(0, 25, 0))
            Funcs.BringMobs(q.Name, player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5))
            Funcs.FastAttack()
        end
    end
end

return Tasks