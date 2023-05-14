#include <GUIConstantsEx.au3>
#include <ButtonConstants.au3>
#include <ProgressConstants.au3>
#NoTrayIcon
#RequireAdmin
AutoItSetOption("WinTitleMatchMode", 2)
Local $nCh1, $nCh0, $nCh7, $nCh8, $nCh9, $nCh2, $nCh3, $nCh4, $nCh5, $nCh6, $msg, $radio_1, $radio_2, $radio_3, $radio_4, $radio_5, $button_1, $button_2, $button_3, $progressbar1, $lbl, $sPath, $lbl2, $lbl3, $lbl4, $hWnd2
Local $razmer, $free, $lbl5
Local $arch = @CPUArch
Local $OS = @OSVersion
Func Example()
   GUISetBkColor(0x32a827)
    GUIStartGroup()
    $radio_1 = GUICtrlCreateRadio("Ничего", 10, 10, 70, 20) ; символ после амперсанда & позволяет сделать выбор
    $radio_2 = GUICtrlCreateRadio("Кружок", 10, 35, 120, 20)
    $radio_3 = GUICtrlCreateRadio("Школа", 10, 60, 60, 20)
    $radio_4 = GUICtrlCreateRadio("Установить всё", 10, 85, 180, 20)
    $radio_5 = GUICtrlCreateRadio("Самостоятельный выбор", 10, 110, 200, 20)
    GUIStartGroup()
    $sPath = @ProgramFilesDir & '\Robbo'
    $nCh0 = GUICtrlCreateCheckbox("Robboscracth 3", 600, 10, 120, 20)
    $nCh1 = GUICtrlCreateCheckbox("RobboJunior", 600, 40, 120, 20)
    $nCh2 = GUICtrlCreateCheckbox("ArduBlock + Arduino IDE 1.0.5", 600, 70, 180, 20)
    $nCh3 = GUICtrlCreateCheckbox("Arduino IDE 1.8.9", 600, 100, 120, 20)
    $nCh4 = GUICtrlCreateCheckbox("Processing", 600, 130, 120, 20)
    $nCh5 = GUICtrlCreateCheckbox("FreeCAD", 600, 160, 120, 20)
    $nCh6 = GUICtrlCreateCheckbox("Gcompris", 600, 190, 120, 20)
	$nCh7 = GUICtrlCreateCheckbox("UnityHub + VSCode", 600, 220, 120, 20)
	$nCh8 = GUICtrlCreateCheckbox("Repieter-Host", 600, 250, 120, 20)
	$nCh9 = GUICtrlCreateCheckbox("Inkscape", 600, 280, 120, 20)
    $button_1 = GUICtrlCreateButton("Начать установку", 250, 310, 300,60)
	$button_3 = GUICtrlCreateButton("Помощь!", 350, 200, 100, 100)
	$button_2 = GUICtrlCreateButton("Выберете папку для установки", 50, 200, 100, 100, $BS_ICON + $BS_FLAT)
    GUICtrlSetImage(-1, "shell32.dll", 46, 1)
	GUICtrlSetState($radio_1, $GUI_CHECKED)
    GUICtrlSetState($nCh1,$GUI_HIDE)
	GUICtrlSetState($nCh2,$GUI_HIDE)
	GUICtrlSetState($nCh3,$GUI_HIDE)
	GUICtrlSetState($nCh4,$GUI_HIDE)
	GUICtrlSetState($nCh5,$GUI_HIDE)
	GUICtrlSetState($nCh6,$GUI_HIDE)
	GUICtrlSetState($nCh0,$GUI_HIDE)
	GUICtrlSetState($nCh7,$GUI_HIDE)
	GUICtrlSetState($nCh8,$GUI_HIDE)
	GUICtrlSetState($nCh9,$GUI_HIDE)
	GUICtrlCreateLabel('Выберите папку для установки', 10, 150)
	$lbl = GUICtrlCreateLabel('Текущая: ' & $sPath, 10, 180)
	$lbl2 = GUICtrlCreateLabel('Сейчас устаналивается: ', 100, 500)
	$lbl3 = GUICtrlCreateLabel('Для текущей конфигурации установки необходимо места: 0' , 200, 20)
	$lbl5 = GUICtrlCreateLabel('У вас: ' & $OS & ' ' &$arch , 200, 80)
    $free =  Round(DriveSpaceFree("c:"))
	$lbl4 = GUICtrlCreateLabel('Свободно места на диске: ' & Round(DriveSpaceFree("c:")) & " Мб", 200, 50)
	$progressbar1 = GUICtrlCreateProgress(50, 450, 700, 20)
 EndFunc
 Func chet()
	If ($arch="x64") Then
	  $razmer = ((GUICtrlRead($nCh0) = $GUI_CHECKED) ? (418):(0))+((GUICtrlRead($nCh1) = $GUI_CHECKED) ? (359):(0))+((GUICtrlRead($nCh2) = $GUI_CHECKED) ? (256):(0))+((GUICtrlRead($nCh3) = $GUI_CHECKED) ? (481):(0))+((GUICtrlRead($nCh4) = $GUI_CHECKED) ? (259):(0))+((GUICtrlRead($nCh5) = $GUI_CHECKED) ? (1800):(0))+((GUICtrlRead($nCh6) = $GUI_CHECKED) ? (201):(0))+((GUICtrlRead($nCh7) = $GUI_CHECKED) ? (435):(0))+((GUICtrlRead($nCh8) = $GUI_CHECKED) ? (176):(0))+((GUICtrlRead($nCh9) = $GUI_CHECKED) ? (276):(0))
    elseif $arch = "X86" Then
	  $razmer = ((GUICtrlRead($nCh0) = $GUI_CHECKED) ? (414):(0))+((GUICtrlRead($nCh1) = $GUI_CHECKED) ? (326):(0))+((GUICtrlRead($nCh2) = $GUI_CHECKED) ? (256):(0))+((GUICtrlRead($nCh3) = $GUI_CHECKED) ? (481):(0))+((GUICtrlRead($nCh4) = $GUI_CHECKED) ? (242):(0))+((GUICtrlRead($nCh5) = $GUI_CHECKED) ? (795):(0))+((GUICtrlRead($nCh6) = $GUI_CHECKED) ? (201):(0))+((GUICtrlRead($nCh7) = $GUI_CHECKED) ? (0):(0))+((GUICtrlRead($nCh8) = $GUI_CHECKED) ? (164):(0))+((GUICtrlRead($nCh9) = $GUI_CHECKED) ? (271):(0))
    EndIf
	$lbl3 = GUICtrlCreateLabel('Для текущей конфигурации установки необходимо места: ' & $razmer & ' Мб          ', 200, 20)
 EndFunc
GUICreate("РоббоИнсталятор",800,600) ; Создаёт окно в центре экрана
Example()

GUISetState() ; показывает созданное окно
; Запускается цикл опроса GUI до тех пор пока окно не будет закрыто
While 1
   $msg = GUIGetMsg()
   Select
	  Case $msg = $nCh0 OR $msg = $nCh1 OR $msg = $nCh2 OR $msg = $nCh3 OR $msg = $nCh4 OR $msg = $nCh5 OR $msg = $nCh6 OR $msg = $nCh7 OR $msg = $nCh8 OR $msg = $nCh9
	  chet()
	  Case $msg = $GUI_EVENT_CLOSE
            ExitLoop
		 Case $msg = $radio_1
		 GUICtrlSetState($nCh0,$GUI_HIDE)
		 GUICtrlSetState($nCh1,$GUI_HIDE)
		 GUICtrlSetState($nCh2,$GUI_HIDE)
		 GUICtrlSetState($nCh3,$GUI_HIDE)
		 GUICtrlSetState($nCh4,$GUI_HIDE)
		 GUICtrlSetState($nCh5,$GUI_HIDE)
		 GUICtrlSetState($nCh6,$GUI_HIDE)
		 GUICtrlSetState($nCh7,$GUI_HIDE)
		 GUICtrlSetState($nCh8,$GUI_HIDE)
		 GUICtrlSetState($nCh9,$GUI_HIDE)
		 GUICtrlSetState($nCh0,$GUI_UNCHECKED)
		 GUICtrlSetState($nCh1,$GUI_UNCHECKED)
		 GUICtrlSetState($nCh2,$GUI_UNCHECKED)
		 GUICtrlSetState($nCh3,$GUI_UNCHECKED)
		 GUICtrlSetState($nCh4,$GUI_UNCHECKED)
		 GUICtrlSetState($nCh5,$GUI_UNCHECKED)
		 GUICtrlSetState($nCh6,$GUI_UNCHECKED)
		 GUICtrlSetState($nCh7,$GUI_UNCHECKED)
		 GUICtrlSetState($nCh8,$GUI_UNCHECKED)
		 GUICtrlSetState($nCh9,$GUI_UNCHECKED)
		 chet()
	  Case $msg = $radio_2
		 GUICtrlSetState($nCh0,$GUI_SHOW)
		 GUICtrlSetState($nCh1,$GUI_SHOW)
		 if(not(($OS = "WIN_7") And ($arch="x32")))then
		 GUICtrlSetState($nCh2,$GUI_SHOW)
		 EndIf
		 GUICtrlSetState($nCh3,$GUI_SHOW)
		 GUICtrlSetState($nCh4,$GUI_SHOW)
		 GUICtrlSetState($nCh5,$GUI_SHOW)
		 GUICtrlSetState($nCh6,$GUI_SHOW)
		 GUICtrlSetState($nCh7,$GUI_HIDE)
		 GUICtrlSetState($nCh8,$GUI_SHOW)
		 GUICtrlSetState($nCh9,$GUI_HIDE)
		 GUICtrlSetState($nCh0,$GUI_CHECKED)
		 GUICtrlSetState($nCh1,$GUI_CHECKED)
		 if(not(($OS = "WIN_7") And ($arch="x32")))then
		 GUICtrlSetState($nCh2,$GUI_CHECKED)
		 EndIf
		 GUICtrlSetState($nCh3,$GUI_CHECKED)
		 GUICtrlSetState($nCh4,$GUI_CHECKED)
		 GUICtrlSetState($nCh5,$GUI_CHECKED)
		 GUICtrlSetState($nCh6,$GUI_CHECKED)
		 GUICtrlSetState($nCh7,$GUI_UNCHECKED)
		 GUICtrlSetState($nCh8,$GUI_CHECKED)
		 GUICtrlSetState($nCh9,$GUI_UNCHECKED)
		 chet()
	  Case $msg = $radio_3
		 GUICtrlSetState($nCh0,$GUI_SHOW)
		 GUICtrlSetState($nCh1,$GUI_HIDE)
		 if(not(($OS = "WIN_7") And ($arch="x32")))then
		 GUICtrlSetState($nCh2,$GUI_SHOW)
		 EndIf
		 GUICtrlSetState($nCh3,$GUI_SHOW)
		 GUICtrlSetState($nCh4,$GUI_HIDE)
		 GUICtrlSetState($nCh5,$GUI_SHOW)
		 GUICtrlSetState($nCh6,$GUI_SHOW)
		 GUICtrlSetState($nCh7,$GUI_HIDE)
		 GUICtrlSetState($nCh8,$GUI_SHOW)
		 GUICtrlSetState($nCh9,$GUI_SHOW)
		 GUICtrlSetState($nCh1,$GUI_UNCHECKED)
		 GUICtrlSetState($nCh0,$GUI_CHECKED)
		 if(not(($OS = "WIN_7") And ($arch="x32")))then
		 GUICtrlSetState($nCh2,$GUI_CHECKED)
		 EndIf
		 GUICtrlSetState($nCh3,$GUI_CHECKED)
		 GUICtrlSetState($nCh4,$GUI_UNCHECKED)
		 GUICtrlSetState($nCh5,$GUI_CHECKED)
		 GUICtrlSetState($nCh6,$GUI_CHECKED)
		 GUICtrlSetState($nCh7,$GUI_UNCHECKED)
		 GUICtrlSetState($nCh8,$GUI_CHECKED)
		 GUICtrlSetState($nCh9,$GUI_CHECKED)
		 chet()
	  Case $msg = $radio_4
		 GUICtrlSetState($nCh0,$GUI_SHOW)
		 GUICtrlSetState($nCh1,$GUI_SHOW)
		 if(not(($OS = "WIN_7") And ($arch="x32")))then
		 GUICtrlSetState($nCh2,$GUI_SHOW)
		 EndIf
		 GUICtrlSetState($nCh3,$GUI_SHOW)
		 GUICtrlSetState($nCh4,$GUI_SHOW)
		 GUICtrlSetState($nCh5,$GUI_SHOW)
		 GUICtrlSetState($nCh6,$GUI_SHOW)
		 If ($arch="x64") Then
			GUICtrlSetState($nCh7,$GUI_SHOW)
		 EndIf
		 GUICtrlSetState($nCh8,$GUI_SHOW)
		 GUICtrlSetState($nCh9,$GUI_SHOW)
		 GUICtrlSetState($nCh0,$GUI_CHECKED)
		 GUICtrlSetState($nCh1,$GUI_CHECKED)
		 if(not(($OS = "WIN_7") And ($arch="x32")))then
		 GUICtrlSetState($nCh2,$GUI_CHECKED)
		 EndIf
		 GUICtrlSetState($nCh3,$GUI_CHECKED)
		 GUICtrlSetState($nCh4,$GUI_CHECKED)
		 GUICtrlSetState($nCh5,$GUI_CHECKED)
		 GUICtrlSetState($nCh6,$GUI_CHECKED)
		 If ($arch="x64") Then
		 GUICtrlSetState($nCh7,$GUI_CHECKED)
		 EndIf
		 GUICtrlSetState($nCh8,$GUI_CHECKED)
		 GUICtrlSetState($nCh9,$GUI_CHECKED)
		 chet()
	  Case $msg = $radio_5
		 GUICtrlSetState($nCh0,$GUI_SHOW)
		 GUICtrlSetState($nCh1,$GUI_SHOW)
		 if(not(($OS = "WIN_7") And ($arch="x32")))then
		 GUICtrlSetState($nCh2,$GUI_SHOW)
		 EndIf
		 GUICtrlSetState($nCh3,$GUI_SHOW)
		 GUICtrlSetState($nCh4,$GUI_SHOW)
		 GUICtrlSetState($nCh5,$GUI_SHOW)
		 GUICtrlSetState($nCh6,$GUI_SHOW)
		 If ($arch="x64") Then
		 GUICtrlSetState($nCh7,$GUI_SHOW)
		 EndIf
		 GUICtrlSetState($nCh8,$GUI_SHOW)
		 GUICtrlSetState($nCh9,$GUI_SHOW)
		 GUICtrlSetState($nCh0,$GUI_UNCHECKED)
		 GUICtrlSetState($nCh1,$GUI_UNCHECKED)
		 GUICtrlSetState($nCh2,$GUI_UNCHECKED)
		 GUICtrlSetState($nCh3,$GUI_UNCHECKED)
		 GUICtrlSetState($nCh4,$GUI_UNCHECKED)
		 GUICtrlSetState($nCh5,$GUI_UNCHECKED)
		 GUICtrlSetState($nCh6,$GUI_UNCHECKED)
		 GUICtrlSetState($nCh7,$GUI_UNCHECKED)
		 GUICtrlSetState($nCh8,$GUI_UNCHECKED)
		 GUICtrlSetState($nCh9,$GUI_UNCHECKED)
		 chet()
	  Case $msg = $button_3
		 MsgBox(64,"ПОМОЩЬ!","RS3 и RJ: В случае если робот не подключается, попробуйте самостоятельно установить драйвер из папки inst\x48\CDM21216_Setup.exe" & @CR &"Arduino IDE и Ardublock: Если у вас не отображается во вкладке 'Сервис'/'Инструменты' расширение Ardublock проверьте наличие в Documents\Arduino\tools\ArduBlockTool\tool файла ardublock-all.jar . В случае его отсутствия, скопируйте его по этому пути из inst\x48\ardublock-all.jar . Если Arduino IDE не открывается, запустите его с совместимостью с Windows XP" & @CR &"FreeCAD: Если у вас возникает ошибка 'api-ms-win-crt-runtime-l1-1-0.dll отсутствует' необходимо скачать и установить Microsoft Visual C++ последней версии"& @CR & "Gcompris: Необходим OpenGL 2.0 и выше. Помогает запуск в безопасном режиме (В поиске Gcompris (Safe Mode))"&@CR&"Inkscape: Если не работают расширения, поставьте программу вручную из inst\(ваша битность)\inkscape-0.92.4.exe Расширения gcodetools из inst\x48\gcodetools и перенести все файлы оттуда в \Inkscape\share\extensions")
	  Case $msg = $button_2
		 $sPath = FileSelectFolder('Выберите системную папку', @ProgramFilesDir ) & '\Robbo'
		 If($sPath = "\Robbo")then
			$sPath=@ProgramFilesDir & '\Robbo'
		 EndIf
		 $lbl = GUICtrlCreateLabel('                                                                                                                             											', 10, 180)
		 $lbl = GUICtrlCreateLabel('Текущая: ' & $sPath, 10, 180)
	  Case $msg = $button_1
	  if($razmer>$free) Then
		 MsgBox(0,"ПРОБЛЕМА!","Места на диске не хватит для установки выбранных программ!")
	  Else
		 if $arch = "X64" Then;And $OS = "WIN_10" Then
		    ShellExecuteWait (@ScriptDir & '\x48\sert\sert.bat')
		    GUICtrlSetData($progressbar1, 10)
			if (GUICtrlRead($nCh0) = $GUI_CHECKED OR GUICtrlRead($nCh1) = $GUI_CHECKED) Then
			    ShellExecute(@ScriptDir & '\x48\CDM21216_Setup.exe')
				$hWnd = WinWait("FTDI", Null, 10)
				WinActivate($hWnd)
				Send("{ENTER}")
				$hWnd = WinWait("Мастер", Null, 10)
				WinActivate($hWnd)
				Send("{ENTER}")
				$hWnd = WinWait("Мастер", Null, 10)
				WinActivate($hWnd)
				sleep(100)
				ControlClick($hWnd, '', '[CLASS:Button; INSTANCE:1]', "main")
				Send("{ENTER}")
				$hWnd = WinWait("Мастер", Null, 10)
			    WinActivate($hWnd)
				Send("{ENTER}")
			EndIf

			If GUICtrlRead($nCh0) = $GUI_CHECKED Then
			    $lbl2 = GUICtrlCreateLabel('Сейчас устаналивается: Robboscratch 3', 100, 500)
			    ShellExecuteWait (@ScriptDir & '\x64\robboscratch-3.50.0-without-drivers-x64.exe',"/S /D=" & $sPath & "\RobboScratch3")
			EndIf
			GUICtrlSetData($progressbar1, 20)
			If GUICtrlRead($nCh1) = $GUI_CHECKED Then
			    $lbl2 = GUICtrlCreateLabel('Сейчас устаналивается: RobboJunior            ', 100, 500)
			    ShellExecuteWait (@ScriptDir & '\x64\robbojunior-0.0.12-without-drivers-x64.exe',"/S /D=" & $sPath & "\RobboJuniour")
			EndIf
			GUICtrlSetData($progressbar1, 29)
			If GUICtrlRead($nCh2) = $GUI_CHECKED Then
			   $lbl2 = GUICtrlCreateLabel('Сейчас устаналивается: Arduino IDE 1.0.5 для Ardublock', 100, 500)
			   DirCopy(@ScriptDir & '\x48\arduino-1.0.5-r2', $sPath & '\arduino-1.0.5-r2',1)
			   FileCreateShortcut($sPath & "\arduino-1.0.5-r2\arduino.exe", @DesktopDir & "\Arduino IDE 1.0.5.lnk")
			   $lbl2 = GUICtrlCreateLabel('Сейчас устаналивается: Ardublock                                             ', 100, 500)
			   FileCopy(@ScriptDir & '\x48\ardublock-russian-20130810.jar', @MyDocumentsDir & '\Arduino\tools\ArduBlockTool\tool\ardublock-all.jar',9)
			EndIf
			GUICtrlSetData($progressbar1, 38)
			If GUICtrlRead($nCh3) = $GUI_CHECKED Then
			  $lbl2 = GUICtrlCreateLabel('Сейчас устаналивается: Arduino IDE 1.8.9                        ', 100, 500)
			   ShellExecuteWait (@ScriptDir & '\x48\arduino-1.8.9-windows.exe',"/S /D=" & $sPath & "\Arduino IDE 1.8.9")
			EndIf
			GUICtrlSetData($progressbar1, 47)
			If GUICtrlRead($nCh4) = $GUI_CHECKED Then
			      $lbl2 = GUICtrlCreateLabel('Сейчас устаналивается: Processing               ', 100, 500)
				  DirCopy(@ScriptDir & '\x64\processing-3.5.4', $sPath & '\Processing-3.5.4',1)
				  FileCreateShortcut($sPath & "\processing-3.5.4\processing.exe", @DesktopDir & "\processing.exe.lnk")
			EndIf
			GUICtrlSetData($progressbar1, 56)
			If GUICtrlRead($nCh5) = $GUI_CHECKED Then
			   $lbl2 = GUICtrlCreateLabel('Сейчас устаналивается: FreeCAD             ', 100, 500)
			 RunWait(@ScriptDir & '\x64\7-Zip\7z.exe x -y -o' & @ScriptDir &'\FreeCAD ' & @ScriptDir & '\x64\FreeCAD-0.18.4.980bf90-WIN-x64-portable.7z' , "", @SW_HIDE)
			 DirCreate ( $sPath & '\FreeCAD' )
			 DirCopy ( @ScriptDir &'\FreeCAD', $sPath & '\FreeCAD',1)
			 DirRemove(@ScriptDir &'\FreeCAD',1)
		     FileCreateShortcut($sPath & "\FreeCAD\conda-0.18.4\bin\FreeCAD.exe", @DesktopDir & '\FreeCAD.lnk')
			;ShellExecuteWait (@ScriptDir & '\x64\FreeCAD-0.18.4.980bf90-WIN-x64-installer.exe',"/S /D=" & $sPath & "\FreeCAD")
			  ShellExecute(@ScriptDir & '\x32\VC_redist.x86.exe')
			  Sleep(100)
			 if(not WinExists ( "Программа" , "Исправить")) then
			    $hWnd = WinWait("Программа установки Microsoft", Null, 10)
				WinActivate($hWnd)
			    ControlClick($hWnd, '', '[CLASS:Button; INSTANCE:2]', "main")
				sleep(100)
				ControlClick($hWnd, '', '[CLASS:Button; INSTANCE:4]', "main")
			    $hWnd = WinWait("Программа установки Microsoft", "Установка успешно завершена", 20)
				ControlClick($hWnd, '', '[CLASS:Button; INSTANCE:13]', "main")
			 ElseIf
				$hWnd = WinWait("Программа установки Microsoft", Null, 10)
				ControlClick($hWnd, '', '[CLASS:Button; INSTANCE:16]', "main")
			 EndIf

			EndIf
			GUICtrlSetData($progressbar1, 65)
			If GUICtrlRead($nCh6) = $GUI_CHECKED Then
			   $lbl2 = GUICtrlCreateLabel('Сейчас устаналивается: GCompris         ', 100, 500)
			   ShellExecuteWait (@ScriptDir & '/x64/gcompris-qt-0.97-win64-gcc.exe',"/S /D=" & $sPath & "\GCompris")
			   FileCreateShortcut($sPath & "\GCompris\bin\GCompris.exe", @DesktopDir & '\GCompris.lnk',"","--software-renderer")
			EndIf
			GUICtrlSetData($progressbar1, 74)
			If GUICtrlRead($nCh7) = $GUI_CHECKED Then
			   $lbl2 = GUICtrlCreateLabel('Сейчас устаналивается: UnityHub        ', 100, 500)
			   ShellExecuteWait (@ScriptDir & '/x48/UnityHubSetup.exe',"/S /D=" & $sPath & "\UnityHub")
			   $lbl2 = GUICtrlCreateLabel('Сейчас устаналивается: VSCode            ', 100, 500)
			   ShellExecuteWait (@ScriptDir & '/x64/VSCodeUserSetup-x64-1.41.1.exe',"/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /DIR=" & $sPath & "\VScode")
			$hWnd = WinWait("Welcome", Null,25)
				WinActivate($hWnd)
				WinClose ($hWnd)
			   FileCreateShortcut($sPath & "\VScode\Code.exe", @DesktopDir & "\Code.lnk")
			EndIf
			GUICtrlSetData($progressbar1, 83)
			If GUICtrlRead($nCh8) = $GUI_CHECKED Then
			   $lbl2 = GUICtrlCreateLabel('Сейчас устаналивается: Repieter-Host          ', 100, 500)
			   ShellExecute(@ScriptDir & '\x48\setupRepetierHost_2_1_6.exe' ," /VERYSILENT /SUPPRESSMSGBOXES /SP- /LANG=russian /DIR=" & $sPath & "\RepetierHost" )
				$hWnd = WinWait("Установка Repetier-Server", Null, 100)
				WinActivate($hWnd)
				WinClose ($hWnd)
				$hWnd = WinWait("Установка Repetier-Server", "Да", 2)
			    WinActivate($hWnd)
				Send("{ENTER}")
			    FileCreateShortcut($sPath & "\RepetierHost\RepetierHost.exe", @DesktopDir & '\RepetierHost.lnk')
			    DirCopy(@ScriptDir &"\x48\Slic3r", @UserProfileDir & '\AppData\Roaming\Slic3r',9)
			    DirCopy(@ScriptDir &"\x48\Slic3rPE", @UserProfileDir& '\AppData\Roaming\Slic3rPE',9)
		;	   ShellExecute(@ScriptDir & '\x48\CH341SER\1.bat' )
			   ; $hWnd = WinWait("DriverSetup", Null, 10)
			;	WinActivate($hWnd)
		;		Send("{ENTER}")
	;			$hWnd2=WinWait("[TITLE:DriverSetup]",Null,20)
	;			WinActivate($hWnd2)
	;			Send("{ENTER}")
	;		    WinActivate($hWnd)
	;
;	WinClose ($hWnd)
			EndIf
			  ; XCOPY "%cd%\Proshivki" "%USERPROFILE%\Desktop\Proshivki" /S /I
			   ;XCOPY "%cd%\Настройки принтеров" "%USERPROFILE%\Desktop\Настройки принтеров" /S /I
			GUICtrlSetData($progressbar1, 92)
			If GUICtrlRead($nCh9) = $GUI_CHECKED Then
			   $lbl2 = GUICtrlCreateLabel('Сейчас устаналивается: Inkscape            ', 100, 500)
			   ShellExecuteWait (@ScriptDir & '/x64/inkscape-0.92.4-x64.exe',"/S /D=" & $sPath & "\Inkscape")
			   DirCopy(@ScriptDir & '\x48\gcodetools', $sPath & '\Inkscape\share\extensions',1)
			EndIf
			GUICtrlSetData($progressbar1, 100)
			$lbl2 = GUICtrlCreateLabel('УСТАНОВКА ЗАВЕРШЕНА!!!              ', 100, 500)

		 elseif $arch = "X86" Then;And $OS = "WIN_10" Then
		    ShellExecuteWait (@ScriptDir & '\x48\sert\sert.bat')
		    GUICtrlSetData($progressbar1, 10)
			if (GUICtrlRead($nCh0) = $GUI_CHECKED OR GUICtrlRead($nCh1) = $GUI_CHECKED) Then
			    ShellExecute(@ScriptDir & '\x48\CDM21216_Setup.exe')
				$hWnd = WinWait("FTDI", Null, 10)
				WinActivate($hWnd)
				Send("{ENTER}")
				$hWnd = WinWait("Мастер", Null, 10)
				WinActivate($hWnd)
				Send("{ENTER}")
				$hWnd = WinWait("Мастер", Null, 10)
				WinActivate($hWnd)
				sleep(100)
				ControlClick($hWnd, '', '[CLASS:Button; INSTANCE:1]', "main")
				Send("{ENTER}")
				$hWnd = WinWait("Мастер", Null, 10)
			    WinActivate($hWnd)
				Send("{ENTER}")
			 EndIf

			If GUICtrlRead($nCh0) = $GUI_CHECKED Then
			   $lbl2 = GUICtrlCreateLabel('Сейчас устаналивается: Robboscratch 3', 100, 500)
			    ShellExecuteWait (@ScriptDir & '\x32\robboscratch-3.50.0-without-drivers-x32.exe',"/S /D=" & $sPath & "\Robboscratch3")
			EndIf
			GUICtrlSetData($progressbar1, 20)
			If GUICtrlRead($nCh1) = $GUI_CHECKED Then
			    $lbl2 = GUICtrlCreateLabel('Сейчас устаналивается: RobboJunior    ', 100, 500)
			    ShellExecuteWait (@ScriptDir & '\x32\robbojunior-0.0.12-without-drivers-x32.exe',"/S /D=" & $sPath & "\robbojunior")
			EndIf
			GUICtrlSetData($progressbar1, 29)
			If GUICtrlRead($nCh2) = $GUI_CHECKED Then
			   $lbl2 = GUICtrlCreateLabel('Сейчас устаналивается: Arduino IDE 1.0.5 для Ardublock', 100, 500)
			   DirCopy(@ScriptDir & '\x48\arduino-1.0.5-r2', $sPath & '\arduino-1.0.5-r2',1)
			   FileCreateShortcut($sPath & "\arduino-1.0.5-r2\arduino.exe", @DesktopDir & "\Arduino IDE 1.0.5.lnk")
			   $lbl2 = GUICtrlCreateLabel('Сейчас устаналивается: Ardublock                               ', 100, 500)
			   FileCopy(@ScriptDir & '\x48\ardublock-russian-20130810.jar', @MyDocumentsDir & '\Arduino\tools\ArduBlockTool\tool\ardublock-all.jar',8)
			EndIf
			GUICtrlSetData($progressbar1, 38)
			If GUICtrlRead($nCh3) = $GUI_CHECKED Then

			   $lbl2 = GUICtrlCreateLabel('Сейчас устаналивается: Arduino IDE 1.8.9                        ', 100, 500)
			   ShellExecuteWait (@ScriptDir & '\x48\arduino-1.8.9-windows.exe',"/S /D=" & $sPath & "\Arduino IDE 1.8.9")
			EndIf
			GUICtrlSetData($progressbar1, 47)
			If GUICtrlRead($nCh4) = $GUI_CHECKED Then
			   $lbl2 = GUICtrlCreateLabel('Сейчас устаналивается: Processing                           ', 100, 500)
				  DirCopy(@ScriptDir & '\x32\processing-3.5.4', $sPath & '\processing-3.5.4',1)
				  FileCreateShortcut($sPath & "\processing-3.5.4\processing.exe", @DesktopDir & "\processing.lnk")
			EndIf
			GUICtrlSetData($progressbar1, 56)
			If GUICtrlRead($nCh5) = $GUI_CHECKED Then
			   $lbl2 = GUICtrlCreateLabel('Сейчас устаналивается: FreeCAD                          ', 100, 500)
			  RunWait(@ScriptDir & '\x32\7-Zip\7z.exe x -y -o' & @ScriptDir &' ' & @ScriptDir & '\x32\FreeCAD-0.18.4.980bf90-WIN-x32-portable.7z' , "", @SW_HIDE)
			   DirCreate ( $sPath & '\FreeCAD' )
			   DirCopy ( @ScriptDir &'\FreeCAD', $sPath & '\FreeCAD',1)
			   DirRemove(@ScriptDir &'\FreeCAD',1)
			   FileCreateShortcut($sPath & "\FreeCAD\bin\FreeCAD.exe", @DesktopDir & '\FreeCAD.lnk')
			   ShellExecuteWait(@ScriptDir & '\x32\VC_redist.x86.exe')
			  Sleep(100)
			 if(not WinExists ( "Программа" , "&Исправить")) then
			    $hWnd = WinWait("Программа установки Microsoft", Null, 10)
				WinActivate($hWnd)
			    ControlClick($hWnd, '', '[CLASS:Button; INSTANCE:2]', "main")
				sleep(100)
				ControlClick($hWnd, '', '[CLASS:Button; INSTANCE:4]', "main")
			    $hWnd = WinWait("Программа установки Microsoft", "Установка успешно завершена", 20)
				ControlClick($hWnd, '', '[CLASS:Button; INSTANCE:13]', "main")
			 ElseIf
				$hWnd = WinWait("Программа установки Microsoft", Null, 10)
				ControlClick($hWnd, '', '[CLASS:Button; INSTANCE:16]', "main")
			 EndIf
			EndIf
			GUICtrlSetData($progressbar1, 65)
			If GUICtrlRead($nCh6) = $GUI_CHECKED Then
			   $lbl2 = GUICtrlCreateLabel('Сейчас устаналивается: Gcompris              ', 100, 500)
			   ShellExecuteWait (@ScriptDir & '\x32\gcompris-qt-0.97-win32-gcc.exe',"/S /D=" & $sPath & "\GCompris")
			   FileCreateShortcut($sPath & "\GCompris\bin\GCompris.exe", @DesktopDir & '\GCompris.lnk',"","--software-renderer")
			EndIf
			GUICtrlSetData($progressbar1, 74)
			;If GUICtrlRead($nCh7) = $GUI_CHECKED Then
			;   $lbl2 = GUICtrlCreateLabel('Сейчас устаналивается: UnityHub и VSCode', 100, 500)
			;   ShellExecuteWait (@ScriptDir & '/x48/UnityHubSetup.exe',"/S /D=" & $sPath & "\UnityHub")
			;   ShellExecuteWait (@ScriptDir & '/x32/VSCodeUserSetup-ia32-1.41.1.exe',"/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /D=" & $sPath & "\VSCode")
			;    $hWnd = WinWait("Welcome", Null,25)
		;		WinActivate($hWnd)
	;			WinClose ($hWnd)
	;		    FileCreateShortcut($sPath & "\VScode\Code.exe", @DesktopDir & '\Code.lnk')
	;		EndIf
			GUICtrlSetData($progressbar1, 83)
			If GUICtrlRead($nCh8) = $GUI_CHECKED Then
			   $lbl2 = GUICtrlCreateLabel('Сейчас устаналивается: Repieter-Host      ', 100, 500)
			   ShellExecute(@ScriptDir & '\x48\setupRepetierHost_2_1_6.exe' ,' /VERYSILENT /SUPPRESSMSGBOXES /SP- /LANG=russian "/DIR=' & $sPath & '\RepetierHost"')
				$hWnd = WinWaitActive("Установка Repetier-Server", Null, 100)
				WinActivate($hWnd)
				WinClose ($hWnd)
				$hWnd = WinWaitActive("Установка Repetier-Server", "Да", 2)
			    WinActivate($hWnd)
				Send("{ENTER}")
			    FileCreateShortcut($sPath & "\RepetierHost\RepetierHost.exe", @DesktopDir & '\RepetierHost.lnk')
			    DirCopy(@ScriptDir &"\x48\Slic3r", @UserProfileDir & '\AppData\Roaming\Slic3r',9)
			    DirCopy(@ScriptDir &"\x48\Slic3rPE", @UserProfileDir& '\AppData\Roaming\Slic3rPE',9)
			EndIf
			GUICtrlSetData($progressbar1, 92)
			If GUICtrlRead($nCh9) = $GUI_CHECKED Then
			   $lbl2 = GUICtrlCreateLabel('Сейчас устаналивается: Inkscape              ', 100, 500)
			   ShellExecuteWait (@ScriptDir & '/x32/inkscape-0.92.4-x86.exe',"/S /D=" & $sPath & "\Inkscape")
			   DirCopy(@ScriptDir & '\x48\gcodetools', $sPath & '\Inkscape\share\extensions',1)
			EndIf
			GUICtrlSetData($progressbar1, 100)
		    $lbl2 = GUICtrlCreateLabel('УСТАНОВКА ЗАВЕРШЕНА!!!           ', 100, 500)
		 EndIf
		 MsgBox(0,"Конец!","Установка завершена")
		 ExitLoop
	  EndIf
   EndSelect

WEnd