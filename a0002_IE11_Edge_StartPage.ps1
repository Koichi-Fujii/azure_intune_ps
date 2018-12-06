
############################################################
#
# [history]
#	data		rev	name	comment
#	2018/11/09	1.0	Fujii	New
#
############################################################

$rev=1.0
$ret=0

reg add "HKLM\Software\Policies\Microsoft\Internet Explorer\Main" /v "Start Page" /t "REG_SZ" /d "https://www.google.co.jp/" /f
if(!($?)){$ret=1}

reg add "HKLM\Software\Policies\Microsoft\MicrosoftEdge\Internet Settings" /v "ProvisionedHomePages" /t "REG_SZ" /d "https://www.google.co.jp/" /f
if(!($?)){$ret=1}

exit $ret
