--운세쪽지끈
local mess = Script.Parent
local Owner = nil
local Item_num = 0

local function SetItem_message(player, id)
    Item_num = id
end
Game:ConnectEventFunction("SetItem", SetItem_message)

local function StartMessSet(player)
   if Item_num == 5  then
        if Owner ~= nil then
           return
        end
      
        Owner = player:GetCharacter()
        mess:SendEventToClient(player:GetPlayerName(), "StartSetMessClient")
        mess:BroadcastEvent("IsCharacterMessSet", true)
        Game:SendEventToClient(player:GetPlayerName(), "IsDoubleButton2")
     end
end
mess:ConnectEventFunction("StartMessSet", StartMessSet)

local function EndMessSet(player)
   if Owner ~= player:GetCharacter() then
       return
   end
   
   player:GetCharacter():Detach()
   mess:SendEventToClient(player:GetPlayerName(), "EndMessSetClient")
   mess:BroadcastEvent("IsCharacterMessSet", false)
   Game:SendEventToClient(player:GetPlayerName(), "itemattach", 5)
   wait(1)
   Owner = nil
end
mess:ConnectEventFunction("EndMessSet", EndMessSet)




