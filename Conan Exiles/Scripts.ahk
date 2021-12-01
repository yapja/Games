#IfWinActive ahk_exe ConanSandbox.exe
#MaxThreadsPerHotkey 2
Toggle := 0

F5::
CoordMode, Pixel, Client
Send, {i}
Send, {Shift down}

;Remove bombs from hotbar
Loop
{
    ImageSearch, PosX, PosY, 755, 1305, 1800, 1425, *80 Used_Bomb.png
    If (ErrorLevel = 0)
    {
        MouseClick, Left, PosX, PosY, 1, 0
    }
    else
    {
        break
    }
}

;Add bombs from inventory
Loop
{
    ImageSearch, PosX, PosY, 760, 1320, 1800, 1390, *30 Empty.png
    If (ErrorLevel = 0)
    {
        ImageSearch, PosX, PosY, 122, 331, 545, 540, *80 New_Bomb.png
        if (ErrorLevel = 0)
            MouseClick, Left, PosX, PosY, 1, 0
        else
            break
    }
    else
    {
        break
    }
}

Send, {Shift up}
Send, {i}
Return

F6::
CoordMode, Pixel, Client
Send, {i}
ImageSearch, PosX, PosY, 120, 330, 545, 845, *80 Reaper.png
If (ErrorLevel = 0) ;Has Reaper Poison
{
    Hotbar := 815
    StartX := 760
    EndX := 870
    Loop, 8
    {
        ImageSearch, PosX2, PosY2, StartX, 1305, EndX, 1425, *30 Empty.png
        if (ErrorLevel = 1) ;Slot is not empty
        {
            MouseClickDrag, L, PosX, PosY, Hotbar, 1350, 5
        }

        Hotbar := Hotbar + 135
        StartX := StartX + 135
        EndX := EndX + 135
    }
}
else
    MsgBox, No Found
Send, {i}
Return

F7::
CoordMode, Pixel, Client
MouseClick, Left, 640, 1210, 1, 0
Sleep 50
MouseClick, Left, 640, 1040, 1, 0
Sleep 50
MouseClick, Left, 1765, 265, 1, 0
Sleep 50
Send, {Left}
Sleep 50
MouseClick, Left, 1765, 265, 1, 0
Sleep 50
Send, {Left}
Sleep 50
MouseClick, Left, 1765, 265, 1, 0
Sleep 50
Send, {Left}
Sleep 50
MouseClick, Left, 1765, 265, 1, 0
Sleep 50
Send, {Left}
Sleep 50
MouseClick, Left, 1765, 265, 1, 0
Sleep 50
MouseClick, Left, 1570, 1295, 1, 0
Sleep 50
MouseClick, Left, 1950, 1295, 1, 0
Sleep 50
Return

F8::
CoordMode, Pixel, Client
Toggle := !Toggle
While (Toggle)
{
    Send, {Esc}
    Sleep 50
    MouseClick, Left, 1470, 450, 1, 0
    Sleep 50
    Send, {Enter}
    Sleep 50
}
Return

F9::
CoordMode, Pixel, Client
Toggle := !Toggle
While (Toggle)
{
    Send, {E down}
    Sleep 500
    Send, {E up}
    ImageSearch, PosX, PosY, 850, 680, 910, 730, *100 Dismantle.png
    Sleep 300
    if (ErrorLevel = 1  )
    {
        MouseClick, Left, 880, 720, 1, 0
    }
    Sleep 100
}
Return

F10::
CoordMode, Pixel, Client
Toggle := !Toggle
While (Toggle)
{
    MouseClickDrag, L, 1043, 373, 849, 373
}
Return


F4::Reload
