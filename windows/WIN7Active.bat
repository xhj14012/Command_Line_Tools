@echo off&setlocal EnableDelayedExpansion&color 5e
title KMS_Activation for Win7[Tsingrity-Edition]

echo.&echo.

::set KMS_Server=kms.example.com

set KMS_Server=kms1.qinghuiss.com 


call :adminchk
set Professional=FJ82H-XT6CR-J8D7P-XQJJ2-GPDD4
set ProfessionalN=MRPKT-YTG23-K7D7T-X2JMM-QY7MG
set ProfessionalE=W82YF-2Q76Y-63HXB-FGJG9-GF7QX
set Enterprise=33PXH-7Y6KF-2VJC9-XBBR8-HVTHH
set EnterpriseN=YDRBP-3D83W-TY26F-D46B2-XCKRJ
set EnterpriseE=C29WB-22CC8-VJ326-GHFJW-H9DH4J
for /f "tokens=3 delims= " %%i in ('reg QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "EditionID"') do set EditionID=%%i
if defined %EditionID% (
cscript //Nologo %windir%\system32\slmgr.vbs /ipk !%EditionID%!
cscript //Nologo %windir%\system32\slmgr.vbs /skms %KMS_Server%
cscript //Nologo %windir%\system32\slmgr.vbs /ato
) else (
echo.&echo Not found DEFINED Key: "%EditionID%".
echo.
)
pause
exit
:adminchk
reg query "HKU\S-1-5-19" >nul 2>nul || (
cls&echo.&echo Run as ADMINISTRATOR, Pls.
echo.&echo Press any key to exit.
echo.&pause>nul
exit)
goto :EOF
