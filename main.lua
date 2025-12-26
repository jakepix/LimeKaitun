_G.AutoFarm = true
_G.Team = "Marines" 

-- 1. TABELA DE LINKS (CHAVE FECHADA CORRETAMENTE)
local Links = {
    Data = "https://raw.githubusercontent.com/jakepix/LimeKaitun/refs/heads/main/data.lua",
    Funcs = "https://raw.githubusercontent.com/jakepix/LimeKaitun/refs/heads/main/funcs.lua",
    Frontend = "https://raw.githubusercontent.com/jakepix/LimeKaitun/refs/heads/main/frontend.lua",
    Tasks = "https://raw.githubusercontent.com/jakepix/LimeKaitun/refs/heads/main/tasks.lua"
}

-- 2. CARREGAMENTO SEGURO
local Data = loadstring(game:HttpGet(Links.Data))()
local Funcs = loadstring(game:HttpGet(Links.Funcs))()
local UI = loadstring(game:HttpGet(Links.Frontend))()
local Tasks = loadstring(game:HttpGet(Links.Tasks))()

-- 3. INICIALIZAÇÃO DA UI POISON
UI.Init()

-- 4. LOOP DE EXECUÇÃO (0.02s)
task.spawn(function()
    while task.wait(0.02) do
        if _G.AutoFarm then
            -- Passa os módulos para a lógica de farm
            Tasks.Run(Data, Funcs, UI)
        end
    end
end)

-- 5. OTIMIZAÇÃO (COMENTADA PARA VOCÊ VER A UI)
if not game:IsLoaded() then game.Loaded:Wait() end
settings().Rendering.DrawDistanceMax = 150
-- game:GetService("RunService"):Set3dRenderingEnabled(false) 

-- 6. ANTI-AFK
local player = game.Players.LocalPlayer
player.Idled:Connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
end)

