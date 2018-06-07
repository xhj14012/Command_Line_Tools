@echo off

::set a0=example.com

set a1=kms1.qinghuiss.com
set a2=kms2.qinghuiss.com
::set a3=kms3.qinghuiss.com
::set a4=kms4.qinghuiss.com
::set a5=kms5.qinghuiss.com


mode con cols=85 lines=25
setlocal EnableDelayedExpansion&color 3e
title KMS_Activation for Win10[Tsingrity-Edition]
%1 %2
mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :runas","","runas",1)(window.close)&goto :eof
:runas
call :set_string
call :check_network
call :check_version
call :set_kms_key_10


if not defined bar goto en
echo %bar%
echo Automatic check EditionID and set key &echo.&echo then check KMS server one by one
echo %bar%
timeout /t 10
:en
for /f "tokens=3 delims= " %%i in ('reg QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "EditionID"') do set EditionID=%%i
echo EditionID = %EditionID%
if defined %EditionID% (echo.
	cscript //Nologo %windir%\system32\slmgr.vbs /ipk !%EditionID%!
	for /L %%a in (1,1,50) do (if defined a%%a (echo %bar% &echo Trying KMS server: !a%%a! &echo.
		cscript //Nologo %windir%\system32\slmgr.vbs /skms !a%%a!
		(cscript //nologo %windir%\system32\slmgr.vbs /ato) ^| findstr /i "successful ³É¹¦ ¦¨¥\" && (call :successful !a%%a!)))
       	goto failure) else (echo.&echo The defined key is not found: "%EditionID%" &echo.&pause)
exit

:set_kms_key_10
set Core=TX9XD-98N7V-6WMQ6-BX7FG-H8Q99
set CoreCountrySpecific=PVMJN-6DFY6-9CCP6-7BKTT-D3WVR
set CoreN=3KHY7-WNT83-DGQKR-F7HPR-844BM
set CoreSingleLanguage=7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH
set ProfessionalStudent=YNXW3-HV3VB-Y83VG-KPBXM-6VH3Q
set ProfessionalStudentN=8G9XJ-GN6PJ-GW787-MVV7G-GMR99
set Professional=W269N-WFGWX-YVC9B-4J6C9-T83GX
set ProfessionalN=MH37W-N47XK-V7XM9-C7227-GCQG9
set ProfessionalSN=8Q36Y-N2F39-HRMHT-4XW33-TCQR4
set ProfessionalWMC=NKPM6-TCVPT-3HRFX-Q4H9B-QJ34Y
set Enterprise=NPPR9-FWDCX-D2C8J-H872K-2YT43
set EnterpriseN=DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4
set Education=NW6C2-QMPVW-D7KKK-3GKT6-VCFB2
set EducationN=2WH4N-8QGBV-H22JP-CT43Q-MDWWJ
::LTSB 2015
::set EnterpriseS=WNMTR-4C88C-JK8YV-HQ7T2-76DF9
::set EnterpriseSN=2F77B-TNFGY-69QQF-B8YKP-D69TJ
::LTSB 2016
set EnterpriseS=DCPHK-NFMTC-H88MJ-PFHPY-QJ4BJ
set EnterpriseSN=QFFDN-GRT3P-VKWWX-X7T3R-8B639
::Windows Server 2016
::set ServerDatacenter=CB7KF-BWN84-R7R2Y-793K2-8XDDG
::set ServerStandard=WC2BQ-8NRM3-FDDYY-2BFGV-KHKQY
::set ServerEssentials=JCKRF-N37P4-C2D82-9YXRT-4M63B
goto :EOF

:set_string
chcp | findstr "936 950 437" > nul && (
	set bar===========================================
)

if not defined bar (
	echo.&echo Unsupported system language.
	echo.&echo Press any key to exit... &pause>nul)
goto :EOF

:failure
cls&color 1e
echo.&echo %bar%
echo Activation failed &echo.&echo Please check the network and try again
echo %bar% &echo.
pause
exit

:successful
cls&color ce
echo %bar%
echo Activation successed. &echo.&echo The current KMS server is: %1
echo %bar% &echo.
pause
exit

:check_network
echo Waiting for the network...
ping -n 1 www.qq.com | find /i "TTL" > nul && (cls & goto :EOF)
ping -n 1 www.baidu.com | find /i "TTL" > nul && (cls & goto :EOF)
echo.&echo Please check the network and try again & echo.
pause
exit

:check_version
ver | find "10." >nul 2>nul && (goto :EOF)
echo.&echo The current OS is not Windows 10 &echo.
pause
exit