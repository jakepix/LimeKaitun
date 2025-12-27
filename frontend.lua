local UI = {}
local player = game.Players.LocalPlayer

function UI.Init()
    local sg = Instance.new("ScreenGui", game.CoreGui)
    sg.Name = "CopoKaitun_Final"
    sg.ResetOnSpawn = false

    -- Configuração de Cores (Azul Cobalto + Preto Dominante)
    local Color_Ocean = Color3.fromRGB(0, 119, 182) -- Azul mais sério
    local Color_Dark_Border = Color3.fromRGB(0, 48, 73) -- Borda discreta
    local Color_Black = Color3.fromRGB(0, 0, 0)

    -- 1. FRAME PRINCIPAL (O que abre e fecha)
    local MainHolder = Instance.new("Frame", sg)
    MainHolder.Size = UDim2.new(1, 0, 1, 0)
    MainHolder.BackgroundTransparency = 1
    MainHolder.Visible = true

    -- CAIXA DE TASK (TOP BOX)
    local TaskBox = Instance.new("Frame", MainHolder)
    TaskBox.Size = UDim2.new(0, 320, 0, 55)
    TaskBox.Position = UDim2.new(0.5, -160, 0.1, 0)
    TaskBox.BackgroundColor3 = Color_Black
    TaskBox.BackgroundTransparency = 0.3
    TaskBox.BorderColor3 = Color_Dark_Border
    TaskBox.BorderSizePixel = 2

    local TaskLabel = Instance.new("TextLabel", TaskBox)
    TaskLabel.Size = UDim2.new(1, 0, 1, 0)
    TaskLabel.BackgroundTransparency = 1
    TaskLabel.Text = "Status : <font color='#0077b6'>Farm Level</font>\n<font size='10' color='#555555'>Sub: Taking Quest...</font>"
    TaskLabel.RichText = true
    TaskLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    TaskLabel.Font = Enum.Font.GothamBold
    TaskLabel.TextSize = 14

    -- PAINEL DE STATUS (MAIN CARD)
    local MainCard = Instance.new("Frame", MainHolder)
    MainCard.Size = UDim2.new(0, 450, 0, 280)
    MainCard.Position = UDim2.new(0.5, -225, 0.5, -120)
    MainCard.BackgroundColor3 = Color_Black
    MainCard.BackgroundTransparency = 0.2
    MainCard.BorderColor3 = Color_Dark_Border
    MainCard.BorderSizePixel = 2

    -- Espaço vazio no topo (conforme solicitado)
    local EmptyTitle = Instance.new("Frame", MainCard)
    EmptyTitle.Size = UDim2.new(1, 0, 0, 40)
    EmptyTitle.BackgroundTransparency = 1

    local Divider = Instance.new("Frame", MainCard)
    Divider.Size = UDim2.new(0.8, 0, 0, 1)
    Divider.Position = UDim2.new(0.1, 0, 0, 45)
    Divider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Divider.BorderSizePixel = 0

    -- GRID DE STATUS 2x2
    local StatsFrame = Instance.new("Frame", MainCard)
    StatsFrame.Size = UDim2.new(1, -40, 0, 150)
    StatsFrame.Position = UDim2.new(0, 20, 0, 60)
    StatsFrame.BackgroundTransparency = 1

    local function CreateStat(name, pos)
        local l = Instance.new("TextLabel", StatsFrame)
        l.Size = UDim2.new(0.5, -10, 0, 30)
        l.Position = pos
        l.BackgroundTransparency = 1
        l.Text = name .. ": <font color='#ffffff'>...</font>"
        l.RichText = true
        l.TextColor3 = Color3.fromRGB(85, 85, 85) -- Cor cinza para labels
        l.Font = Enum.Font.GothamBold
        l.TextSize = 13
        l.TextXAlignment = Enum.TextXAlignment.Left
        return l
    end

    local stLvl = CreateStat("Level", UDim2.new(0, 0, 0, 0))
    local stRace = CreateStat("Race", UDim2.new(0.5, 10, 0, 0))
    local stBeli = CreateStat("Beli", UDim2.new(0, 0, 0, 40))
    local stFrag = CreateStat("Frag", UDim2.new(0.5, 10, 0, 40))

    -- FOOTER
    local Footer = Instance.new("TextLabel", MainCard)
    Footer.Size = UDim2.new(1, 0, 0, 30)
    Footer.Position = UDim2.new(0, 0, 1, -30)
    Footer.Text = "OWNED BY PAULO"
    Footer.TextColor3 = Color3.fromRGB(30, 30, 30)
    Footer.Font = Enum.Font.Code
    Footer.TextSize = 11
    Footer.BackgroundTransparency = 1

    -- 2. BOTÃO TOGGLE (O BOTÃO DE BAIXO)
    local ToggleBtn = Instance.new("TextButton", sg)
    ToggleBtn.Size = UDim2.new(0, 180, 0, 35)
    ToggleBtn.Position = UDim2.new(0.5, -90, 1, -50)
    ToggleBtn.BackgroundColor3 = Color_Black
    ToggleBtn.BorderColor3 = Color_Dark_Border
    ToggleBtn.BorderSizePixel = 2
    ToggleBtn.Text = "COPO KAITUN"
    ToggleBtn.TextColor3 = Color3.new(1, 1, 1)
    ToggleBtn.Font = Enum.Font.GothamBold
    ToggleBtn.TextSize = 13

    -- Lógica de Abrir/Fechar
    ToggleBtn.MouseButton1Click:Connect(function()
        MainHolder.Visible = not MainHolder.Visible
        ToggleBtn.BorderColor3 = MainHolder.Visible and Color_Ocean or Color_Dark_Border
    end)

UI.Status = {
    Main = "Iniciando...",
    Sub = "Aguardando..."
}

-- Criar as Labels na UI para mostrar o que o script está fazendo
local MainLabel = Instance.new("TextLabel", TaskBox)
MainLabel.Size = UDim2.new(1, 0, 0.5, 0)
MainLabel.BackgroundTransparency = 1
MainLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
MainLabel.Text = UI.Status.Main

-- Loop para atualizar o texto na tela
task.spawn(function()
    while task.wait(0.5) do
        MainLabel.Text = UI.Status.Main
    end
end)

    -- Loop de Atualização de Dados
    task.spawn(function()
        while task.wait(1) do
            pcall(function()
                local data = player:FindFirstChild("Data") or player
                stLvl.Text = "Level: <font color='#ffffff'>" .. (player.Data.Level.Value) .. "</font>"
                stBeli.Text = "Beli: <font color='#ffffff'>" .. (player.Data.Beli.Value) .. "</font>"
                stFrag.Text = "Frag: <font color='#ffffff'>" .. (player.Data.Fragments.Value) .. "</font>"
                stRace.Text = "Race: <font color='#ffffff'>" .. (player.Data.Race.Value) .. "</font>"
            end)
        end
    end)
end

UI.Init()
return UI
