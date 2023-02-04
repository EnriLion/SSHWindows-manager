Write-Host "SSH MANAGER"
Write-Host "To use this command you need elevation"
$IsActive = $(New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if ($IsActive) {
   "You are not elevated" 
       
}else {
       Write-Host "You need OPENSSH to run it" 
        $install = 'true'
        if ($install) {
            # Install the OpenSSH Client
            Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0

            # Install the OpenSSH Server
            Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
        }
        Write-Warning -Message "Ok"
}
