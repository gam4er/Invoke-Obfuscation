﻿$ComputerDomain = Get-ADDomain | select DomainMode,Name,NetBIOSName,InfrastructureMaster | FT -AutoSize
$User = Get-ADUser -filter "SamAccountName -like `"$env:USERNAME`"" | select SID,DistinguishedName | FT -AutoSize
$RDS = (Get-ADDomain).ReplicaDirectoryServers
$testConnection = Test-Connection $RDS -Count 1
Write-Output $ComputerDomain
Write-Output $User
Write-Host "Results of availabilyty of DC"
Write-Output ($testConnection | FT -AutoSize)
[string] $cmd = 'cmd /c calc'; Write-Verbose -Message $cmd; Invoke-Command -ScriptBlock ([ScriptBlock]::Create($cmd))