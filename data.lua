local Data = {}

-- [[ CONFIGURAÇÃO DE MISSÕES ]]
-- Organizado por Nível para o sistema de "No-Skip" Farm (Sea 1, 2 e 3)
Data.Quests = {
    -- SEA 1
    {Lvl = 1, Name = "Bandit", NPC = CFrame.new(1061.66, 16.51, 1544.52), Mob = CFrame.new(1199.31, 52.27, 1536.91), QName = "BanditQuest1", QLvl = 1},
    {Lvl = 10, Name = "Monkey", NPC = CFrame.new(-1604.12, 36.85, 154.23), Mob = CFrame.new(-1502.74, 98.56, 90.64), QName = "JungleQuest", QLvl = 1},
    {Lvl = 15, Name = "Gorilla", NPC = CFrame.new(-1604.12, 36.85, 154.23), Mob = CFrame.new(-1223.52, 6.27, -502.29), QName = "JungleQuest", QLvl = 2},
    {Lvl = 30, Name = "Pirate", NPC = CFrame.new(-1139.59, 4.75, 3825.16), Mob = CFrame.new(-1219.32, 4.75, 3915.63), QName = "BuggyQuest1", QLvl = 1},
    {Lvl = 40, Name = "Brute", NPC = CFrame.new(-1139.59, 4.75, 3825.16), Mob = CFrame.new(-1146.49, 96.09, 4312.13), QName = "BuggyQuest1", QLvl = 2},
    {Lvl = 60, Name = "Desert Bandit", NPC = CFrame.new(897.03, 6.43, 4388.97), Mob = CFrame.new(932.78, 6.45, 4488.24), QName = "DesertQuest", QLvl = 1},
    {Lvl = 75, Name = "Desert Officer", NPC = CFrame.new(897.03, 6.43, 4388.97), Mob = CFrame.new(1580.03, 4.61, 4366.86), QName = "DesertQuest", QLvl = 2},
    {Lvl = 90, Name = "Snow Bandit", NPC = CFrame.new(1384.14, 87.27, -1297.06), Mob = CFrame.new(1370.24, 102.40, -1411.52), QName = "SnowQuest", QLvl = 1},
    {Lvl = 100, Name = "Snowman", NPC = CFrame.new(1384.14, 87.27, -1297.06), Mob = CFrame.new(1370.24, 102.40, -1411.52), QName = "SnowQuest", QLvl = 2},
    {Lvl = 120, Name = "Chief Petty Officer", NPC = CFrame.new(-5035.08, 28.65, 4325.29), Mob = CFrame.new(-4882.86, 22.65, 4255.53), QName = "MarineQuest2", QLvl = 1},
    {Lvl = 150, Name = "Sky Bandit", NPC = CFrame.new(-4841.83, 717.66, -2623.96), Mob = CFrame.new(-4970.74, 294.54, -2890.11), QName = "SkyQuest", QLvl = 1},
    {Lvl = 175, Name = "Dark Master", NPC = CFrame.new(-4841.83, 717.66, -2623.96), Mob = CFrame.new(-5220.58, 430.69, -2278.17), QName = "SkyQuest", QLvl = 2},
    {Lvl = 190, Name = "Prisoner", NPC = CFrame.new(5308.93, 1.65, 475.12), Mob = CFrame.new(5433.39, 88.67, 514.98), QName = "PrisonerQuest", QLvl = 1},
    {Lvl = 210, Name = "Dangerous Prisoner", NPC = CFrame.new(5308.93, 1.65, 475.12), Mob = CFrame.new(5433.39, 88.67, 514.98), QName = "PrisonerQuest", QLvl = 2},
    {Lvl = 250, Name = "Toga Warrior", NPC = CFrame.new(-1576.11, 7.38, -2983.30), Mob = CFrame.new(-1779.97, 44.60, -2736.35), QName = "ColosseumQuest", QLvl = 1},
    {Lvl = 275, Name = "Gladiator", NPC = CFrame.new(-1576.11, 7.38, -2983.30), Mob = CFrame.new(-1274.75, 58.18, -3188.16), QName = "ColosseumQuest", QLvl = 2},
    {Lvl = 300, Name = "Military Soldier", NPC = CFrame.new(-5316.55, 12.23, 8517.29), Mob = CFrame.new(-5363.01, 41.50, 8548.47), QName = "MagmaQuest", QLvl = 1},
    {Lvl = 325, Name = "Military Spy", NPC = CFrame.new(-5316.55, 12.23, 8517.29), Mob = CFrame.new(-5787.99, 120.86, 8762.25), QName = "MagmaQuest", QLvl = 2},

    -- SEA 2
    {Lvl = 700, Name = "Raider", NPC = CFrame.new(-424.08, 73.00, 1836.91), Mob = CFrame.new(-737.02, 39.17, 2392.57), QName = "Area1Quest", QLvl = 1},
    {Lvl = 725, Name = "Mercenary", NPC = CFrame.new(-424.08, 73.00, 1836.91), Mob = CFrame.new(-973.73, 95.87, 1836.46), QName = "Area1Quest", QLvl = 2},
    {Lvl = 775, Name = "Swan Pirate", NPC = CFrame.new(632.69, 73.10, 918.66), Mob = CFrame.new(970.36, 142.65, 1217.36), QName = "Area2Quest", QLvl = 1},
    {Lvl = 875, Name = "Marine Lieutenant", NPC = CFrame.new(-2442.65, 73.05, -3219.11), Mob = CFrame.new(-2913.26, 73.00, -2971.64), QName = "MarineQuest3", QLvl = 1},
    {Lvl = 1000, Name = "Snow Trooper", NPC = CFrame.new(604.96, 401.45, -5371.69), Mob = CFrame.new(535.89, 401.45, -5329.69), QName = "SnowMountainQuest", QLvl = 1},
    {Lvl = 1425, Name = "Sea Soldier", NPC = CFrame.new(-3052.99, 236.88, -10148.19), Mob = CFrame.new(-3029.78, 66.94, -9777.38), QName = "ForgottenQuest", QLvl = 1},
    {Lvl = 1450, Name = "Water Fighter", NPC = CFrame.new(-3052.99, 236.88, -10148.19), Mob = CFrame.new(-3262.00, 298.69, -10553.69), QName = "ForgottenQuest", QLvl = 2},

    -- SEA 3
    {Lvl = 1500, Name = "Pirate Millionaire", NPC = CFrame.new(-290.07, 42.90, 5581.58), Mob = CFrame.new(81.16, 43.75, 5724.70), QName = "PiratePortQuest", QLvl = 1},
    {Lvl = 1525, Name = "Pistol Billionaire", NPC = CFrame.new(-290.07, 42.90, 5581.58), Mob = CFrame.new(81.16, 43.75, 5724.70), QName = "PiratePortQuest", QLvl = 2},
    {Lvl = 1575, Name = "Dragon Crew Warrior", NPC = CFrame.new(5832.83, 51.68, -1101.51), Mob = CFrame.new(6241.99, 51.52, -1243.97), QName = "AmazonQuest", QLvl = 1},
    {Lvl = 1600, Name = "Dragon Crew Archer", NPC = CFrame.new(5832.83, 51.68, -1101.51), Mob = CFrame.new(6488.91, 383.38, -110.66), QName = "AmazonQuest", QLvl = 2},
    {Lvl = 1625, Name = "Female Islander", NPC = CFrame.new(5448.86, 601.51, 751.13), Mob = CFrame.new(4770.49, 758.95, 1069.86), QName = "AmazonQuest2", QLvl = 1},
    {Lvl = 1650, Name = "Giant Islander", NPC = CFrame.new(5448.86, 601.51, 751.13), Mob = CFrame.new(4530.35, 656.75, -131.60), QName = "AmazonQuest2", QLvl = 2},
    {Lvl = 1700, Name = "Marine Commodore", NPC = CFrame.new(2180.54, 27.81, -6741.54), Mob = CFrame.new(2490.08, 190.42, -7160.05), QName = "MarineTreeIsland", QLvl = 1},
    {Lvl = 1725, Name = "Marine Rear Admiral", NPC = CFrame.new(2180.54, 27.81, -6741.54), Mob = CFrame.new(3951.39, 229.11, -6912.81), QName = "MarineTreeIsland", QLvl = 2},
    {Lvl = 1775, Name = "Fishman Raider", NPC = CFrame.new(-10581.65, 330.87, -8761.18), Mob = CFrame.new(-10322.40, 390.94, -8580.09), QName = "DeepForestIsland3", QLvl = 1},
    {Lvl = 1800, Name = "Fishman Captain", NPC = CFrame.new(-10581.65, 330.87, -8761.18), Mob = CFrame.new(-11194.54, 442.02, -8608.80), QName = "DeepForestIsland3", QLvl = 2},
    {Lvl = 1825, Name = "Forest Pirate", NPC = CFrame.new(-13234.04, 331.48, -7625.40), Mob = CFrame.new(-13225.80, 428.19, -7753.12), QName = "DeepForestIsland", QLvl = 1},
    {Lvl = 1850, Name = "Mythological Pirate", NPC = CFrame.new(-13234.04, 331.48, -7625.40), Mob = CFrame.new(-13869.17, 564.95, -7084.41), QName = "DeepForestIsland", QLvl = 2},
    {Lvl = 1900, Name = "Jungle Pirate", NPC = CFrame.new(-12680.38, 389.97, -9902.01), Mob = CFrame.new(-11982.22, 376.32, -10451.41), QName = "DeepForestIsland2", QLvl = 1},
    {Lvl = 1925, Name = "Musketeer Pirate", NPC = CFrame.new(-12680.38, 389.97, -9902.01), Mob = CFrame.new(-13282.30, 496.23, -9565.15), QName = "DeepForestIsland2", QLvl = 2},
    {Lvl = 1975, Name = "Reborn Skeleton", NPC = CFrame.new(-9479.21, 141.21, 5566.09), Mob = CFrame.new(-8761.31, 164.85, 6161.15), QName = "HauntedQuest1", QLvl = 1},
    {Lvl = 2000, Name = "Living Zombie", NPC = CFrame.new(-9479.21, 141.21, 5566.09), Mob = CFrame.new(-10093.93, 237.38, 6180.56), QName = "HauntedQuest1", QLvl = 2},
    {Lvl = 2025, Name = "Demonic Soul", NPC = CFrame.new(-9514.78, 171.16, 6078.82), Mob = CFrame.new(-9466.72, 171.16, 6132.01), QName = "HauntedQuest2", QLvl = 1},
    {Lvl = 2050, Name = "Posessed Mummy", NPC = CFrame.new(-9514.78, 171.16, 6078.82), Mob = CFrame.new(-9589.93, 4.85, 6190.27), QName = "HauntedQuest2", QLvl = 2},
    {Lvl = 2075, Name = "Peanut Scout", NPC = CFrame.new(-2103.93, 38.13, -10192.70), Mob = CFrame.new(-2150.58, 122.49, -10358.99), QName = "NutsIslandQuest", QLvl = 1},
    {Lvl = 2100, Name = "Peanut President", NPC = CFrame.new(-2103.93, 38.13, -10192.70), Mob = CFrame.new(-2150.58, 122.49, -10358.99), QName = "NutsIslandQuest", QLvl = 2},
    {Lvl = 2200, Name = "Cookie Crafter", NPC = CFrame.new(-2021.55, 37.79, -12028.10), Mob = CFrame.new(-2273.00, 90.22, -12151.62), QName = "CakeQuest1", QLvl = 1},
    {Lvl = 2275, Name = "Head Baker", NPC = CFrame.new(-1927.91, 37.79, -12843.78), Mob = CFrame.new(-2203.30, 109.90, -12788.73), QName = "CakeQuest2", QLvl = 2},
    {Lvl = 2375, Name = "Candy Rebel", NPC = CFrame.new(147.52, 24.79, -12775.35), Mob = CFrame.new(147.52, 24.79, -12775.35), QName = "ChocQuest2", QLvl = 2}
}

Data.BossConfig = {
    -- [[ SEA 1 ]]
    ["The Gorilla King"] = {
        Lvl = 25, 
        CFrame = CFrame.new(-1223.52808, 6.27936459, -502.292664), 
        HasQuest = true, QName = "JungleQuest", QLvl = 3, NPC = CFrame.new(-1604.12012, 36.8521118, 154.23732)
    },
    ["Bobby"] = { -- O BOSS DA PIRATE ISLAND
        Lvl = 55, 
        CFrame = CFrame.new(-1147.65173, 32.5966301, 4156.02588), 
        HasQuest = true, QName = "BuggyQuest1", QLvl = 3, NPC = CFrame.new(-1139.59717, 4.75205183, 3825.16211)
    },
    ["The Saw"] = {
        Lvl = 100, 
        CFrame = CFrame.new(-683.519897, 13.8534927, 1610.87854), 
        HasQuest = false
    },
    ["Yeti"] = {
        Lvl = 110, 
        CFrame = CFrame.new(1221.7356, 138.046906, -1488.84082), 
        HasQuest = true, QName = "SnowQuest", QLvl = 3, NPC = CFrame.new(1384.90247, 87.3078308, -1296.6825)
    },
    ["Mob Leader"] = {
        Lvl = 120, 
        CFrame = CFrame.new(-2848.59399, 7.4272871, 5342.44043), 
        HasQuest = false
    },
    ["Vice Admiral"] = {
        Lvl = 130, 
        CFrame = CFrame.new(-5078.45898, 99.6520691, 4402.1665), 
        HasQuest = true, QName = "MarineQuest2", QLvl = 2, NPC = CFrame.new(-5035.42285, 28.6520386, 4324.50293)
    },
    ["Warden"] = {
        Lvl = 175, 
        CFrame = CFrame.new(5232.5625, 5.26856995, 747.506897), 
        HasQuest = true, QName = "ImpelQuest", QLvl = 1, NPC = CFrame.new(4851.35059, 5.68744135, 743.251282)
    },
    ["Chief Warden"] = {
        Lvl = 200, 
        CFrame = CFrame.new(5232.5625, 5.26856995, 747.506897), 
        HasQuest = true, QName = "ImpelQuest", QLvl = 2, NPC = CFrame.new(4851.35059, 5.68744135, 743.251282)
    },
    ["Saber Expert"] = {
        Lvl = 200, 
        CFrame = CFrame.new(-1458.89502, 29.8870335, -50.633564), 
        HasQuest = false
    },
    ["Swan"] = {
        Lvl = 225, 
        CFrame = CFrame.new(5232.5625, 5.26856995, 747.506897), 
        HasQuest = true, QName = "ImpelQuest", QLvl = 3, NPC = CFrame.new(4851.35059, 5.68744135, 743.251282)
    },
    ["Magma Admiral"] = {
        Lvl = 350, 
        CFrame = CFrame.new(-5530.12646, 22.8769703, 8859.91309), 
        HasQuest = true, QName = "MagmaQuest", QLvl = 3, NPC = CFrame.new(-5317.07666, 12.2721891, 8517.41699)
    },
    ["Fishman Lord"] = {
        Lvl = 425, 
        CFrame = CFrame.new(61351.7773, 31.0306778, 1113.31409), 
        HasQuest = true, QName = "FishmanQuest", QLvl = 3, NPC = CFrame.new(61123.0859, 18.5066795, 1570.18018)
    },
    ["Wysper"] = {
        Lvl = 500, 
        CFrame = CFrame.new(-7925.48389, 5550.76074, -636.178345), 
        HasQuest = true, QName = "SkyExp1Quest", QLvl = 3, NPC = CFrame.new(-7862.94629, 5545.52832, -379.833954)
    },
    ["Thunder God"] = {
        Lvl = 575, 
        CFrame = CFrame.new(-7917.53613, 5616.61377, -2277.78564), 
        HasQuest = true, QName = "SkyExp2Quest", QLvl = 3, NPC = CFrame.new(-7902.78613, 5635.99902, -1411.98706)
    },
    ["Cyborg (Boss)"] = {
        Lvl = 675, 
        CFrame = CFrame.new(6041.82813, 52.7112198, 3907.45142), 
        HasQuest = true, QName = "FountainQuest", QLvl = 3, NPC = CFrame.new(5253.54834, 38.5361786, 4050.45166)
    },

    -- [[ SEA 2 ]]
    ["Diamond (Boss)"] = {
        Lvl = 750, 
        CFrame = CFrame.new(-1736.26587, 198.627731, -236.412857), 
        HasQuest = true, QName = "Area1Quest", QLvl = 3, NPC = CFrame.new(-424.080078, 73.0055847, 1836.91589)
    },
    ["Jeremy"] = {
        Lvl = 850, 
        CFrame = CFrame.new(2203.76953, 448.966034, 752.731079), 
        HasQuest = true, QName = "Area2Quest", QLvl = 3, NPC = CFrame.new(632.698608, 73.1055908, 918.666321)
    },
    ["Orbitus"] = {
        Lvl = 925, 
        CFrame = CFrame.new(-2297.40332, 115.449463, -3946.53833), 
        HasQuest = true, QName = "MarineQuest3", QLvl = 3, NPC = CFrame.new(-2442.65015, 73.0511475, -3219.11523)
    },
    ["Don Swan"] = {
        Lvl = 1000, 
        CFrame = CFrame.new(2288.802, 15.1870775, 863.034607), 
        HasQuest = false
    },
    ["Smoke Admiral"] = {
        Lvl = 1150, 
        CFrame = CFrame.new(-5115.72754, 23.7664986, -5338.2207), 
        HasQuest = true, QName = "IceSideQuest", QLvl = 3, NPC = CFrame.new(-6059.96191, 15.9868021, -4904.7373)
    },
    ["Awakened Ice Admiral"] = {
        Lvl = 1400, 
        CFrame = CFrame.new(6407.33936, 340.223785, -6892.521), 
        HasQuest = true, QName = "FrostQuest", QLvl = 3, NPC = CFrame.new(5669.33203, 28.2118053, -6481.55908)
    },
    ["Tide Keeper"] = {
        Lvl = 1475, 
        CFrame = CFrame.new(-3570.18652, 123.328949, -11555.9072), 
        HasQuest = true, QName = "ForgottenQuest", QLvl = 3, NPC = CFrame.new(-3053.89648, 236.881363, -10148.2324)
    },
    ["Greybeard"] = { Lvl = 750, CFrame = CFrame.new(-4955.72, 80.81, 4305.82), HasQuest = false },
    ["Darkbeard"] = { Lvl = 1000, CFrame = CFrame.new(3876, 24, -3820), HasQuest = false },
    ["Order"] = { Lvl = 1250, CFrame = CFrame.new(-6221, 16, -5045), HasQuest = false },
    ["Cursed Captain"] = { Lvl = 1325, CFrame = CFrame.new(916, 181, 33422), HasQuest = false },

    -- [[ SEA 3 ]]
    ["Stone"] = {
        Lvl = 1550, 
        CFrame = CFrame.new(-1085, 40, 6779), 
        HasQuest = true, QName = "PiratePortQuest", QLvl = 3, NPC = CFrame.new(-290, 44, 5577)
    },
    ["Island Empress"] = {
        Lvl = 1675, 
        CFrame = CFrame.new(5659, 602, 244), 
        HasQuest = true, QName = "AmazonQuest2", QLvl = 3, NPC = CFrame.new(5443, 602, 752)
    },
    ["Kilo Admiral"] = {
        Lvl = 1750, 
        CFrame = CFrame.new(2846, 433, -7100), 
        HasQuest = true, QName = "MarineTreeIsland", QLvl = 3, NPC = CFrame.new(2178, 29, -6737)
    },
    ["Captain Elephant"] = {
        Lvl = 1875, 
        CFrame = CFrame.new(-13221, 325, -8405), 
        HasQuest = true, QName = "DeepForestIsland", QLvl = 3, NPC = CFrame.new(-13232, 333, -7631)
    },
    ["Beautiful Pirate"] = {
        Lvl = 1950, 
        CFrame = CFrame.new(5182, 23, -20), 
        HasQuest = true, QName = "DeepForestIsland2", QLvl = 3, NPC = CFrame.new(-12686, 391, -9902)
    },
    ["Longma"] = { Lvl = 2000, CFrame = CFrame.new(-10248, 353, -9306), HasQuest = false },
    ["Cake Queen"] = {
        Lvl = 2175, 
        CFrame = CFrame.new(-821, 66, -10965), 
        HasQuest = true, QName = "IceCreamIslandQuest", QLvl = 3, NPC = CFrame.new(-716, 382, -11010)
    },
    ["Soul Reaper"] = { Lvl = 2100, CFrame = CFrame.new(-9515, 315, 6691), HasQuest = false },
    ["rip_indra True Form"] = { Lvl = 5000, CFrame = CFrame.new(-5359, 424, -2735), HasQuest = false },
}

Data.Codes = {
    "LIGHTNINGABUSE", "fudd10", "fudd10_V2", "Chandler", "BIGNEWS",
    "KITT_RESET", "Sub2UncleKizaru", "SUB2GAMERROBOT_RESET1", "Sub2Fer999",
    "Enyu_is_Pro", "JCWK", "StarcodeHEO", "MagicBUS", "KittGaming",
    "Sub2CaptainMaui", "Sub2OfficialNoobie", "TheGreatAce", "Sub2NoobMaster123",
    "Sub2Daigrock", "Axiore", "StrawHatMaine", "TantaiGaming", "Bluxxy", "SUB2GAMERROBOT_EXP1"
}

Data.UnlockSea2 = {
    Detective = CFrame.new(4854, 6, 744), -- Prisão (NPC Detective)
    IceCave = CFrame.new(1354, 37, -1323),  -- Entrada da caverna de gelo
    AdmiralPos = CFrame.new(1347, 37, -1325), -- Onde o Boss de gelo fica
    Captain = CFrame.new(-463, 6, 212),     -- NPC no Middle Town que viaja
}

-- [[ ADICIONE ESTA PARTE NO FINAL DO SEU DATA.LUA ]]

-- Posições para os Puzzles de Itens Místicos
Data.Items = {
    ["Yama"] = {
        SwordPos = CFrame.new(-12463, 7, -7153), -- Local da Yama na Hydra Island
        ReqKill = 30 -- Número de Elites necessários
    },
    ["Tushita"] = {
        Entrance = CFrame.new(-12000, 332, -8800), -- Porta da Tushita (Hydra)
        Torches = { -- Ordem das tochas do puzzle
            CFrame.new(-12154, 322, -8782),
            CFrame.new(-12128, 342, -8915),
            CFrame.new(-12030, 352, -8850),
            CFrame.new(-11950, 332, -8700),
            CFrame.new(-11880, 382, -8920)
        }
    },
    ["SoulGuitar"] = {
        Machine = CFrame.new(-9545, 172, 6070), -- Máquina da Soul Guitar (Haunted Castle)
        Gravestones = CFrame.new(-9650, 150, 6000)
    },
    ["CDK"] = {
        EnmaNPC = CFrame.new(-13280, 431, -7680), -- NPC da Yama (Tushita tbm tem)
        Mansion = CFrame.new(-12471, 375, -9490) -- Entrada da Mansão da CDK
    }
}

-- Posições dos Estilos de Luta (Para o Auto-Buy com Frags)
Data.FightingStyles = {
    -- SEA 1
    ["Dark Step"] = {NPC = CFrame.new(1308, 6, 1164), Price = 150000, Req = "Money"},
    ["Electric"] = {NPC = CFrame.new(-644, 100, -4792), Price = 500000, Req = "Money"},
    ["Water Kung Fu"] = {NPC = CFrame.new(61111, 18, 1569), Price = 750000, Req = "Money"},
    
    -- SEA 2
    ["Dragon Breath"] = {NPC = CFrame.new(1569, 39, -1311), Price = 1500, Req = "Fragments"},
    ["Superhuman"] = {NPC = CFrame.new(-3003, 10, -3259), Price = 3000000, Req = "Money"},
    ["Death Step"] = {NPC = CFrame.new(5668, 28, -6483), Price = 2500000, Frag = 5000},
    ["Sharkman Karate"] = {NPC = CFrame.new(-3089, 238, -10190), Price = 2500000, Frag = 5000},
    
    -- SEA 3
    ["Electric Claw"] = {NPC = CFrame.new(-10357, 330, -8751), Price = 3000000, Frag = 5000, QuestPos = CFrame.new(-12471, 375, -9490)},
    ["Dragon Talon"] = {NPC = CFrame.new(-1246, 332, -9460), Price = 3000000, Frag = 5000},
    ["Godhuman"] = {NPC = CFrame.new(-2870, 246, -12030), Price = 5000000, Frag = 5000},
}
-- Locais de Eventos e Puzzles de Mar
Data.Locations = {
    ["TempleOfTime"] = CFrame.new(2800, 15000, 100), -- Coordenada aproximada do Templo
    ["Factory_Entrance"] = CFrame.new(432, 200, -425),
    ["Elite_Hunter_NPC"] = CFrame.new(-5415, 312, -2825) -- Castle on the Sea
}

-- Configuração do Auto-Stats (Onde distribuir os pontos)
Data.StatsConfig = {
    PointsPerLevel = 3,
    Priority = {"Melee", "Defense", "Blox Fruit"} -- Altere para "Sword" se for usar espada
}

Data.MasteryTargets = {
    ["Electric"] = 400,     -- Requisito para Electric Claw
    ["Dark Step"] = 400,    -- Requisito para Death Step
    ["Water Kung Fu"] = 400, -- Requisito para Sharkman Karate
    ["Dragon Breath"] = 400  -- Requisito para Dragon Talon
}

return Data
