###------------------------------###    
### Author : Troy Hutchison-----###      
###------------------------------###    
###/////////..........\\\\\\\\\\\###    
###///////////.....\\\\\\\\\\\\\\###
function Hotfixreport { 
$computers = Get-Content $env:USERPROFILE\Desktop\computers.txt   
$ErrorActionPreference = 'Stop'   
ForEach ($computer in $computers) {  
 
  try  
    { 
Get-HotFix -cn $computer | Select-Object PSComputerName,HotFixID,Description,InstalledBy,InstalledOn | FT -AutoSize 
  
    } 
 
catch  
 
    { 
Write-Warning "System Not reachable:$computer" 
    }  
} 
 
} 
Hotfixreport > "$env:USERPROFILE\Desktop\Hotfixreport.txt"
