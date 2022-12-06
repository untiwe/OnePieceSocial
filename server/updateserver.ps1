$pathFolder = "E:\arhive\Web\OnePieceSocial\server"
cd $pathFolder
docker build -t opcserver .;
docker save -o opcserver.tar opcserver;
pscp -pw ${Env:WebUserPwd} opcserver.tar  ${Env:WebUserName}@${Env:WebUserIP}:"/web-root/"
plink -batch -ssh ${Env:WebUserName}@${Env:WebUserIP} -pw ${Env:WebUserPwd} "bash /web-root/updateserver.sh"


Write-Host -NoNewLine 'Press any key to continue...';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
