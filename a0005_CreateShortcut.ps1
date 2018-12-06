
############################################################
#
# [history]
#	data		rev	name	comment
#	2018/11/09	1.0	Fujii	New
#
############################################################

$rev=1.0
$ret=0

$shell=New-Object -ComObject WScript.Shell
$lnk=$shell.CreateShortcut("$Home\Desktop\Microsoft Intune Portal.url")
$lnk.TargetPath="https://portal.manage.microsoft.com/"
$lnk.Save()

if(!($?)){$ret=1}

exit $ret
