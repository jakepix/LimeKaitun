_G.AutoFarm = true
_G.Team = "Marines" -- Escolha automática de time

-- LINKS RAW DO SEU GITHUB
local Links = {
    Data = "https://raw.githubusercontent.com/jakepix/LimeKaitun/refs/heads/main/data.lua",
    Funcs = "https://raw.githubusercontent.com/jakepix/LimeKaitun/refs/heads/main/funcs.lua",
    Frontend = "https://raw.githubusercontent.com/jakepix/LimeKaitun/refs/heads/main/frontend.lua",
    Tasks = "https://raw.githubusercontent.com/jakepix/LimeKaitun/refs/heads/main/tasks.lua"
} -- O erro estava aqui, faltava fechar a chave!

local Data = loadstring(game:HttpGet(Links.Data))()
local Funcs = loadstring(game:HttpGet(Links.Funcs))()
local UI = loadstring(game:HttpGet(Links.Frontend))()
local Tasks = loadstring(game:HttpGet(Links.Tasks))()

UI.Init()

-- Loop de 0.02s conforme solicitado
task.spawn(function()
    while task.wait(0.02) do
        if _G.AutoFarm then
            Tasks.Run(Data, Funcs, UI)
        end
    end
end)

-- Otimização de CPU/GPU para Kaitun
if not game:IsLoaded() then game.Loaded:Wait() end
settings().Rendering.DrawDistanceMax = 150

-- Se quiser ver a UI, coloque -- antes da linha abaixo
-- game:GetService("RunService"):Set3dRenderingEnabled(false)

-- Anti-AFK
local player = game.Players.LocalPlayer
player.Idled:Connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
end)
