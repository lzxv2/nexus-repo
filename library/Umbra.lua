local Umbra = {}

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

function getObj(Type, Name)
  local Name = Instance.new(Type)
  return Name
end

local Frame = getObj(Types.Window, "Frame")

function Umbra.Create()
   local self = {}
   function self:Window()
      self = {
         Name = self.Name,
         Logo = self.Logo,
         BorderColor = self.BorderColor
      }
   end
end
