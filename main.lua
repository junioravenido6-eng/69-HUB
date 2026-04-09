local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local lp = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BLUE-HUB"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

-- Color Palette
local COLORS = {
    MainBG = Color3.fromRGB(11, 14, 20),
    TabBG = Color3.fromRGB(15, 20, 28),
    Border = Color3.fromRGB(35, 125, 255),
    TextActive = Color3.fromRGB(35, 125, 255),
    TextInactive = Color3.fromRGB(140, 140, 140),
    RowBG = Color3.fromRGB(18, 24, 35)
}

---------------------------------------------------------------------
-- UI CORE ENGINE
---------------------------------------------------------------------

local function create(class, props)
    local obj = Instance.new(class)
    for k, v in pairs(props) do
        if k ~= "Parent" then
            obj[k] = v
        end
    end
    obj.Parent = props.Parent
    return obj
end

local ToggleIcon = create("TextButton", {
    Size = UDim2.new(0, 45, 0, 45),
    Position = UDim2.new(0.05, 0, 0.2, 0),
    BackgroundColor3 = COLORS.MainBG,
    Text = "B", -- CHANGED
    TextColor3 = COLORS.Border,
    Font = "GothamBold",
    TextSize = 20,
    Parent = ScreenGui
})

create("UICorner", {CornerRadius = UDim.new(0, 8), Parent = ToggleIcon})
create("UIStroke", {Color = COLORS.Border, Thickness = 1.5, Parent = ToggleIcon})

local MainFrame = create("Frame", {
    Size = UDim2.new(0, 340, 0, 380),
    Position = UDim2.new(0.5, -170, 0.5, -190),
    BackgroundColor3 = COLORS.MainBG,
    BackgroundTransparency = 0.2,
    Visible = false,
    Parent = ScreenGui
})

create("UICorner", {CornerRadius = UDim.new(0, 12), Parent = MainFrame})
create("UIStroke", {Color = COLORS.Border, Thickness = 2, Parent = MainFrame})

local Header = create("Frame", {
    Size = UDim2.new(1, 0, 0, 45),
    BackgroundTransparency = 1,
    Parent = MainFrame
})

create("TextLabel", {
    Text = "BLUE-HUB", -- CHANGED
    TextColor3 = COLORS.Border,
    Font = "GothamBold",
    TextSize = 18,
    Size = UDim2.new(0.5, 0, 1, 0),
    Position = UDim2.new(0.05, 0, 0, 0),
    BackgroundTransparency = 1,
    TextXAlignment = "Left",
    Parent = Header
})

---------------------------------------------------------------------
-- SPEED UI FIXED NAME
---------------------------------------------------------------------

local function createSpeedUI()
    local SpeedScreenGui = create("ScreenGui", {
        Name = "BLUE-HUB_SpeedUI", -- CHANGED
        ResetOnSpawn = false,
        Parent = CoreGui
    })

    local MainFrame = create("Frame", {
        Name = "SpeedMainFrame",
        Size = UDim2.new(0, 240, 0, 220),
        Position = UDim2.new(0.5, -120, 0.4, 0),
        BackgroundColor3 = Color3.fromRGB(20, 25, 30),
        BackgroundTransparency = 0.2,
        BorderSizePixel = 0,
        Active = true,
        Draggable = true,
        Parent = SpeedScreenGui
    })

    create("UICorner", {CornerRadius = UDim.new(0, 10), Parent = MainFrame})
    create("UIStroke", {Color = Color3.fromRGB(50, 150, 250), Thickness = 2, Parent = MainFrame})

    create("TextLabel", {
        Size = UDim2.new(1, 0, 0, 30),
        Position = UDim2.new(0, 12, 0, 10),
        BackgroundTransparency = 1,
        Text = "BLUE-HUB Speed Customizer", -- CHANGED
        TextColor3 = Color3.fromRGB(80, 180, 255),
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.GothamBold,
        Parent = MainFrame
    })
end
