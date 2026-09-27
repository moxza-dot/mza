--// MZAAA SCRIPT
--// UI Framework v1
--// Credit: moxza.id
--// Watermark: mzaaascripter

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

--// Prevent duplicate UI
if PlayerGui:FindFirstChild("MzaaaUI") then
    PlayerGui.MzaaaUI:Destroy()
end

--==================================================
-- CONFIG
--==================================================

local Config = {
    Name = "Mzaaa",
    GameName = "Steal An Egg",

    MainColor = Color3.fromRGB(145, 70, 255),
    AccentColor = Color3.fromRGB(180, 100, 255),

    Background = Color3.fromRGB(10, 10, 14),
    Panel = Color3.fromRGB(18, 18, 24),

    Text = Color3.fromRGB(245, 245, 250),
    SubText = Color3.fromRGB(165, 165, 180),

    Transparency = 0.20,

    UIVisible = true,
    Notifications = true,
    UIScale = 1
}

--==================================================
-- SERVICES / HELPERS
--==================================================

local function Tween(object, time, properties)
    local info = TweenInfo.new(
        time,
        Enum.EasingStyle.Quart,
        Enum.EasingDirection.Out
    )

    TweenService:Create(object, info, properties):Play()
end

local function Corner(object, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius)
    c.Parent = object
    return c
end

local function Stroke(object, color, transparency)
    local s = Instance.new("UIStroke")
    s.Color = color
    s.Transparency = transparency or 0
    s.Thickness = 1
    s.Parent = object
    return s
end

local function Padding(object, amount)
    local p = Instance.new("UIPadding")
    p.PaddingTop = UDim.new(0, amount)
    p.PaddingBottom = UDim.new(0, amount)
    p.PaddingLeft = UDim.new(0, amount)
    p.PaddingRight = UDim.new(0, amount)
    p.Parent = object
end

--==================================================
-- SCREEN GUI
--==================================================

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MzaaaUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PlayerGui

--==================================================
-- FLOATING BUTTON
--==================================================

local OpenButton = Instance.new("TextButton")
OpenButton.Name = "MzaaaButton"
OpenButton.Size = UDim2.fromOffset(52, 52)
OpenButton.Position = UDim2.new(1, -70, 0, 25)
OpenButton.BackgroundColor3 = Config.MainColor
OpenButton.BackgroundTransparency = 0.05
OpenButton.Text = "M"
OpenButton.TextColor3 = Color3.new(1,1,1)
OpenButton.TextSize = 24
OpenButton.Font = Enum.Font.GothamBold
OpenButton.AutoButtonColor = false
OpenButton.Parent = ScreenGui

Corner(OpenButton, 16)
Stroke(OpenButton, Config.AccentColor, 0.2)

local OpenGradient = Instance.new("UIGradient")
OpenGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Config.MainColor),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(90, 35, 170))
})
OpenGradient.Rotation = 45
OpenGradient.Parent = OpenButton

--==================================================
-- MAIN WINDOW
--==================================================

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 620, 0, 410)
MainFrame.Position = UDim2.new(0, 25, 0.5, -205)
MainFrame.BackgroundColor3 = Config.Background
MainFrame.BackgroundTransparency = Config.Transparency
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

Corner(MainFrame, 16)
Stroke(MainFrame, Config.MainColor, 0.55)

-- Scale
local UIScale = Instance.new("UIScale")
UIScale.Scale = Config.UIScale
UIScale.Parent = MainFrame

--==================================================
-- HEADER
--==================================================

local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 58)
Header.BackgroundTransparency = 1
Header.Parent = MainFrame

local Logo = Instance.new("TextLabel")
Logo.Size = UDim2.fromOffset(55, 55)
Logo.Position = UDim2.fromOffset(12, 2)
Logo.BackgroundTransparency = 1
Logo.Text = "M"
Logo.TextColor3 = Config.MainColor
Logo.TextSize = 30
Logo.Font = Enum.Font.GothamBold
Logo.Parent = Header

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 200, 0, 25)
Title.Position = UDim2.fromOffset(65, 10)
Title.BackgroundTransparency = 1
Title.Text = "Mzaaa"
Title.TextColor3 = Config.Text
Title.TextSize = 19
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(0, 220, 0, 20)
Subtitle.Position = UDim2.fromOffset(66, 32)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "Steal An Egg"
Subtitle.TextColor3 = Config.SubText
Subtitle.TextSize = 11
Subtitle.Font = Enum.Font.Gotham
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.Parent = Header

-- Status
local StatusDot = Instance.new("Frame")
StatusDot.Size = UDim2.fromOffset(8, 8)
StatusDot.Position = UDim2.new(1, -115, 0, 25)
StatusDot.BackgroundColor3 = Color3.fromRGB(80, 255, 130)
StatusDot.BorderSizePixel = 0
StatusDot.Parent = Header

Corner(StatusDot, 10)

local Status = Instance.new("TextLabel")
Status.Size = UDim2.fromOffset(80, 25)
Status.Position = UDim2.new(1, -103, 0, 17)
Status.BackgroundTransparency = 1
Status.Text = "Loaded"
Status.TextColor3 = Color3.fromRGB(120, 255, 155)
Status.TextSize = 12
Status.Font = Enum.Font.GothamMedium
Status.TextXAlignment = Enum.TextXAlignment.Left
Status.Parent = Header

-- Minimize
local Minimize = Instance.new("TextButton")
Minimize.Size = UDim2.fromOffset(38, 32)
Minimize.Position = UDim2.new(1, -45, 0, 13)
Minimize.BackgroundColor3 = Config.Panel
Minimize.Text = "—"
Minimize.TextColor3 = Config.Text
Minimize.TextSize = 20
Minimize.Font = Enum.Font.GothamBold
Minimize.AutoButtonColor = false
Minimize.Parent = Header

Corner(Minimize, 9)

--==================================================
-- SIDEBAR
--==================================================

local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 145, 1, -70)
Sidebar.Position = UDim2.fromOffset(10, 60)
Sidebar.BackgroundColor3 = Config.Panel
Sidebar.BackgroundTransparency = 0.15
Sidebar.BorderSizePixel = 0
Sidebar.Parent = MainFrame

Corner(Sidebar, 13)

local SideLayout = Instance.new("UIListLayout")
SideLayout.Padding = UDim.new(0, 5)
SideLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
SideLayout.SortOrder = Enum.SortOrder.LayoutOrder
SideLayout.Parent = Sidebar

local SidePadding = Instance.new("UIPadding")
SidePadding.PaddingTop = UDim.new(0, 10)
SidePadding.PaddingLeft = UDim.new(0, 7)
SidePadding.PaddingRight = UDim.new(0, 7)
SidePadding.Parent = Sidebar

--==================================================
-- CONTENT
--==================================================

local Content = Instance.new("Frame")
Content.Name = "Content"
Content.Size = UDim2.new(1, -175, 1, -70)
Content.Position = UDim2.new(0, 165, 0, 60)
Content.BackgroundTransparency = 1
Content.Parent = MainFrame

local ContentTitle = Instance.new("TextLabel")
ContentTitle.Size = UDim2.new(1, -10, 0, 35)
ContentTitle.Position = UDim2.fromOffset(5, 0)
ContentTitle.BackgroundTransparency = 1
ContentTitle.Text = "Main"
ContentTitle.TextColor3 = Config.Text
ContentTitle.TextSize = 20
ContentTitle.Font = Enum.Font.GothamBold
ContentTitle.TextXAlignment = Enum.TextXAlignment.Left
ContentTitle.Parent = Content

local SearchBox = Instance.new("TextBox")
SearchBox.Size = UDim2.new(1, -10, 0, 34)
SearchBox.Position = UDim2.fromOffset(5, 38)
SearchBox.BackgroundColor3 = Config.Panel
SearchBox.BackgroundTransparency = 0.1
SearchBox.BorderSizePixel = 0
SearchBox.PlaceholderText = "Search..."
SearchBox.PlaceholderColor3 = Config.SubText
SearchBox.Text = ""
SearchBox.TextColor3 = Config.Text
SearchBox.TextSize = 12
SearchBox.Font = Enum.Font.Gotham
SearchBox.ClearTextOnFocus = false
SearchBox.Parent = Content

Corner(SearchBox, 9)
Padding(SearchBox, 4)

local FeatureContainer = Instance.new("ScrollingFrame")
FeatureContainer.Name = "Features"
FeatureContainer.Size = UDim2.new(1, -10, 1, -82)
FeatureContainer.Position = UDim2.fromOffset(5, 78)
FeatureContainer.BackgroundTransparency = 1
FeatureContainer.BorderSizePixel = 0
FeatureContainer.ScrollBarThickness = 3
FeatureContainer.ScrollBarImageColor3 = Config.MainColor
FeatureContainer.CanvasSize = UDim2.new(0,0,0,0)
FeatureContainer.Parent = Content

local FeatureLayout = Instance.new("UIListLayout")
FeatureLayout.Padding = UDim.new(0, 8)
FeatureLayout.SortOrder = Enum.SortOrder.LayoutOrder
FeatureLayout.Parent = FeatureContainer

--==================================================
-- NOTIFICATION
--==================================================

local NotificationHolder = Instance.new("Frame")
NotificationHolder.Size = UDim2.new(0, 270, 1, -20)
NotificationHolder.Position = UDim2.new(1, -280, 0, 10)
NotificationHolder.BackgroundTransparency = 1
NotificationHolder.Parent = ScreenGui

local NotificationLayout = Instance.new("UIListLayout")
NotificationLayout.Padding = UDim.new(0, 8)
NotificationLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
NotificationLayout.Parent = NotificationHolder

local function Notify(title, message)
    if not Config.Notifications then
        return
    end

    local Notification = Instance.new("Frame")
    Notification.Size = UDim2.new(1, 0, 0, 65)
    Notification.BackgroundColor3 = Config.Panel
    Notification.BackgroundTransparency = 0.05
    Notification.BorderSizePixel = 0
    Notification.Parent = NotificationHolder

    Corner(Notification, 12)
    Stroke(Notification, Config.MainColor, 0.45)

    local NTitle = Instance.new("TextLabel")
    NTitle.Size = UDim2.new(1, -20, 0, 22)
    NTitle.Position = UDim2.fromOffset(10, 7)
    NTitle.BackgroundTransparency = 1
    NTitle.Text = title
    NTitle.TextColor3 = Config.Text
    NTitle.TextSize = 13
    NTitle.Font = Enum.Font.GothamBold
    NTitle.TextXAlignment = Enum.TextXAlignment.Left
    NTitle.Parent = Notification

    local NMessage = Instance.new("TextLabel")
    NMessage.Size = UDim2.new(1, -20, 0, 28)
    NMessage.Position = UDim2.fromOffset(10, 29)
    NMessage.BackgroundTransparency = 1
    NMessage.Text = message
    NMessage.TextColor3 = Config.SubText
    NMessage.TextSize = 11
    NMessage.Font = Enum.Font.Gotham
    NMessage.TextXAlignment = Enum.TextXAlignment.Left
    NMessage.TextWrapped = true
    NMessage.Parent = Notification

    Notification.Position = UDim2.new(1, 30, 0, 0)

    Tween(
        Notification,
        0.35,
        {
            Position = UDim2.new(0, 0, 0, 0)
        }
    )

    task.delay(3, function()
        if Notification and Notification.Parent then
            Tween(
                Notification,
                0.3,
                {
                    Position = UDim2.new(1, 30, 0, 0)
                }
            )

            task.wait(0.35)
            Notification:Destroy()
        end
    end)
end

--==================================================
-- FEATURE HELPERS
--==================================================

local function ClearFeatures()
    for _, child in ipairs(FeatureContainer:GetChildren()) do
        if not child:IsA("UIListLayout") then
            child:Destroy()
        end
    end
end

local function UpdateCanvas()
    FeatureContainer.CanvasSize = UDim2.new(
        0,
        0,
        0,
        FeatureLayout.AbsoluteContentSize.Y + 10
    )
end

FeatureLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(UpdateCanvas)

local function CreateSection(text)
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -5, 0, 25)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.TextColor3 = Config.AccentColor
    Label.TextSize = 12
    Label.Font = Enum.Font.GothamBold
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = FeatureContainer

    return Label
end

local function CreateToggle(title, description, callback)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, -5, 0, 62)
    Frame.BackgroundColor3 = Config.Panel
    Frame.BackgroundTransparency = 0.05
    Frame.BorderSizePixel = 0
    Frame.Parent = FeatureContainer

    Corner(Frame, 11)

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, -75, 0, 22)
    TitleLabel.Position = UDim2.fromOffset(12, 8)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = title
    TitleLabel.TextColor3 = Config.Text
    TitleLabel.TextSize = 13
    TitleLabel.Font = Enum.Font.GothamMedium
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = Frame

    local DescLabel = Instance.new("TextLabel")
    DescLabel.Size = UDim2.new(1, -75, 0, 20)
    DescLabel.Position = UDim2.fromOffset(12, 31)
    DescLabel.BackgroundTransparency = 1
    DescLabel.Text = description
    DescLabel.TextColor3 = Config.SubText
    DescLabel.TextSize = 10
    DescLabel.Font = Enum.Font.Gotham
    DescLabel.TextXAlignment = Enum.TextXAlignment.Left
    DescLabel.TextTruncate = Enum.TextTruncate.AtEnd
    DescLabel.Parent = Frame

    local ToggleBack = Instance.new("TextButton")
    ToggleBack.Size = UDim2.fromOffset(43, 23)
    ToggleBack.Position = UDim2.new(1, -55, 0.5, -11)
    ToggleBack.BackgroundColor3 = Color3.fromRGB(45,45,52)
    ToggleBack.Text = ""
    ToggleBack.AutoButtonColor = false
    ToggleBack.Parent = Frame

    Corner(ToggleBack, 15)

    local Circle = Instance.new("Frame")
    Circle.Size = UDim2.fromOffset(17,17)
    Circle.Position = UDim2.fromOffset(3,3)
    Circle.BackgroundColor3 = Color3.fromRGB(220,220,225)
    Circle.BorderSizePixel = 0
    Circle.Parent = ToggleBack

    Corner(Circle, 20)

    local Enabled = false

    ToggleBack.MouseButton1Click:Connect(function()
        Enabled = not Enabled

        if Enabled then
            Tween(ToggleBack, 0.2, {
                BackgroundColor3 = Config.MainColor
            })

            Tween(Circle, 0.2, {
                Position = UDim2.new(1, -20, 0, 3)
            })
        else
            Tween(ToggleBack, 0.2, {
                BackgroundColor3 = Color3.fromRGB(45,45,52)
            })

            Tween(Circle, 0.2, {
                Position = UDim2.fromOffset(3,3)
            })
        end

        if callback then
            callback(Enabled)
        end
    end)

    return Frame
end

local function CreateButton(title, description, callback)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, -5, 0, 55)
    Button.BackgroundColor3 = Config.Panel
    Button.BackgroundTransparency = 0.05
    Button.Text = ""
    Button.AutoButtonColor = false
    Button.Parent = FeatureContainer

    Corner(Button, 11)

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, -55, 0, 20)
    TitleLabel.Position = UDim2.fromOffset(12, 7)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = title
    TitleLabel.TextColor3 = Config.Text
    TitleLabel.TextSize = 13
    TitleLabel.Font = Enum.Font.GothamMedium
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = Button

    local DescLabel = Instance.new("TextLabel")
    DescLabel.Size = UDim2.new(1, -55, 0, 18)
    DescLabel.Position = UDim2.fromOffset(12, 29)
    DescLabel.BackgroundTransparency = 1
    DescLabel.Text = description
    DescLabel.TextColor3 = Config.SubText
    DescLabel.TextSize = 10
    DescLabel.Font = Enum.Font.Gotham
    DescLabel.TextXAlignment = Enum.TextXAlignment.Left
    DescLabel.Parent = Button

    local Arrow = Instance.new("TextLabel")
    Arrow.Size = UDim2.fromOffset(30, 30)
    Arrow.Position = UDim2.new(1, -40, 0.5, -15)
    Arrow.BackgroundTransparency = 1
    Arrow.Text = "›"
    Arrow.TextColor3 = Config.AccentColor
    Arrow.TextSize = 24
    Arrow.Font = Enum.Font.GothamBold
    Arrow.Parent = Button

    Button.MouseButton1Click:Connect(function()
        if callback then
            callback()
        end
    end)

    return Button
end

local function CreateDropdown(title, description, options, callback)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, -5, 0, 62)
    Frame.BackgroundColor3 = Config.Panel
    Frame.BackgroundTransparency = 0.05
    Frame.BorderSizePixel = 0
    Frame.Parent = FeatureContainer

    Corner(Frame, 11)

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(0.55, 0, 0, 22)
    TitleLabel.Position = UDim2.fromOffset(12, 8)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = title
    TitleLabel.TextColor3 = Config.Text
    TitleLabel.TextSize = 13
    TitleLabel.Font = Enum.Font.GothamMedium
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = Frame

    local DescLabel = Instance.new("TextLabel")
    DescLabel.Size = UDim2.new(0.55, 0, 0, 20)
    DescLabel.Position = UDim2.fromOffset(12, 31)
    DescLabel.BackgroundTransparency = 1
    DescLabel.Text = description
    DescLabel.TextColor3 = Config.SubText
    DescLabel.TextSize = 10
    DescLabel.Font = Enum.Font.Gotham
    DescLabel.TextXAlignment = Enum.TextXAlignment.Left
    DescLabel.Parent = Frame

    local Dropdown = Instance.new("TextButton")
    Dropdown.Size = UDim2.new(0, 125, 0, 32)
    Dropdown.Position = UDim2.new(1, -137, 0.5, -16)
    Dropdown.BackgroundColor3 = Color3.fromRGB(30,30,38)
    Dropdown.Text = options[1]
    Dropdown.TextColor3 = Config.Text
    Dropdown.TextSize = 11
    Dropdown.Font = Enum.Font.GothamMedium
    Dropdown.AutoButtonColor = false
    Dropdown.Parent = Frame

    Corner(Dropdown, 8)

    local Index = 1

    Dropdown.MouseButton1Click:Connect(function()
        Index += 1

        if Index > #options then
            Index = 1
        end

        Dropdown.Text = options[Index]

        if callback then
            callback(options[Index])
        end
    end)

    return Frame
end

local function CreateSlider(title, min, max, default, callback)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, -5, 0, 68)
    Frame.BackgroundColor3 = Config.Panel
    Frame.BackgroundTransparency = 0.05
    Frame.BorderSizePixel = 0
    Frame.Parent = FeatureContainer

    Corner(Frame, 11)

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -20, 0, 20)
    Label.Position = UDim2.fromOffset(10, 7)
    Label.BackgroundTransparency = 1
    Label.Text = title .. ": " .. tostring(default)
    Label.TextColor3 = Config.Text
    Label.TextSize = 12
    Label.Font = Enum.Font.GothamMedium
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Frame

    local Bar = Instance.new("Frame")
    Bar.Size = UDim2.new(1, -25, 0, 6)
    Bar.Position = UDim2.fromOffset(12, 42)
    Bar.BackgroundColor3 = Color3.fromRGB(45,45,52)
    Bar.BorderSizePixel = 0
    Bar.Parent = Frame

    Corner(Bar, 10)

    local Fill = Instance.new("Frame")
    Fill.Size = UDim2.new(
        (default-min)/(max-min),
        0,
        1,
        0
    )
    Fill.BackgroundColor3 = Config.MainColor
    Fill.BorderSizePixel = 0
    Fill.Parent = Bar

    Corner(Fill, 10)

    local Dragging = false

    local function SetSlider(input)
        local percent = math.clamp(
            (input.Position.X - Bar.AbsolutePosition.X) /
            Bar.AbsoluteSize.X,
            0,
            1
        )

        local value = math.floor(
            min + ((max-min) * percent)
        )

        Fill.Size = UDim2.new(percent,0,1,0)
        Label.Text = title .. ": " .. tostring(value)

        if callback then
            callback(value)
        end
    end

    Bar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseB
