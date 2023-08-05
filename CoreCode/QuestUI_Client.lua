 --Quest UI
--Qust UI의 돋보기 클릭시, 세부 정보
--미션 수행시, 노란별 
--미션 모두 수행시, AfterStartTeleport_Server 호출
local ButtonUI1 = Script.Parent.ScreenUI.Button1_1
local ButtonUI2 = Script.Parent.ScreenUI.Button2_1
local ButtonUI3 = Script.Parent.ScreenUI.Button3_1
local ButtonUI4 = Script.Parent.ScreenUI.Button4_1
local ButtonUI5 = Script.Parent.ScreenUI.Button5_1
local Button_cancle = Script.Parent.ScreenUI.Button_cancle

local MissionUI1 = Script.Parent.ScreenUI.TextBox1
local MissionUI2 = Script.Parent.ScreenUI.TextBox2
local MissionUI3 = Script.Parent.ScreenUI.TextBox3
local MissionUI4 = Script.Parent.ScreenUI.TextBox4
local MissionUI5 = Script.Parent.ScreenUI.TextBox5

local emptystar1 = Script.Parent.ScreenUI.emptystar1
local emptystar2 = Script.Parent.ScreenUI.emptystar2
local emptystar3 = Script.Parent.ScreenUI.emptystar3
local emptystar4 = Script.Parent.ScreenUI.emptystar4
local emptystar5 = Script.Parent.ScreenUI.emptystar5

local filledstar1 = Script.Parent.ScreenUI.filledstar1
local filledstar2 = Script.Parent.ScreenUI.filledstar2
local filledstar3 = Script.Parent.ScreenUI.filledstar3
local filledstar4 = Script.Parent.ScreenUI.filledstar4
local filledstar5 = Script.Parent.ScreenUI.filledstar5

local Hidden_Quest = Script.Parent.Quest_ClearUI.Hidden_Quest

local Sound = Script.Parent.Reload_Heavy
local Quest_Check1 = 0
local Quest_Check2 = 0
local Quest_Check3 = 0
local Quest_Check4 = 0
local Quest_Check5 = 0
local Quest_ClearUI = Script.Parent.Quest_ClearUI.Quest_Clear
local QuestUI_OK = Quest_ClearUI.Quest_Button_OK
local QuestUI_NO = Quest_ClearUI.Quest_Button_NO
local i = 1
local Hidden_Quest_Check = false
local Complete = Script.Parent.Quest_ClearUI.Complete

MissionUI1:SetVisible(false)
MissionUI2:SetVisible(false)
MissionUI3:SetVisible(false)
MissionUI4:SetVisible(false)
MissionUI5:SetVisible(false)
filledstar1:SetVisible(false)
filledstar2:SetVisible(false)
filledstar3:SetVisible(false)
filledstar4:SetVisible(false)
filledstar5:SetVisible(false)

-- QuestUI의 돋보기 클릭
local function PressEvent1(self) 
    Sound:Play()
    MissionUI2:SetVisible(false)
    MissionUI1:SetVisible(false)
    MissionUI3:SetVisible(false)
    MissionUI4:SetVisible(false)
    MissionUI5:SetVisible(false)
    Button_cancle:SetVisible(false)
    if i == 0 then
        MissionUI1:SetVisible(true)
        Button_cancle:SetVisible(true)
        i = 1
    else
        i = 0
    end
end

ButtonUI1.OnPressEvent:Connect(PressEvent1) 

local function PressEvent2(self) 
    Sound:Play()
    MissionUI2:SetVisible(false)
    MissionUI1:SetVisible(false)
    MissionUI3:SetVisible(false)
    MissionUI4:SetVisible(false)
    MissionUI5:SetVisible(false)
    Button_cancle:SetVisible(false)
    if i == 0 then
        MissionUI2:SetVisible(true)
        Button_cancle:SetVisible(true)
        i = 1
    else
        i = 0
    end
end

ButtonUI2.OnPressEvent:Connect(PressEvent2) 

local function PressEvent3(self) 
    Sound:Play()
    MissionUI2:SetVisible(false)
    MissionUI1:SetVisible(false)
    MissionUI3:SetVisible(false)
    MissionUI4:SetVisible(false)
    MissionUI5:SetVisible(false)
    Button_cancle:SetVisible(false)
    if i == 0 then
        MissionUI3:SetVisible(true)
        Button_cancle:SetVisible(true)
        i = 1
    else
        i = 0
    end
end

ButtonUI3.OnPressEvent:Connect(PressEvent3) 

local function PressEvent4(self) 
    Sound:Play()
    MissionUI2:SetVisible(false)
    MissionUI1:SetVisible(false)
    MissionUI3:SetVisible(false)
    MissionUI4:SetVisible(false)
    MissionUI5:SetVisible(false)
    Button_cancle:SetVisible(false)
    if i == 0 then
        MissionUI4:SetVisible(true)
        Button_cancle:SetVisible(true)
        i = 1
    else
        i = 0
    end
end

ButtonUI4.OnPressEvent:Connect(PressEvent4)

local function PressEvent5(self) 
    Sound:Play()
    MissionUI2:SetVisible(false)
    MissionUI1:SetVisible(false)
    MissionUI3:SetVisible(false)
    MissionUI4:SetVisible(false)
    MissionUI5:SetVisible(false)
    Button_cancle:SetVisible(false)
    if i == 0 then
        MissionUI5:SetVisible(true)
        Button_cancle:SetVisible(true)
        i = 1
    else
        i = 0
    end
end

ButtonUI5.OnPressEvent:Connect(PressEvent5)

local function PressEvent5(self)
    Sound:Play()
     Button_cancle:SetVisible(false)
     MissionUI1:SetVisible(false)
     MissionUI2:SetVisible(false)
     MissionUI3:SetVisible(false)
     MissionUI4:SetVisible(false)
     MissionUI5:SetVisible(false)
     i = 0
 end   

Button_cancle.OnPressEvent:Connect(PressEvent5)
                
-- 모든 미션 수행, 판별                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
local function Fill_All()
    if Quest_Check1 * Quest_Check2 * Quest_Check3 * Quest_Check4 * Quest_Check5 == 1 then
        wait(10)
        Complete:SetVisible(true)
        Quest_ClearUI:SetVisible(true)
        Hidden_Quest:SetVisible(true)
        Hidden_Quest_Check = true
    end
end

local PassButton = Script.Parent.ScreenUI.Button

local function PressEvent6(self)
    FillStart(1)
    FillStart(2)
    FillStart(3)
    FillStart(4)
    FillStart(5)
end
PassButton.OnPressEvent:Connect(PressEvent6)
    

-- 미션 수행시, 노란별
function FillStart(id)
    if id == 1  then
        filledstar1:SetVisible(true)
        Quest_Check1 = 1
        Fill_All() -- 모든 미션이 수행됐는지 판별
    elseif id == 2 then
        filledstar2:SetVisible(true)
        Quest_Check2 = 1
        Fill_All()
    elseif id == 3 then
        filledstar3:SetVisible(true)  
        Quest_Check3 = 1
        Fill_All()     
    elseif id == 4 then
        filledstar4:SetVisible(true)      
        Quest_Check4 = 1
        Fill_All()  
    elseif id == 5 then
        filledstar5:SetVisible(true)      
        Quest_Check5 = 1
        Fill_All()  
    else 
        --print("오류")
    end
end

Game:ConnectEventFunction("FillStart", FillStart)

--미션 모두 수행시, 나타나는 ui
local function ClearUI_Off(self)
    Quest_ClearUI:SetVisible(false)
    Hidden_Quest_Check = false
end

QuestUI_NO.OnPressEvent:Connect(ClearUI_Off)

local function ClearUI_On(self)
    Quest_ClearUI:SetVisible(false)
    Hidden_Quest_Check = false
    Game:SendEventToServer("ClearTP")
end
QuestUI_OK.OnPressEvent:Connect(ClearUI_On)            
    
    
local function Hidden_Quest_OnOff(self)
    if Hidden_Quest_Check == false then
        Quest_ClearUI:SetVisible(true)
        Hidden_Quest_Check = true
    else
        Quest_ClearUI:SetVisible(false)
        Hidden_Quest_Check = false
    end
end

Hidden_Quest.OnPressEvent:Connect(Hidden_Quest_OnOff)

   














