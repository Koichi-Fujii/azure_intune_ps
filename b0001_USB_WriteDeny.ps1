
############################################################
#
# [history]
#	data		rev	name	comment
#	2018/11/09	1.0	Fujii	New
#
############################################################

$rev=1.0
$ret=0

$s = Get-CimInstance -ClassName Win32_LoggedOnUser | %{$o = New-Object PSObject | Select Domain,User; $o.Domain, $o.User = $_.Antecedent.Domain, $_.Antecedent.Name; $o} | ?{$_.Domain -Like "AzureAD"} | Select-Object -first 1
$sid = (New-Object System.Security.Principal.NTAccount($s.Domain,$s.User)).Translate([System.Security.Principal.SecurityIdentifier]).Value

reg add "HKU\$sid\Software\Policies\Microsoft\Windows\RemovableStorageDevices\{53f56308-b6bf-11d0-94f2-00a0c91efb8b}" /v "Deny_Write" /t "REG_DWORD" /d 1 /f
if(!($?)){$ret=1}

reg add "HKU\$sid\Software\Policies\Microsoft\Windows\RemovableStorageDevices\{53f5630b-b6bf-11d0-94f2-00a0c91efb8b}" /v "Deny_Write" /t "REG_DWORD" /d 1 /f
if(!($?)){$ret=1}

reg add "HKU\$sid\Software\Policies\Microsoft\Windows\RemovableStorageDevices\{53f5630d-b6bf-11d0-94f2-00a0c91efb8b}" /v "Deny_Write" /t "REG_DWORD" /d 1 /f
if(!($?)){$ret=1}

reg add "HKU\$sid\Software\Policies\Microsoft\Windows\RemovableStorageDevices\{53f56311-b6bf-11d0-94f2-00a0c91efb8b}" /v "Deny_Write" /t "REG_DWORD" /d 1 /f
if(!($?)){$ret=1}

Start-Process -FilePath gpupdate.exe -ArgumentList /force -WindowStyle Hidden -Wait

exit $ret
