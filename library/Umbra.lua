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
   Ratio = "UIAspectRatioConstraint"
}

function getObj(Type)
  return Instance.new(Type)
end

function Umbra.Create:Window(config)
   local self = setmetatable({}, { __index = Umbra.Create } )
   
   local Frame = getObj(Types.Window)

   Frame.Name = config.Name or "Window"
   Frame.Size = UDim2.new(0, 555, 0, 400)
   Frame.BackgroundColor3 = Color3.fromRGB(13, 13, 13)
   Frame.BackgroundTransparency = 0.25

   local Radius = getObj(Types.Radius)

   Radius.Parent = Frame
   Radius.CornerRadius = 12
   return self
end
