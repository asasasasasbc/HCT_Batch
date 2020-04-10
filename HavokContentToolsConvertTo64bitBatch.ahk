#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
CoordMode, Mouse, Window ; Place ToolTips at absolute screen coordinates.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



; Quick add a hkx file into the scene by pressing ctrl + a
^a::
Click, 30, 46  ; Open the file
Sleep, 200
Click, 54, 91
return


; Ctrl + o : open do the batch things that massively convert hkx files (approximately 5.8s per file)
^o::
MsgBox Choose the folder that contains the hkx files that you want to convert:
FileSelectFolder, WhichFolder  ; Ask the user to pick a folder.
Loop Files,  %WhichFolder%\*.*, R  ; Recurse into subfolders.
{
    ; MsgBox, 4, , Filename = %A_LoopFileFullPath%`n`nContinue?
    ; IfMsgBox, No
      ;  break
Sleep, 200
Click, 30, 46  ; Open the file inside the folder
Sleep, 200
Click, 54, 91
Sleep, 200
Send %A_LoopFileFullPath%

Sleep, 100
Send {Enter}
Sleep, 1200
Click, 30, 46 ; File
Sleep, 200
Click, 62, 110 ; Save
Sleep, 200
Click, 300, 73 ; Click the Format button
Sleep, 200
Click, 227, 143 ; Choose the XML format. You can change the 91 to 108 to make it a win32 format, or 143 to make it a AMD 64 bit format.
Sleep, 200
Click, 371, 51 ; Browse
Sleep, 200
Send %A_LoopFileFullPath%` ; Paste the name.
Send .xml ; add ending name
Sleep, 200
Send {Tab}
Sleep, 20
Send {Down}
Sleep, 20
Send {Up}
Sleep, 20
Send {Enter}
Sleep, 50
Send !s
Sleep, 200

Send {Tab} ; Browse Save to file again
Sleep, 20
Send {Tab}
Sleep, 20
Send {Tab}
Sleep, 20
Send {Tab}
Sleep, 20
Send {Enter} ; Click OK
Sleep, 1500
Click, 1100, 500 ; Delete old hkx file in the scene	
Sleep, 50
Send {Down}
Sleep, 20
Send {Down}
Sleep, 20
Click, right, 1100, 500
Sleep, 50
Click, right, 1144, 551


}
return

; ESC: terminate the script immediately.
Esc::ExitApp
/* End*/
