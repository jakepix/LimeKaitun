_G.AutoFarm = true
_G.Team = "Marines" -- Escolha automática de time

-- LINKS RAW DO SEU GITHUB (Substitua quando criar os arquivos)
local Links = {
    Data = "LINK_RAW_DO_DATA_AQUI",
    Funcs = "LINK_RAW_DO_FUNCS_AQUI",
    Frontend = "LINK_RAW_DO_FRONT_AQUI",
    Tasks = "LINK_RAW_DO_TASKS_AQUI"
}

local Data = loadstring(game:HttpGet(Links.Data))()
local Funcs = loadstring(game:HttpGet(Links.Funcs))()
local UI = loadstring(game:HttpGet(Links.Frontend))()
local Tasks = loadstring(game:HttpGet(Links.Tasks))()

UI.Init()

-- Loop de 0.03s conforme solicitado
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
game:GetService("RunService"):Set3dRenderingEnabled(false) -- Desativa o 3D (FPS sobe muito)

-- Anti-AFK para não cair da conta
player.Idled:Connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
end)