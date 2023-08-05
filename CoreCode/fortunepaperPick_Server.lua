--오미쿠지샵
local shop_s = Script.Parent
local Owner = nil

local function StartShopSet(player) 
    if Owner ~= nil then
       return
    end
    
    Owner = player:GetCharacter()
    shop_s:SendEventToClient(player:GetPlayerName(), "StartSetShopClient")
    shop_s:BroadcastEvent("IsCharacterShopSet", true)
    Game:SendEventToClient(player:GetPlayerName(), "itemattach", 2)
    Game:SendEventToClient(player:GetPlayerName(),"IsPressedforShop")
    wait(10)
    Game:SendEventToClient(player:GetPlayerName(), "FillStart", 2)
    
end
shop_s:ConnectEventFunction("StartShopSet", StartShopSet)


local function EndShopSet(player)
   if Owner ~= player:GetCharacter() then
       return
   end
   player:GetCharacter():Detach()
   shop_s:SendEventToClient(player:GetPlayerName(), "EndShopSetClient")
   shop_s:BroadcastEvent("IsCharacterShopSet", false)
   Game:SendEventToClient(player:GetPlayerName(), "itemattach", 2)
   wait(1)
   
   Owner = nil

end
shop_s:ConnectEventFunction("EndShopSet", EndShopSet)





