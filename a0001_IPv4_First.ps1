
############################################################
#
# [history]
#	data		rev	name	comment
#	2018/11/09	1.0	Fujii	New
#
############################################################

$rev=1.0
$ret=0

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" /v "DisabledComponents" /t "REG_DWORD" /d "32" /f
if(!($?)){$ret=1}

exit $ret
