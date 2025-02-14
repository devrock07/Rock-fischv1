#SingleInstance Force
setkeydelay, -1
setmousedelay, -1
setbatchlines, -1
SetTitleMatchMode 2

CoordMode, Tooltip, Relative
CoordMode, Pixel, Relative
CoordMode, Mouse, Relative

;     GENERAL SETTINGS     ====================================================================================================;

; Default settings
AutoLowerGraphics := true
AutoZoomInCamera := true
AutoEnableCameraMode := true
AutoLookDownCamera := true
AutoBlurCamera := true

; Delays
AutoGraphicsDelay := 50
AutoZoomDelay := 50
AutoCameraDelay := 50
AutoLookDelay := 200
AutoBlurDelay := 50

; Other settings
RestartDelay := 600
HoldRodCastDuration := 480
WaitForBobberDelay := 1000
NavigationKey := "\"

;     SHAKE SETTINGS     ====================================================================================================;

ShakeMode := "Click"
ClickShakeFailsafe := 20
ClickShakeColorTolerance := 3
ClickScanDelay := 20
RepeatBypassCounter := 10
NavigationShakeFailsafe := 30
NavigationSpamDelay := 10

;     MINIGAME SETTINGS     ====================================================================================================;

ManualBarSize := 0
BarCalculationFailsafe := 10
BarSizeCalculationColorTolerance := 15
FishBarColorTolerance := 5
WhiteBarColorTolerance := 16
ArrowColorTolerance := 6
StabilizerLoop := 12
SideBarRatio := 0.8
SideBarWaitMultiplier := 3.5
StableRightMultiplier := 2.360
StableRightDivision := 1.550
StableLeftMultiplier := 1.211
StableLeftDivision := 1.12
UnstableRightMultiplier := 2.665
UnstableRightDivision := 1.55
UnstableLeftMultiplier := 2.190
UnstableLeftDivision := 1.17
RightAnkleBreakMultiplier := 1.35
LeftAnkleBreakMultiplier := 0.45

;====================================================================================================;
Gui, +AlwaysOnTop +Resize +ToolWindow  ; Keep the settings window on top and allow resizing
Gui, Color, 0x1E1E1E, 0x252525  ; Slightly brighter dark theme for better contrast
Gui, Font, s10, Segoe UI  ; Modern font

; Header Section
Gui, Add, Text, x10 y10 w270 h30 cWhite Center, Bot Settings
Gui, Add, Text, x10 y40 w270 h20 c0xFFA500 Center, Made by Devrock  ; More visible orange color

; Tabs Section
Gui, Add, Tab3, x10 y70 w270 h220 vMainTab cWhite, Settings|Webhook|Info

; Settings Tab
Gui, Tab, 1
Gui, Add, GroupBox, x15 y100 w250 h140 cWhite, Settings
Gui, Add, CheckBox, x25 y120 vAutoLowerGraphicsChecked Checked%AutoLowerGraphics% c0xFFA500, Auto Lower Graphics
Gui, Add, CheckBox, x25 y140 vAutoZoomInCameraChecked Checked%AutoZoomInCamera% c0xFFA500, Auto Zoom In Camera
Gui, Add, CheckBox, x25 y160 vAutoEnableCameraModeChecked Checked%AutoEnableCamera% c0xFFA500, Auto Enable Camera Mode
Gui, Add, CheckBox, x25 y180 vAutoLookDownCameraChecked Checked%AutoLookDownCamera% c0xFFA500, Auto Look Down Camera
Gui, Add, CheckBox, x25 y200 vAutoBlurCameraChecked Checked%AutoBlurCamera% c0xFFA500, Auto Blur Camera

; Webhook Tab
Gui, Tab, 2
Gui, Add, GroupBox, x15 y100 w250 h100 cWhite, Webhook Settings
Gui, Add, Text, x25 y120 w220 c0xFFA500, Webhook URL (Optional):
Gui, Add, Edit, x25 y140 w230 h20 vWebhookURL cBlack Background0xFFFFFF,
Gui, Add, Button, x85 y170 w120 h30 gTestWebhook cBlack Background0xFFA500, Save Webhook

; Info Tab
Gui, Tab, 3
Gui, Add, GroupBox, x15 y100 w250 h100 cWhite, Information
Gui, Add, Text, x25 y120 w220 cWhite, This bot is developed by Devrock.
Gui, Add, Text, x25 y140 w220 cWhite, For more info, visit:
Gui, Add, Text, x25 y160 w220 c0x1E90FF gOpenGitHub, GitHub Repository

; Buttons Section
Gui, Tab
Gui, Add, Button, x20 y310 w120 h30 gSaveSettings cBlack Background0x32CD32, Save Settings
Gui, Add, Button, x150 y310 w120 h30 gStartBot cBlack Background0x32CD32, Start Bot

Gui, Show, w290 h350, Menu
return

OpenGitHub:
Run, https://github.com/devrock07/Rock-fischv1
return

TestWebhook:
Gui, Submit, NoHide
if (WebhookURL = "") {
    MsgBox, 16, Error, Please enter a webhook URL.
    return
}
SendDiscordMessage("Test", "This is a test message from the bot.")
MsgBox, 64, Success, Webhook test sent successfully!
return

SaveSettings:
Gui, Submit, NoHide
AutoLowerGraphics := AutoLowerGraphicsChecked
AutoZoomInCamera := AutoZoomInCameraChecked
AutoEnableCameraMode := AutoEnableCameraModeChecked
AutoLookDownCamera := AutoLookDownCameraChecked
AutoBlurCamera := AutoBlurCameraChecked

IniWrite, %AutoLowerGraphics%, Settings.ini, Settings, AutoLowerGraphics
IniWrite, %AutoZoomInCamera%, Settings.ini, Settings, AutoZoomInCamera
IniWrite, %AutoEnableCameraMode%, Settings.ini, Settings, AutoEnableCameraMode
IniWrite, %AutoLookDownCamera%, Settings.ini, Settings, AutoLookDownCamera
IniWrite, %AutoBlurCamera%, Settings.ini, Settings, AutoBlurCamera
IniWrite, %WebhookURL%, Settings.ini, Settings, WebhookURL

MsgBox, 64, Success, Settings saved successfully!
return

StartBot:
Gui, Submit, NoHide
AutoLowerGraphics := AutoLowerGraphicsChecked
AutoZoomInCamera := AutoZoomInCameraChecked
AutoEnableCameraMode := AutoEnableCameraModeChecked
AutoLookDownCamera := AutoLookDownCameraChecked
AutoBlurCamera := AutoBlurCameraChecked

Gui, Destroy  ; Close the GUI
;====================================================================================================;

WinActivate, Roblox
if WinActive("Roblox")
{
    WinMaximize, Roblox
}
else
{
    msgbox, where roblox bruh
    exitapp
}

;====================================================================================================;

send {lbutton up}
send {rbutton up}
send {shift up}

;====================================================================================================;

Calculations:
WinGetActiveStats, Title, WindowWidth, WindowHeight, WindowLeft, WindowTop

CameraCheckLeft := WindowWidth/2.8444
CameraCheckRight := WindowWidth/1.5421
CameraCheckTop := WindowHeight/1.28
CameraCheckBottom := WindowHeight

ClickShakeLeft := WindowWidth/4.6545
ClickShakeRight := WindowWidth/1.2736
ClickShakeTop := WindowHeight/9
ClickShakeBottom := WindowHeight/1.3409

FishBarLeft := WindowWidth/3.3160
FishBarRight := WindowWidth/1.4317
FishBarTop := WindowHeight/1.1871
FishBarBottom := WindowHeight/1.1512

FishBarTooltipHeight := WindowHeight/1.0626

ResolutionScaling := 2560/WindowWidth

LookDownX := WindowWidth/2
LookDownY := WindowHeight/4

runtimeS := 0
runtimeM := 0
runtimeH := 0

TooltipX := WindowWidth/20
Tooltip1 := (WindowHeight/2)-(20*9)
Tooltip2 := (WindowHeight/2)-(20*8)
Tooltip3 := (WindowHeight/2)-(20*7)
Tooltip4 := (WindowHeight/2)-(20*6)
Tooltip5 := (WindowHeight/2)-(20*5)
Tooltip6 := (WindowHeight/2)-(20*4)
Tooltip7 := (WindowHeight/2)-(20*3)
Tooltip8 := (WindowHeight/2)-(20*2)
Tooltip9 := (WindowHeight/2)-(20*1)
Tooltip10 := (WindowHeight/2)
Tooltip11 := (WindowHeight/2)+(20*1)
Tooltip12 := (WindowHeight/2)+(20*2)
Tooltip13 := (WindowHeight/2)+(20*3)
Tooltip14 := (WindowHeight/2)+(20*4)
Tooltip15 := (WindowHeight/2)+(20*5)
Tooltip16 := (WindowHeight/2)+(20*6)
Tooltip17 := (WindowHeight/2)+(20*7)
Tooltip18 := (WindowHeight/2)+(20*8)
Tooltip19 := (WindowHeight/2)+(20*9)
Tooltip20 := (WindowHeight/2)+(20*10)

tooltip, Made By Devrock, %TooltipX%, %Tooltip1%, 1
tooltip, Runtime: 0h 0m 0s, %TooltipX%, %Tooltip2%, 2

tooltip, Press "P" to Start, %TooltipX%, %Tooltip4%, 4
tooltip, Press "O" to Reload, %TooltipX%, %Tooltip5%, 5
tooltip, Press "M" to Exit, %TooltipX%, %Tooltip6%, 6

if (AutoLowerGraphics == true)
{
    tooltip, AutoLowerGraphics: true, %TooltipX%, %Tooltip8%, 8
}
else
{
    tooltip, AutoLowerGraphics: false, %TooltipX%, %Tooltip8%, 8
}

if (AutoEnableCameraMode == true)
{
    tooltip, AutoEnableCameraMode: true, %TooltipX%, %Tooltip9%, 9
}
else
{
    tooltip, AutoEnableCameraMode: false, %TooltipX%, %Tooltip9%, 9
}

if (AutoZoomInCamera == true)
{
    tooltip, AutoZoomInCamera: true, %TooltipX%, %Tooltip10%, 10
}
else
{
    tooltip, AutoZoomInCamera: false, %TooltipX%, %Tooltip10%, 10
}

if (AutoLookDownCamera == true)
{
    tooltip, AutoLookDownCamera: true, %TooltipX%, %Tooltip11%, 11
}
else
{
    tooltip, AutoLookDownCamera: false, %TooltipX%, %Tooltip11%, 11
}

if (AutoBlurCamera == true)
{
    tooltip, AutoBlurCamera: true, %TooltipX%, %Tooltip12%, 12
}
else
{
    tooltip, AutoBlurCamera: false, %TooltipX%, %Tooltip12%, 12
}

tooltip, Navigation Key: "%NavigationKey%", %TooltipX%, %Tooltip14%, 14

if (ShakeMode == "Click")
{
    tooltip, Shake Mode: "Click", %TooltipX%, %Tooltip16%, 16
}
else
{
    tooltip, Shake Mode: "Navigation", %TooltipX%, %Tooltip16%, 16
}
return

;====================================================================================================;

runtime:
    runtimeS++
    if (runtimeS >= 60)
    {
        runtimeS := 0
        runtimeM++
    }
    if (runtimeM >= 60)
    {
        runtimeM := 0
        runtimeH++
    }

    tooltip, Runtime: %runtimeH%h %runtimeM%m %runtimeS%s, %TooltipX%, %Tooltip2%, 2

    if (WinExist("ahk_exe RobloxPlayerBeta.exe")) {
        if (!WinActive("ahk_exe RobloxPlayerBeta.exe")) {
            WinActivate
        }
    }
    else {
        exitapp
    }
return

;====================================================================================================;

$o:: reload
$m:: exitapp
$p::

;====================================================================================================;

gosub, Calculations
settimer, runtime, 1000

tooltip, Press "O" to Reload, %TooltipX%, %Tooltip4%, 4
tooltip, Press "M" to Exit, %TooltipX%, %Tooltip5%, 5

tooltip, , , , 6
tooltip, , , , 10
tooltip, , , , 11
tooltip, , , , 12
tooltip, , , , 14
tooltip, , , , 16

tooltip, Current Task: AutoLowerGraphics, %TooltipX%, %Tooltip7%, 7
tooltip, F10 Count: 0/20, %TooltipX%, %Tooltip9%, 9
f10counter := 0
if (AutoLowerGraphics == true)
{
    send {shift}
    tooltip, Action: Press Shift, %TooltipX%, %Tooltip8%, 8
    sleep %AutoGraphicsDelay%
    send {shift down}
    tooltip, Action: Hold Shift, %TooltipX%, %Tooltip8%, 8
    sleep %AutoGraphicsDelay%
    loop, 20
    {
        f10counter++
        tooltip, F10 Count: %f10counter%/20, %TooltipX%, %Tooltip9%, 9
        send {f10}
        tooltip, Action: Press F10, %TooltipX%, %Tooltip8%, 8
        sleep %AutoGraphicsDelay%
    }
    send {shift up}
    tooltip, Action: Release Shift, %TooltipX%, %Tooltip8%, 8
    sleep %AutoGraphicsDelay%
}

tooltip, Current Task: AutoZoomInCamera, %TooltipX%, %Tooltip7%, 7
tooltip, Scroll In: 0/20, %TooltipX%, %Tooltip9%, 9
tooltip, Scroll Out: 0/1, %TooltipX%, %Tooltip10%, 10
scrollcounter := 0
if (AutoZoomInCamera == true)
{
    sleep %AutoZoomDelay%
    loop, 20
    {
        scrollcounter++
        tooltip, Scroll In: %scrollcounter%/20, %TooltipX%, %Tooltip9%, 9
        send {wheelup}
        tooltip, Action: Scroll In, %TooltipX%, %Tooltip8%, 8
        sleep %AutoZoomDelay%
    }
    send {wheeldown}
    tooltip, Scroll Out: 1/1, %TooltipX%, %Tooltip10%, 10
    tooltip, Action: Scroll Out, %TooltipX%, %Tooltip8%, 8
    AutoZoomDelay := AutoZoomDelay*5
    sleep %AutoZoomDelay%
}

tooltip, , , , 10

tooltip, Current Task: AutoEnableCameraMode, %TooltipX%, %Tooltip7%, 7
tooltip, Right Count: 0/10, %TooltipX%, %Tooltip9%, 9
rightcounter := 0
if (AutoEnableCameraMode == true)
{
    PixelSearch, , , CameraCheckLeft, CameraCheckTop, CameraCheckRight, CameraCheckBottom, 0xFFFFFF, 0, Fast
    if (ErrorLevel == 0)
    {
        sleep %AutoCameraDelay%
        send {2}
        tooltip, Action: Presss 2, %TooltipX%, %Tooltip8%, 8
        sleep %AutoCameraDelay%
        send {1}
        tooltip, Action: Press 1, %TooltipX%, %Tooltip8%, 8
        sleep %AutoCameraDelay%
        send {%NavigationKey%}
        tooltip, Action: Press %NavigationKey%, %TooltipX%, %Tooltip8%, 8
        sleep %AutoCameraDelay%
        loop, 10
        {
            rightcounter++
            tooltip, Right Count: %rightcounter%/10, %TooltipX%, %Tooltip9%, 9
            send {right}
            tooltip, Action: Press Right, %TooltipX%, %Tooltip8%, 8
            sleep %AutoCameraDelay%
        }
        send {enter}
        tooltip, Action: Press Enter, %TooltipX%, %Tooltip8%, 8
        sleep %AutoCameraDelay%
    }
}

RestartMacro:

tooltip, , , , 9

tooltip, Current Task: AutoLookDownCamera, %TooltipX%, %Tooltip7%, 7
if (AutoLookDownCamera == true)
{
    send {rbutton up}
    sleep %AutoLookDelay%
    mousemove, LookDownX, LookDownY
    tooltip, Action: Position Mouse, %TooltipX%, %Tooltip8%, 8
    sleep %AutoLookDelay%
    send {rbutton down}
    tooltip, Action: Hold Right Click, %TooltipX%, %Tooltip8%, 8
    sleep %AutoLookDelay%
    DllCall("mouse_event", "UInt", 0x01, "UInt", 0, "UInt", 10000)
    tooltip, Action: Move Mouse Down, %TooltipX%, %Tooltip8%, 8
    sleep %AutoLookDelay%
    send {rbutton up}
    tooltip, Action: Release Right Click, %TooltipX%, %Tooltip8%, 8
    sleep %AutoLookDelay%
    mousemove, LookDownX, LookDownY
    tooltip, Action: Position Mouse, %TooltipX%, %Tooltip8%, 8
    sleep %AutoLookDelay%
}

tooltip, Current Task: AutoBlurCamera, %TooltipX%, %Tooltip7%, 7
if (AutoBlurCamera == true)
{
    sleep %AutoBlurDelay%
    send {m}
    tooltip, Action: Press M, %TooltipX%, %Tooltip8%, 8
    sleep %AutoBlurDelay%
}

tooltip, Current Task: Casting Rod, %TooltipX%, %Tooltip7%, 7
send {lbutton down}
tooltip, Action: Casting For %HoldRodCastDuration%ms, %TooltipX%, %Tooltip8%, 8
sleep %HoldRodCastDuration%
send {lbutton up}
tooltip, Action: Waiting For Bobber (%WaitForBobberDelay%ms), %TooltipX%, %Tooltip8%, 8
sleep %WaitForBobberDelay%

if (ShakeMode == "Click")
    goto ClickShakeMode
else if (ShakeMode == "Navigation")
    goto NavigationShakeMode

;====================================================================================================;

ClickShakeFailsafe:
ClickFailsafeCount++
tooltip, Failsafe: %ClickFailsafeCount%/%ClickShakeFailsafe%, %TooltipX%, %Tooltip14%, 14
if (ClickFailsafeCount >= ClickShakeFailsafe)
{
    settimer, ClickShakeFailsafe, off
    ForceReset := true
}
return

ClickShakeMode:

tooltip, Current Task: Shaking, %TooltipX%, %Tooltip7%, 7
tooltip, Click X: None, %TooltipX%, %Tooltip8%, 8
tooltip, Click Y: None, %TooltipX%, %Tooltip9%, 9

tooltip, Click Count: 0, %TooltipX%, %Tooltip11%, 11
tooltip, Bypass Count: 0/%RepeatBypassCounter%, %TooltipX%, %Tooltip12%, 12

tooltip, Failsafe: 0/%ClickShakeFailsafe%, %TooltipX%, %Tooltip14%, 14

ClickFailsafeCount := 0
ClickCount := 0
ClickShakeRepeatBypassCounter := 0
MemoryX := 0
MemoryY := 0
ForceReset := false

settimer, ClickShakeFailsafe, 1000

ClickShakeModeRedo:
if (ForceReset == true)
{
    tooltip, , , , 11
    tooltip, , , , 12
    tooltip, , , , 14
    goto RestartMacro
}
sleep %ClickScanDelay%
PixelSearch, , , FishBarLeft, FishBarTop, FishBarRight, FishBarBottom, 0x5B4B43, %FishBarColorTolerance%, Fast
if (ErrorLevel == 0)
{
    settimer, ClickShakeFailsafe, off
    tooltip, , , , 9
    tooltip, , , , 11
    tooltip, , , , 12
    tooltip, , , , 14
    goto BarMinigame
}
else
{
    PixelSearch, ClickX, ClickY, ClickShakeLeft, ClickShakeTop, ClickShakeRight, ClickShakeBottom, 0xFFFFFF, %ClickShakeColorTolerance%, Fast
    if (ErrorLevel == 0)
    {
        tooltip, Click X: %ClickX%, %TooltipX%, %Tooltip8%, 8
        tooltip, Click Y: %ClickY%, %TooltipX%, %Tooltip9%, 9

        if (ClickX != MemoryX and ClickY != MemoryY)
        {
            ClickShakeRepeatBypassCounter := 0
            tooltip, Bypass Count: %ClickShakeRepeatBypassCounter%/%RepeatBypassCounter%, %TooltipX%, %Tooltip12%, 12
            ClickCount++
            click, %ClickX%, %ClickY%
            tooltip, Click Count: %ClickCount%, %TooltipX%, %Tooltip11%, 11
            MemoryX := ClickX
            MemoryY := ClickY
            goto ClickShakeModeRedo
        }
        else
        {
            ClickShakeRepeatBypassCounter++
            tooltip, Bypass Count: %ClickShakeRepeatBypassCounter%/%RepeatBypassCounter%, %TooltipX%, %Tooltip12%, 12
            if (ClickShakeRepeatBypassCounter >= RepeatBypassCounter)
            {
                MemoryX := 0
                MemoryY := 0
            }
            goto ClickShakeModeRedo
        }
    }
    else
    {
        goto ClickShakeModeRedo
    }
}

;====================================================================================================;

NavigationShakeFailsafe:
NavigationFailsafeCount++
tooltip, Failsafe: %NavigationFailsafeCount%/%NavigationShakeFailsafe%, %TooltipX%, %Tooltip10%, 10
if (NavigationFailsafeCount >= NavigationShakeFailsafe)
{
    settimer, NavigationShakeFailsafe, off
    ForceReset := true
}
return

NavigationShakeMode:

tooltip, Current Task: Shaking, %TooltipX%, %Tooltip7%, 7
tooltip, Attempt Count: 0, %TooltipX%, %Tooltip8%, 8

tooltip, Failsafe: 0/%NavigationShakeFailsafe%, %TooltipX%, %Tooltip10%, 10

NavigationFailsafeCount := 0
NavigationCounter := 0
ForceReset := false
settimer, NavigationShakeFailsafe, 1000
send {%NavigationKey%}
NavigationShakeModeRedo:
if (ForceReset == true)
{
    tooltip, , , , 10
    goto RestartMacro
}
sleep %NavigationSpamDelay%
PixelSearch, , , FishBarLeft, FishBarTop, FishBarRight, FishBarBottom, 0x5B4B43, %FishBarColorTolerance%, Fast
if (ErrorLevel == 0)
{
    settimer, NavigationShakeFailsafe, off
    goto BarMinigame
}
else
{
    NavigationCounter++
    tooltip, Attempt Count: %NavigationCounter%, %TooltipX%, %Tooltip8%, 8
    sleep 1
    send {s}
    sleep 1
    send {enter}
    goto NavigationShakeModeRedo
}

;====================================================================================================;

BarCalculationFailsafe:
BarCalcFailsafeCounter++
tooltip, Failsafe: %BarCalcFailsafeCounter%/%BarCalculationFailsafe%, %TooltipX%, %Tooltip10%, 10
if (BarCalcFailsafeCounter >= BarCalculationFailsafe)
{
    settimer, BarCalculationFailsafe, off
    ForceReset := true
}
return

BarMinigame:
sleep 600

tooltip, Current Task: Calculating Bar Size, %TooltipX%, %Tooltip7%, 7
tooltip, Bar Size: Not Found, %TooltipX%, %Tooltip8%, 8
tooltip, Failsafe: 0/%BarCalculationFailsafe%, %TooltipX%, %Tooltip10%, 10

ForceReset := false
BarCalcFailsafeCounter := 0
settimer, BarCalculationFailsafe, 1000

BarMinigameRedo:
if (ForceReset == true)
{
    tooltip, , , , 10
    goto RestartMacro
}
PixelSearch, BarX, , FishBarLeft, FishBarTop, FishBarRight, FishBarBottom, 0xFFFFFF, %BarSizeCalculationColorTolerance%, Fast
if (ErrorLevel == 0)
{
    settimer, BarCalculationFailsafe, off
    if (ManualBarSize != 0)
    {
        WhiteBarSize := ManualBarSize
        goto BarMinigameSingle
    }
    WhiteBarSize := (FishBarRight-(BarX-FishBarLeft))-BarX
    goto BarMinigameSingle
}
sleep 1
goto BarMinigameRedo

;====================================================================================================;

BarMinigameSingle:

tooltip, Current Task: Playing Bar Minigame, %TooltipX%, %Tooltip7%, 7
tooltip, Bar Size: %WhiteBarSize%, %TooltipX%, %Tooltip8%, 8

tooltip, Direction: None, %TooltipX%, %Tooltip10%, 10
tooltip, Forward Delay: None, %TooltipX%, %Tooltip11%, 11
tooltip, Counter Delay: None, %TooltipX%, %Tooltip12%, 12
tooltip, Ankle Delay: None, %TooltipX%, %Tooltip13%, 13

tooltip, Side Delay: None, %TooltipX%, %Tooltip15%, 15

HalfBarSize := WhiteBarSize/2
SideDelay := 0
AnkleBreakDelay := 0
DirectionalToggle := "Disabled"
AtLeastFindWhiteBar := false

MaxLeftToggle := false
MaxRightToggle := false
MaxLeftBar := FishBarLeft+WhiteBarSize*SideBarRatio
MaxRightBar := FishBarRight-WhiteBarSize*SideBarRatio

tooltip, |, %MaxLeftBar%, %FishBarTooltipHeight%, 18
tooltip, |, %MaxRightBar%, %FishBarTooltipHeight%, 17

BarMinigame2:
sleep 1
PixelSearch, FishX, , FishBarLeft, FishBarTop, FishBarRight, FishBarBottom, 0x5B4B43, %FishBarColorTolerance%, Fast
if (ErrorLevel == 0)
{
    tooltip, ., %FishX%, %FishBarTooltipHeight%, 20
    if (FishX < MaxLeftBar)
    {
        if (MaxLeftToggle == false)
        {
            tooltip, <, %MaxLeftBar%, %FishBarTooltipHeight%, 19
            tooltip, Direction: Max Left, %TooltipX%, %Tooltip10%, 10
            tooltip, Forward Delay: Infinite, %TooltipX%, %Tooltip11%, 11
            tooltip, Counter Delay: None, %TooltipX%, %Tooltip12%, 12
            tooltip, Ankle Delay: 0, %TooltipX%, %Tooltip13%, 13
            DirectionalToggle := "Right"
            MaxLeftToggle := true
            send {lbutton up}
            sleep 1
            send {lbutton up}
            sleep %SideDelay%
            AnkleBreakDelay := 0
            SideDelay := 0
            tooltip, Side Delay: 0, %TooltipX%, %Tooltip15%, 15
        }
        goto BarMinigame2
    }
    else if (FishX > MaxRightBar)
    {
        if (MaxRightToggle == false)
        {
            tooltip, >, %MaxRightBar%, %FishBarTooltipHeight%, 19
            tooltip, Direction: Max Right, %TooltipX%, %Tooltip10%, 10
            tooltip, Forward Delay: Infinite, %TooltipX%, %Tooltip11%, 11
            tooltip, Counter Delay: None, %TooltipX%, %Tooltip12%, 12
            tooltip, Ankle Delay: 0, %TooltipX%, %Tooltip13%, 13
            DirectionalToggle := "Left"
            MaxRightToggle := true
            send {lbutton down}
            sleep 1
            send {lbutton down}
            sleep %SideDelay%
            AnkleBreakDelay := 0
            SideDelay := 0
            tooltip, Side Delay: 0, %TooltipX%, %Tooltip15%, 15
        }
        goto BarMinigame2
    }
    MaxLeftToggle := false
    MaxRightToggle := false
    PixelSearch, BarX, , FishBarLeft, FishBarTop, FishBarRight, FishBarBottom, 0xFFFFFF, %WhiteBarColorTolerance%, Fast
    if (ErrorLevel == 0)
    {
        AtLeastFindWhiteBar := true
        BarX := BarX+(WhiteBarSize/2)
        if (BarX > FishX)
        {
            tooltip, <, %BarX%, %FishBarTooltipHeight%, 19
            tooltip, Direction: <, %TooltipX%, %Tooltip10%, 10
            Difference := (BarX-FishX)*ResolutionScaling*StableLeftMultiplier
            CounterDifference := Difference/StableLeftDivision
            tooltip, Forward Delay: %Difference%, %TooltipX%, %Tooltip11%, 11
            tooltip, Counter Delay: %CounterDifference%, %TooltipX%, %Tooltip12%, 12
            send {lbutton up}
            if (DirectionalToggle == "Right")
            {
                tooltip, Ankle Delay: 0, %TooltipX%, %Tooltip13%, 13
                sleep %AnkleBreakDelay%
                AnkleBreakDelay := 0
            }
            else
            {
                AnkleBreakDelay := AnkleBreakDelay+(Difference-CounterDifference)*LeftAnkleBreakMultiplier
                SideDelay := AnkleBreakDelay/LeftAnkleBreakMultiplier*SideBarWaitMultiplier
                tooltip, Ankle Delay: %AnkleBreakDelay%, %TooltipX%, %Tooltip13%, 13
                tooltip, Side Delay: %SideDelay%, %TooltipX%, %Tooltip15%, 15
            }
            sleep %Difference%
            PixelSearch, FishX, , FishBarLeft, FishBarTop, FishBarRight, FishBarBottom, 0x5B4B43, %FishBarColorTolerance%, Fast
            {
                if (FishX < MaxLeftBar)
                goto BarMinigame2
            }
            send {lbutton down}
            sleep %CounterDifference%
            loop, %StabilizerLoop%
            {
                send {lbutton down}
                send {lbutton up}
            }
            DirectionalToggle := "Left"
        }
        else
        {
            tooltip, >, %BarX%, %FishBarTooltipHeight%, 19
            tooltip, Direction: >, %TooltipX%, %Tooltip10%, 10
            Difference := (FishX-BarX)*ResolutionScaling*StableRightMultiplier
            CounterDifference := Difference/StableRightDivision
            tooltip, Forward Delay: %Difference%, %TooltipX%, %Tooltip11%, 11
            tooltip, Counter Delay: %CounterDifference%, %TooltipX%, %Tooltip12%, 12
            send {lbutton down}
            if (DirectionalToggle == "Left")
            {
                tooltip, Ankle Delay: 0, %TooltipX%, %Tooltip13%, 13
                sleep %AnkleBreakDelay%
                AnkleBreakDelay := 0
            }
            else
            {
                AnkleBreakDelay := AnkleBreakDelay+(Difference-CounterDifference)*RightAnkleBreakMultiplier
                SideDelay := AnkleBreakDelay/RightAnkleBreakMultiplier*SideBarWaitMultiplier
                tooltip, Ankle Delay: %AnkleBreakDelay%, %TooltipX%, %Tooltip13%, 13
                tooltip, Side Delay: %SideDelay%, %TooltipX%, %Tooltip15%, 15
            }
            sleep %Difference%
            PixelSearch, FishX, , FishBarLeft, FishBarTop, FishBarRight, FishBarBottom, 0x5B4B43, %FishBarColorTolerance%, Fast
            {
                if (FishX > MaxRightBar)
                goto BarMinigame2
            }
            send {lbutton up}
            sleep %CounterDifference%
            loop, %StabilizerLoop%
            {
                send {lbutton down}
                send {lbutton up}
            }
            DirectionalToggle := "Right"
        }
    }
    else
    {
        if (AtLeastFindWhiteBar == false)
        {
            send {lbutton down}
            send {lbutton up}
            goto BarMinigame2
        }
        PixelSearch, ArrowX, , FishBarLeft, FishBarTop, FishBarRight, FishBarBottom, 0x878584, %ArrowColorTolerance%, Fast
        if (ArrowX > FishX)
        {
            tooltip, <, %ArrowX%, %FishBarTooltipHeight%, 19
            tooltip, Direction: <<<, %TooltipX%, %Tooltip10%, 10
            Difference := HalfBarSize*UnstableLeftMultiplier
            CounterDifference := Difference/UnstableLeftDivision
            tooltip, Forward Delay: %Difference%, %TooltipX%, %Tooltip11%, 11
            tooltip, Counter Delay: %CounterDifference%, %TooltipX%, %Tooltip12%, 12
            send {lbutton up}
            if (DirectionalToggle == "Right")
            {
                tooltip, Ankle Delay: 0, %TooltipX%, %Tooltip13%, 13
                sleep %AnkleBreakDelay%
                AnkleBreakDelay := 0
            }
            else
            {
                AnkleBreakDelay := AnkleBreakDelay+(Difference-CounterDifference)*LeftAnkleBreakMultiplier
                SideDelay := AnkleBreakDelay/LeftAnkleBreakMultiplier*SideBarWaitMultiplier
                tooltip, Ankle Delay: %AnkleBreakDelay%, %TooltipX%, %Tooltip13%, 13
                tooltip, Side Delay: %SideDelay%, %TooltipX%, %Tooltip15%, 15
            }
            sleep %Difference%
            PixelSearch, FishX, , FishBarLeft, FishBarTop, FishBarRight, FishBarBottom, 0x5B4B43, %FishBarColorTolerance%, Fast
            {
                if (FishX < MaxLeftBar)
                goto BarMinigame2
            }
            send {lbutton down}
            sleep %CounterDifference%
            loop, %StabilizerLoop%
            {
                send {lbutton down}
                send {lbutton up}
            }
            DirectionalToggle := "Left"
        }
        else
        {
            tooltip, >, %ArrowX%, %FishBarTooltipHeight%, 19
            tooltip, Direction: >>>, %TooltipX%, %Tooltip10%, 10
            Difference := HalfBarSize*UnstableRightMultiplier
            CounterDifference := Difference/UnstableRightDivision
            tooltip, Forward Delay: %Difference%, %TooltipX%, %Tooltip11%, 11
            tooltip, Counter Delay: %CounterDifference%, %TooltipX%, %Tooltip12%, 12
            send {lbutton down}
            if (DirectionalToggle == "Left")
            {
                tooltip, Ankle Delay: 0, %TooltipX%, %Tooltip13%, 13
                sleep %AnkleBreakDelay%
                AnkleBreakDelay := 0
            }
            else
            {
                AnkleBreakDelay := AnkleBreakDelay+(Difference-CounterDifference)*RightAnkleBreakMultiplier
                               SideDelay := AnkleBreakDelay/RightAnkleBreakMultiplier*SideBarWaitMultiplier
                tooltip, Ankle Delay: %AnkleBreakDelay%, %TooltipX%, %Tooltip13%, 13
                tooltip, Side Delay: %SideDelay%, %TooltipX%, %Tooltip15%, 15
            }
            sleep %Difference%
            PixelSearch, FishX, , FishBarLeft, FishBarTop, FishBarRight, FishBarBottom, 0x5B4B43, %FishBarColorTolerance%, Fast
            {
                if (FishX > MaxRightBar)
                goto BarMinigame2
            }
            send {lbutton up}
            sleep %CounterDifference%
            loop, %StabilizerLoop%
            {
                send {lbutton down}
                send {lbutton up}
            }
            DirectionalToggle := "Right"
        }
    }
    goto BarMinigame2
}
else
{
    tooltip, , , , 10
    tooltip, , , , 11
    tooltip, , , , 12
    tooltip, , , , 13
    tooltip, , , , 15
    tooltip, , , , 17
    tooltip, , , , 18
    tooltip, , , , 19
    tooltip, , , , 20
		TotalCaught++
		if (WebhookURL != "") {
			SendDiscordMessage("caught", "Successfully caught fish")
		}
    sleep %RestartDelay%
    goto RestartMacro
}

;====================================================================================================;
SendDiscordMessage(type, text) {
    global TotalCaught, TotalLost, WebhookURL, runtimeH, runtimeM, runtimeS, LastTime
    TotalFish := TotalCaught + TotalLost
    Time := (runtimeH * 3600) + (runtimeM * 60) + runtimeS - 1
    CurrentReelTime := (Max(Time - LastTime, 0) > 1) ? Max(Time - LastTime, 0) : 0
    LastTime := Time

    fields := "["
    fields .= "{""name"": ""Fish " . type . """, ""value"": ""Took " . CurrentReelTime . " seconds"", ""inline"": true},"
    fields .= "{""name"": ""Runtime"", ""value"": """ . runtimeH . "h " . runtimeM . "m " . runtimeS . "s"", ""inline"": true}"
    fields .= "]"

    authorJSON := "{""name"": ""Fischv1"", ""icon_url"": ""https://i.ibb.co/HDJ9VxQJ/pfp.png""}"

    embedJSON := "{"
    embedJSON .= """id"": 0,"
    embedJSON .= """title"": ""Fisch Notification"","
    embedJSON .= """description"": """ . text . ""","
    embedJSON .= """color"": 14172498,"
    embedJSON .= """fields"": " . fields . ","
    embedJSON .= """author"": " . authorJSON
    embedJSON .= "}"

    postdata := "{"
    postdata .= """content"": """","
    postdata .= """tts"": false,"
    postdata .= """embeds"": [" . embedJSON . "],"
    postdata .= """components"": [],"
    postdata .= """actions"": {},"
    postdata .= """username"": ""Fisch"","
    postdata .= """avatar_url"": ""https://i.ibb.co/HDJ9VxQJ/pfp.png"""
    postdata .= "}"

    try {
        WebRequest := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    } catch {
        MsgBox, 16, Error, WinHttp.WinHttpRequest.5.1 is not available on this system.
        ExitApp
    }
    WebRequest.Open("POST", WebhookURL, false)
    WebRequest.SetRequestHeader("Content-Type", "application/json")

    try {
        WebRequest.Send(postdata)
    } catch {
        MsgBox, 16, Error, Failed to send webhook. Please check the webhook URL and try again.
    }
}

;====================================================================================================;

GuiClose:
ExitApp

;====================================================================================================;

; Watermark 1
; Watermark 2
; Watermark 3