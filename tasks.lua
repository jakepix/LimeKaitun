local Tasks = {}
local player = game.Players.LocalPlayer
local RS = game:GetService("ReplicatedStorage")

function Tasks.Run(Data, Funcs, UI)
    local lvl   = player.Data.Level.Value
    local world = game.PlaceId
    local beli  = player.Data.Beli.Value

    -- 1. Essencial: Status e Fruta
    Funcs.AutoStats()
    RS.Remotes.CommF_:InvokeServer("Cousin", "Buy")

    -- 2. Verificação de Bosses/Elites (Prioridade Máxima - Sea 3)
    if world == 7449423635 then
        local elite = Funcs.AutoElite()
        if elite then
            UI.Status.Main = "ALVO: ELITE HUNTER"
            UI.Status.Sub  = "Matando: " .. elite.Name
            Funcs.SmartTween(elite.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
            Funcs.EquipBest()
            Funcs.FastAttack()
            return
        end
    end

    -- 3. Evento Factory (Sea 2)
    if world == 4442272183 and workspace:FindFirstChild("Factory") then
        UI.Status.Main = "EVENTO: FACTORY"
        Funcs.SmartTween(CFrame.new(432, 202, -425))
        Funcs.FastAttack()
        return
    end

    -- 4. Progresso Bartilo / Raça (Sea 2)
    if world == 4442272183 then
        if lvl >= 850 and not Funcs.BartiloFinished() then
            UI.Status.Main = "Progresso: Bartilo"
            UI.Status.Sub  = "Completando Quest"
            Funcs.BartiloQuest()
            return
        end

        if lvl >= 1000 and not Funcs.HasRaceV2() and beli >= 500000 then
            UI.Status.Main = "Progresso: V2"
            UI.Status.Sub  = "Coletando Flores"
            Funcs.AutoRaceV2()
            return
        end

        if lvl >= 1000 and beli >= 2000000 and Funcs.HasRaceV2() then
            if not Funcs.DonSwanDefeated() then
                UI.Status.Main = "Boss: Don Swan"
                UI.Status.Sub  = "LIBERANDO ACESSO V3"
                Funcs.KillDonSwan()
                return
            else
                local myRace = player.Data.Race.Value
                UI.Status.Main = "Raça V3"
                UI.Status.Sub  = "Raça: " .. myRace

                if myRace == "Human" then Funcs.V3_Human()
                elseif myRace == "Mink" then Funcs.V3_Mink()
                elseif myRace == "Fishman" then Funcs.V3_Fishman()
                elseif myRace == "Angel" then Funcs.V3_Angel() end

                RS.Remotes.CommF_:InvokeServer("Arowe","Finish")
                return
            end
        end
    end

    -- 5. Transições de Mar
    if lvl >= 700 and world == 2753915133 then
        UI.Status.Main = "Quest: Liberar Sea 2"
        UI.Status.Sub  = "Falando Com Detective"
        Funcs.UnlockSea2()
        return
    end

    if lvl >= 1500 and world == 4442272183 then
        UI.Status.Main = "Quest: Liberar Sea 3"
        UI.Status.Sub  = "Matando RIP INDRA"
        Funcs.UnlockSea3()
        return
    end

    -- 6. Maestria
    if lvl >= 1500 then
        local currentStyle = Funcs.GetCurrentFightingStyle()
        local mastery = Funcs.CheckMastery(currentStyle)

        if mastery < 400 then
            UI.Status.Main = "MAESTRIA: " .. currentStyle
            UI.Status.Sub  = mastery .. " / 400"
            Funcs.EquipWeapon(currentStyle)

            local q = Data.Quests[#Data.Quests]
            Funcs.SmartTween(q.Mob * CFrame.new(0, 30, 0))
            Funcs.BringMobs(q.Name, player.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-5))
            Funcs.FastAttack()
            return
        end
    end

    -- 7. Farm de Level (NO-SKIP)
    local q
    for i = #Data.Quests, 1, -1 do
        if lvl >= Data.Quests[i].Lvl then
            q = Data.Quests[i]
            break
        end
    end

    if q then
        UI.Status.Main = "Farmando Level"
        UI.Status.Sub  = q.Name .. " [" .. lvl .. "]"

        if not player.PlayerGui.Main.Quest.Visible then
            UI.Status.Sub = "Pegando Quest..."
            Funcs.SmartTween(q.NPC)
            RS.Remotes.CommF_:InvokeServer("StartQuest", q.QName, q.QLvl)
        else
            Funcs.EquipBest()
            local pos = q.Mob.Position
            player.Character.HumanoidRootPart.CFrame =
                CFrame.new(pos.X, pos.Y + 35, pos.Z)

            Funcs.BringMobs(
                q.Name,
                player.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-5)
            )
            Funcs.FastAttack()
        end
    end
end

return Tasks
