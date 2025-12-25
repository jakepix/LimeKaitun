local UI = {}
UI.Status = {Main = "IDLE", Sub = "Aguardando...", Time = tick()}
UI.Inventory = {
    Swords = {}, 
    Melees = {}, -- Exemplo de inserção: {Name = "Godhuman", Mastery = 600}
    Fruits = {},
    Accs = {}
}

local CurrentTab = "Swords"

function UI.Init()
    local sg = Instance.new("ScreenGui", game.CoreGui)
    sg.Name = "LimaoKaitun_Poison"

    -- Cores Poison
    local Color_Purple = Color3.fromRGB(142, 68, 173)
    local Color_Green = Color3.fromRGB(46, 204, 113)
    local Color_Bg = Color3.fromRGB(10, 10, 10)

    -- 1. STATUS SUPERIOR (EMPILHADO)
    local topStatus = Instance.new("Frame", sg)
    topStatus.Size = UDim2.new(0, 440, 0, 65)
    topStatus.Position = UDim2.new(0.5, -220, 0.15, 0)
    topStatus.BackgroundColor3 = Color_Bg
    topStatus.BorderColor3 = Color_Purple
    topStatus.BorderSizePixel = 1 -- Borda fina igual CodePen

    local mTask = Instance.new("TextLabel", topStatus)
    mTask.Size = UDim2.new(1, -20, 0.5, 0)
    mTask.Position = UDim2.new(0, 15, 0, 5)
    mTask.Font = Enum.Font.GothamBold
    mTask.TextColor3 = Color3.new(1, 1, 1)
    mTask.TextSize = 13
    mTask.TextXAlignment = "Left"
    mTask.BackgroundTransparency = 1
    mTask.RichText = true

    local sTask = Instance.new("TextLabel", topStatus)
    sTask.Size = UDim2.new(1, -20, 0.5, 0)
    sTask.Position = UDim2.new(0, 15, 0.5, -5)
    sTask.Font = Enum.Font.GothamBold
    sTask.TextColor3 = Color3.new(1, 1, 1)
    sTask.TextSize = 12
    sTask.TextXAlignment = "Left"
    sTask.BackgroundTransparency = 1
    sTask.RichText = true

    -- 2. MAIN CARD
    local mainFrame = Instance.new("Frame", sg)
    mainFrame.Size = UDim2.new(0, 480, 0, 360)
    mainFrame.Position = UDim2.new(0.5, -240, 0.15, 80)
    mainFrame.BackgroundColor3 = Color_Bg
    mainFrame.BorderColor3 = Color_Purple
    mainFrame.BorderSizePixel = 1

    local title = Instance.new("TextLabel", mainFrame)
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Text = "🍋 LIMAO KAITUN | <font color='#2ecc71'>POISON</font>"
    title.RichText = true
    title.TextColor3 = Color_Purple
    title.Font = Enum.Font.GothamBold
    title.TextSize = 14
    title.BackgroundTransparency = 1

    -- 3. INFO GRID (Race, Beli, etc)
    local infoGrid = Instance.new("Frame", mainFrame)
    infoGrid.Size = UDim2.new(0.9, 0, 0, 50)
    infoGrid.Position = UDim2.new(0.05, 0, 0.12, 0)
    infoGrid.BackgroundTransparency = 1

    -- 4. MENU TABS (Botões igual ao CodePen)
    local menu = Instance.new("Frame", mainFrame)
    menu.Size = UDim2.new(0.9, 0, 0, 30)
    menu.Position = UDim2.new(0.05, 0, 0.3, 0)
    menu.BackgroundTransparency = 1
    
    local tabLayout = Instance.new("UIListLayout", menu)
    tabLayout.FillDirection = "Horizontal"
    tabLayout.Padding = UDim.new(0, 5)

    local function CreateTab(name)
        local btn = Instance.new("TextButton", menu)
        btn.Size = UDim2.new(0.24, 0, 1, 0)
        btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        btn.BorderColor3 = Color3.fromRGB(40, 40, 40)
        btn.TextColor3 = Color3.fromRGB(150, 150, 150)
        btn.Text = name:upper()
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 10
        
        btn.MouseButton1Click:Connect(function()
            CurrentTab = name
            UI.Refresh()
        end)
    end

    CreateTab("Swords")
    CreateTab("Melees")
    CreateTab("Fruits")
    CreateTab("Accs")

    -- 5. SCROLL AREA
    local scroll = Instance.new("ScrollingFrame", mainFrame)
    scroll.Size = UDim2.new(0.9, 0, 0, 130)
    scroll.Position = UDim2.new(0.05, 0, 0.42, 0)
    scroll.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
    scroll.BorderColor3 = Color3.fromRGB(25, 25, 25)
    scroll.ScrollBarThickness = 2
    scroll.ScrollBarImageColor3 = Color_Purple

    local listLayout = Instance.new("UIListLayout", scroll)
    listLayout.Padding = UDim.new(0, 5)

    -- 6. FOOTER
    local footer = Instance.new("TextLabel", mainFrame)
    footer.Size = UDim2.new(1, 0, 0, 40)
    footer.Position = UDim2.new(0, 0, 1, -40)
    footer.BackgroundTransparency = 1
    footer.Text = "MADE BY: <font color='#2ecc71'>LIMAO</font>"
    footer.RichText = true
    footer.TextColor3 = Color3.fromRGB(70, 70, 70)
    footer.Font = Enum.Font.GothamBold
    footer.TextSize = 10

    -- Lógica de Update
    UI.Refresh = function()
        for _, v in pairs(scroll:GetChildren()) do if v:IsA("Frame") then v:Destroy() end end
        
        local data = UI.Inventory[CurrentTab]
        for _, item in pairs(data) do
            local row = Instance.new("Frame", scroll)
            row.Size = UDim2.new(1, -10, 0, 25)
            row.BackgroundTransparency = 1
            
            local txt = Instance.new("TextLabel", row)
            txt.Size = UDim2.new(1, 0, 1, 0)
            txt.BackgroundTransparency = 1
            txt.Font = Enum.Font.GothamSemibold
            txt.TextSize = 11
            txt.TextColor3 = Color3.new(1,1,1)
            txt.TextXAlignment = "Left"

            if CurrentTab == "Melees" then
                local mastery = item.Mastery or 0
                local color = mastery >= 400 and "#2ecc71" or "#e74c3c"
                txt.Text = "  " .. item.Name .. " <font color='"..color.."'>["..mastery.."/400]</font>"
            else
                txt.Text = "  " .. tostring(item) .. " <font color='#2ecc71'>✓</font>"
            end
            txt.RichText = true
        end
    end

    task.spawn(function()
        while task.wait(0.5) do
            mTask.Text = "Main Task: <font color='#2ecc71'>" .. UI.Status.Main .. "</font>"
            sTask.Text = "Sub Task: <font color='#2ecc71'>" .. UI.Status.Sub .. "</font>"
        end
    end)
end

return UI