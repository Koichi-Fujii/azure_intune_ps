
############################################################
#
# [history]
#	data		rev	name	comment
#	2018/11/09	1.0	Fujii	New
#
############################################################

$rev=1.0
$ret=0

reg add "HKLM\Software\Policies\Microsoft\MicrosoftEdge\Internet Settings" /v "PreventFirstRunPage" /t "REG_DWORD" /d "1" /f
if(!($?)){$ret=1}

reg add "HKLM\Software\Policies\Microsoft\MicrosoftEdge\Internet Settings" /v "SendIntranetTraffictoInternetExplorer" /t "REG_DWORD" /d "1" /f
if(!($?)){$ret=1}

exit $ret
