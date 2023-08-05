--운세쪽지끈
local mess = Script.Parent
local CheckCollider = mess.CheckCollider
local NoticeUI = mess.Parent.NoticeUI
NoticeUI:SetVisible(false)

local CharacterSetting = Toybox.CharacterSetting
if CharacterSetting == nil then 
   CharacterSetting = Workspace.Character
end

local Laugh = CharacterSetting.Laugh
local Idle = CharacterSetting.Idle

local NoticeCheck = false
local Check = false

local function EnablePressUI(self, target)
    if target == nil or not target:IsCharacter() then
        return
    end

    if NoticeCheck == false and Check == false then
        Input:AddGroup("messageInput")
        Input:AddActionKeyEvent("messageInput", "EndMessSet", Enum.Key.SpaceBar)

        Input:AddGroup("messNoticeInput")
        Input:AddActionKeyEvent("messNoticeInput", "MessNotice", Enum.Key.F)
   
        NoticeCheck = true
        Input:ActiveGroup("messNoticeInput")
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
        Input:RemoveGroup("messNoticeInput")
        Input:RemoveGroup("messageInput")
        NoticeUI:SetVisible(false)
    end
end
CheckCollider.OnEndOverlapEvent:Connect(DisablePressUI)

LocalPlayer:ProcessInputActionEvent("EndMessSet", Enum.KeyInputType.Pressed, function()
   if Check == false then
       return
   end
   mess:SendEventToServer("EndMessSet")
end)

LocalPlayer:ProcessInputActionEvent("MessNotice", Enum.KeyInputType.Pressed, function()
   if NoticeCheck == false then
       return
   end
   mess:SendEventToServer("StartMessSet")
end)

local function StartMessSet()
   Input:ActiveGroup("messageInput")
   
   NoticeUI:SetVisible(false)
   
   local character = LocalPlayer:GetRemotePlayer():GetCharacter()
   character:AttachAtTop(mess, Enum.Bone.LFoot)
   character:ChangeAnimState(Laugh)
   wait(2)
   character:ChangeAnimState(Idle)

end
mess:ConnectEventFunction("StartSetMessClient", StartMessSet)

local function EndMessSet()
   local character = LocalPlayer:GetRemotePlayer():GetCharacter()
   character:ChangeAnimState(Idle, 0.001)
   NoticeUI:SetVisible(true)
   
end
mess:ConnectEventFunction("EndMessSetClient", EndMessSet)

local function IsCharacterMessSet(bool)
   Check = bool
end
mess:ConnectEventFunction("IsCharacterMessSet", IsCharacterMessSet)

