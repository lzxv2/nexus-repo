local UserInputService = game:GetService("UserInputService")

local Umbra = {}
Umbra.Create = {}
Umbra.Create.__index = Umbra.Create

local Types = {
   Label = "TextLabel",
   Image = "ImageLabel",
   Button = "TextButton",
   SmoothButton = "ImageButton",
   Window = "Frame",
   Padding = "UIPadding",
   Radius = "UICorner",
   Border = "UIStroke",
   Layout = "UIListLayout",
   Ratio = "UIAspectRatioConstraint",
   Scroller = "ScrollingFrame",
   Gui = "ScreenGui"
}

function getObj(Type)
  return Instance.new(Type)
end

local function makeDraggable(frame)
    local dragging = false
    local dragStart
    local startPos

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            if dragging then
                local delta = input.Position - dragStart
                frame.Position = startPos + UDim2.new(0, delta.X, 0, delta.Y)
            end
        end
    end)
end

function Umbra.Create:Window(config)
   local window = setmetatable({}, Umbra.Create)
   local window.ScreenGui = getObj(Types.Gui)
   local window.Frame = getObj(Types.Window)
   local Players = game:GetService("Players")
   local Player = Players.LocalPlayer

   local Player = game:GetService("Players").LocalPlayer
   while not Player do
       task.wait()
       Player = game:GetService("Players").LocalPlayer
   end
   
   window.ScreenGui.Parent = Player:WaitForChild("PlayerGui")
   window.Frame.Parent = ScreenGui
   self.Container = Frame

   window.Frame.Name = config.Name or "Window"
   window.Frame.Size = UDim2.new(0, 555, 0, 400)
   window.Frame.BackgroundColor3 = Color3.fromRGB(13, 13, 13)
   window.Frame.BackgroundTransparency = 0.25

   local Radius = getObj(Types.Radius)

   Radius.Parent = window.Frame
   Radius.CornerRadius = UDim.new(0, 12)

   local Border = getObj(Types.Border)

   Border.Parent = window.Frame
   Border.Color = Color3.fromRGB(13, 13, 13)
   Border.Transparency = 0.65

   local Padding = getObj(Types.Padding)
   
   Padding.Parent = window.Frame
   Padding.Top = UDim.new(0, 20)
   Padding.Left = UDim.new(0, 25)
   Padding.Right = UDim.new(0, 25)
   Padding.Bottom = UDim.new(0, 20)
   
   local Ratio = getObj(Types.Ratio)
   
   Ratio.Parent = window.Frame
   Ratio.AspectRatio = 1.4

   local Logo = getObj(Types.Image)
   
   Logo.Parent = window.Frame
   Logo.Size = UDim2.new(0, 40, 0, 40)
   Logo.Color3 = Color3.fromRGB(255, 255, 255)
   Logo.Image = "rbxassetid://" .. (config.Logo or "71213772696056")

   local Layout = getObj(Types.Layout)
   
   Layout.Parent = window.Frame
   Layout.FillDirection = Enum.FillDirection.Vertical
   Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
   Layout.Padding = UDim.new(0, 30)
   Layout.SortOrder = Enum.SortOrder.Name

   makeDraggable(window.Frame)

   return window
end

function window:Text(config)
   local Label = getObj(Types.Label)

   Label.Parent = window.Container
   
   Label.Name = config.Name or "Label"
   Label.Size = UDim2.new(0, 20, 0, 20)
   Label.Text = config.Text or "New Label"
   Label.TextColor3 = Color3.fromRGB(237, 237, 237)
   Label.Font = Enum.Font.Ubuntu
   Label.Position = UDim2.new()
   Label.BackgroundTransparency = 1
   Label.TextSize = 18
   Label.TextXAlignment = Enum.TextXAlignment.Left
   Label.TextYAlignment = Enum.TextYAlignment.Center

   return Label
end

function Umbra.Destroy(Item)
   if Item then
     Item:Destroy()
   end
end
