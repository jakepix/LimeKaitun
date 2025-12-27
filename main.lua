_G.AutoFarm = true
_G.Team = "Marines" 

local Links = {
    Data = "https://raw.githubusercontent.com/jakepix/LimeKaitun/refs/heads/main/data.lua",
    Funcs = "https://raw.githubusercontent.com/jakepix/LimeKaitun/refs/heads/main/funcs.lua",
    Frontend = "https://raw.githubusercontent.com/jakepix/LimeKaitun/refs/heads/main/frontend.lua",
    Tasks = "https://raw.githubusercontent.com/jakepix/LimeKaitun/refs/heads/main/tasks.lua"
}

-- Carregando (com pcall para não crashar se o link estiver off)
local Data = loadstring(game:HttpGet(Links.Data))()
local Funcs = loadstring(game:HttpGet(Links.Funcs))()
local UI = loadstring(game:HttpGet(Links.Frontend))()
local Tasks = loadstring(game:HttpGet(Links.Tasks))()

-- 1. INICIALIZA A UI (O GPT estava certo aqui)
UI.Init()

-- 2. LOOP DE EXECUÇÃO DAS TASKS
task.spawn(function()
    while task.wait(0.3) do
        if _G.AutoFarm then
            -- Passamos Data, Funcs e UI para dentro das Tasks
            pcall(function()
                Tasks.Run(Data, Funcs, UI)
            end)
        end
    end
end)

-- Anti-AFK
local player = game.Players.LocalPlayer
player.Idled:Connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
end)

print("🍋 Lime Kaitun Carregado!")
