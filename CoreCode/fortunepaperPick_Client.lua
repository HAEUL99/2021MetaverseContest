--오미쿠지샵
local shop_s = Script.Parent
local CheckCollider = shop_s.CheckCollider
local NoticeUI = shop_s.Parent.NoticeUI
NoticeUI:SetVisible(false)

local CharacterSetting = Toybox.CharacterSetting
if CharacterSetting == nil then 
   CharacterSetting = Workspace.Character
end

local NoticeCheck = false
local Check = false

local function EnablePressUI(self, target)
    if target == nil or not target:IsCharacter() then
        return
    end

    if NoticeCheck == false and Check == false then
        Input:AddGroup("ShopSetInput")
        Input:AddActionKeyEvent("ShopSetInput", "EndShopSet", Enum.Key.SpaceBar)

        Input:AddGroup("ShopNoticeInput")
        Input:AddActionKeyEvent("ShopNoticeInput", "ShopNotice", Enum.Key.F)
   
        NoticeCheck = true
        Input:ActiveGroup("ShopNoticeInput")
        NoticeUI:SetVisible(true)
    end
end
CheckCollider.OnBeginOverlapEvent:Connect(EnablePressUI)


local function DisablePressUI(self, target)
    if target == nil or not target:IsCharacter() then
        return
    end

    if NoticeCheck then
        NoticeCheck = false
        Input:RemoveGroup("ShopNoticeInput")
        Input:RemoveGroup("ShopSetInput")
        NoticeUI:SetVisible(false)
    end
end
CheckCollider.OnEndOverlapEvent:Connect(DisablePressUI)

LocalPlayer:ProcessInputActionEvent("ShopNotice", Enum.KeyInputType.Pressed, function()
   if NoticeCheck == false then
       return
   end
   shop_s:SendEventToServer("StartShopSet")
end)

LocalPlayer:ProcessInputActionEvent("EndShopSet", Enum.KeyInputType.Pressed, function()
   if Check == false then
       return
   end
   shop_s:SendEventToServer("EndShopSet")
end)


local function StartSetShop()
   Input:ActiveGroup("ShopSetInput")

   NoticeUI:SetVisible(false)
   
   local character = LocalPlayer:GetRemotePlayer():GetCharacter()
   character:AttachAtTop(shop_s, Enum.Bone.LFoot)
   wait(0.1)

end
shop_s:ConnectEventFunction("StartSetShopClient", StartSetShop)

local function EndShopSet()
   local character = LocalPlayer:GetRemotePlayer():GetCharacter()
   wait(1)
   Game:SendEventToServer("SetItem", 0)
   NoticeUI:SetVisible(true)
end
shop_s:ConnectEventFunction("EndShopSetClient", EndShopSet)


local function IsCharacterShopSet(bool)
   Check = bool
end
shop_s:ConnectEventFunction("IsCharacterShopSet", IsCharacterShopSet)






