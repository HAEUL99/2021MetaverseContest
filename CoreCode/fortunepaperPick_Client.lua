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
        Input:AddGroup("ShopNoticeInput") 
        -- ShopNoticeInput 인풋 이벤트 그룹에, ShopNotice 이벤트(f키 입력) 연결
        Input:AddActionKeyEvent("ShopNoticeInput", "ShopNotice", Enum.Key.F)
        
        NoticeCheck = true
        -- ShopNoticeInput 활성화
        Input:ActiveGroup("ShopNoticeInput") 
        NoticeUI:SetVisible(true)
        
        Input:AddGroup("ShopSetInput")
        Input:AddActionKeyEvent("ShopSetInput", "EndShopSet", Enum.Key.SpaceBar)
    end
end
-- 지정장소의 collider에 입장하면, EnablePressUI함수 실행.
CheckCollider.OnBeginOverlapEvent:Connect(EnablePressUI) 


local function DisablePressUI(self, target)
    if target == nil or not target:IsCharacter() then
        return
    end

    if NoticeCheck then
        NoticeCheck = false
        -- 인풋 이벤트 제거
        Input:RemoveGroup("ShopNoticeInput")
        Input:RemoveGroup("ShopSetInput")
        NoticeUI:SetVisible(false)
    end
end
CheckCollider.OnEndOverlapEvent:Connect(DisablePressUI)

-- ShopNotice이벤트 발생시,
LocalPlayer:ProcessInputActionEvent("ShopNotice", Enum.KeyInputType.Pressed, function()
   if NoticeCheck == false then
       return
   end
   shop_s:SendEventToServer("StartShopSet") -- shop_s객체의 StartShopSet 서버이벤트를 호출함.
end)


LocalPlayer:ProcessInputActionEvent("EndShopSet", Enum.KeyInputType.Pressed, function()
   if Check == false then
       return
   end
   shop_s:SendEventToServer("EndShopSet")
end)


local function StartSetShop()
   Input:ActiveGroup("ShopSetInput") -- 인풋 이벤트 ShopSetInput 활성화

   NoticeUI:SetVisible(false)
   
   local character = LocalPlayer:GetRemotePlayer():GetCharacter()
   character:AttachAtTop(shop_s, Enum.Bone.LFoot) --플레이어를 지정위치에 고정시킴.
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






