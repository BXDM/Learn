@echo off
Setlocal Enabledelayedexpansion

set IsAddFunc=n
set PhoenixOSID=0
set IsBootEFI=
set WinBit=

::========================================
::�ж��Ƿ����Ա���У���Ȩ
::========================================
@echo off

REM ________________________________________________________________

>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

if '%errorlevel%' NEQ '0' (

    echo �������ԱȨ��...

    goto UACPrompt

) else ( goto gotAdmin )

:UACPrompt

    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\phoenixgetadmin.vbs"

    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\phoenixgetadmin.vbs"

    "%temp%\phoenixgetadmin.vbs"

    exit /B

:gotAdmin

    if exist "%temp%\phoenixgetadmin.vbs" ( del "%temp%\phoenixgetadmin.vbs" )

    pushd "%CD%"

    CD /D "%~dp0"

REM ________________________________________________________________


:: �ж�������ʽ��UEFI or Legacy
for /f "tokens=2 delims=." %%i in ('bcdedit.exe^|findstr "winload"') do set IsBootEFI=%%i
if "%IsBootEFI%" == "exe" ( goto BootLegacy ) else ( goto BootUEFI ) 

::========================== Legacy Start ============================
::Legacy ��ʽ��ڣ��޸�BCD 
:BootLegacy

:: ���� 'bcdedit /enum' �� "Phoenix OS" ��λ��
set /a Count=0
for /f "tokens=1 delims=" %%i in ('bcdedit /enum') do ( 
    set /a Count+=1
    echo %%i | findstr "\<Phoenix\>" > nul
    if !errorlevel! equ 0 (set /a PhoenixCount=Count-3)
)

:: ��ȡ "Phoenix OS" ���ڵ�ID
set /a Count=0
for /f "tokens=1 delims=" %%i in ('bcdedit /enum') do ( 
    set /a Count+=1
    if !Count! equ !PhoenixCount! (set PhoenixOSID=%%i)
)
for /f "tokens=2 delims= " %%i in ("!PhoenixOSID!") do (set PhoenixOSID=%%i)

:: ��"Phoenix OS"��ID��ӵ�һ�����������б���
bcdedit /bootsequence !PhoenixOSID! /addfirst

:: ��֤��ӳɹ�����������ϵͳ
for /f "tokens=2 delims= " %%i in ('bcdedit /enum ^| findstr "bootsequence"') do ( 
        if %%i == !PhoenixOSID! (
            echo Next reboot will enter PhoenixOS directly.
            goto Reboot
        )
)

:: û����ɣ���ʾ���˳�
echo "Set Legacy boot sequence error, exit..." 
goto exit_point
::========================== Legacy End ============================


::========================== UEFI Start ============================
::UEFI ��ʽ��ڣ��޸�Grub2 
:BootUEFI

::============= Check SecureBoot Start ==================
:: ����'UEFISecureBootEnabled'�ļ�ֵ��������Ϊ'is_value'
for /f "tokens=3 delims= " %%i in ('reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecureBoot\State^|findstr UEFISecureBootEnabled') do (set is_value=%%i)
::echo %is_value%
::pause

:: �������ԵĴ��룬������Ϊ'lan_value'
if '%is_value%' == '0x1' (
for /f "tokens=3 delims= " %%i in ('reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Nls\Language^|findstr Default') do (set lan_value=%%i)	
) else (goto nextpsstop)
::echo %lan_value%
::pause

:: �ж������Ƿ�Ϊ���ģ��������������ʾ���������Ӣ����ʾ
if '%lan_value%' == '0804' (@echo msgbox "����BIOS������Secure Boot���޷�������ϵͳ�������BIOS��Secure Boot�رա�",0,"���ϵͳ������ʾ" > msg_ps.vbs 
) else (  @echo msgbox "Secure boot is enabled which could lead to failure of booting Phoenix OS. Please turn off secure boot in BIOS configuration.",0,"Phoenix OS" > msg_ps.vbs )
::pause
@msg_ps.vbs
@del msg_ps.vbs
goto exit_point
:nextpsstop
::============= Check SecureBoot End ==================

:: �ж�Windows 32/64bit
if exist "%PROGRAMFILES(x86)%" (set WinBit=64) else (set WinBit=32)

:: ����ESP����
mountvol v: /S
if %errorlevel% neq 0 (echo Mount ESP error! && goto exit_point)

:: ���Ĭ�����ò����Ƿ����
if "%WinBit%" == "32" ( goto AddFunc32 )
if "%WinBit%" == "64" ( goto AddFunc64 )

:: 32λUEFI��������
:AddFunc32
::findstr "next_entry" v:\EFI\PhoenixOS\Boot\grub.cfg >nul 2>&1 && goto add_env_point
copy v:\EFI\PhoenixOS\Boot\bootia32.efi "%~dp0"\config\bootia32.efi.phoenix.bak
copy v:\EFI\Boot\bootia32.efi "%~dp0"\config\bootia32.efi.boot.bak
copy "%~dp0"\config\bootia32.efi v:\EFI\PhoenixOS\Boot\bootia32.efi
copy "%~dp0"\config\bootia32.efi v:\EFI\Boot\bootia32.efi

copy v:\EFI\PhoenixOS\Boot\grub.cfg "%~dp0"\config\grub.cfg.bak
copy "%~dp0"\config\grub.cfg v:\EFI\PhoenixOS\Boot\grub.cfg
goto add_env_point

:: 64λUEFI��������
:AddFunc64
::findstr "next_entry" v:\EFI\Boot\grub.cfg >nul 2>&1 && goto add_env_point
copy v:\EFI\Boot\grub.cfg "%~dp0"\config\grub.cfg.bak
copy "%~dp0"\config\grub-x64.cfg v:\EFI\Boot\grub.cfg
mkdir v:\boot
mkdir v:\.disk
echo 'Phoenix OS' > v:\.disk\info
echo 'Phoenix OS' > v:\.disk\mini-info

:: �����´ε�Ĭ��������ΪPhoenixOS
:add_env_point
if "%WinBit%" == "32" ( copy "%~dp0"\config\grubenv v:\EFI\PhoenixOS\Boot\grubenv )
if "%WinBit%" == "64" ( copy "%~dp0"\config\grubenv v:\EFI\Boot\grubenv )
echo Next reboot will enter PhoenixOS directly.

:: ж��ESP����
mountvol v: /d
::========================== UEFI End ============================

:: ����
:Reboot
shutdown -r -t 1

:exit_point
