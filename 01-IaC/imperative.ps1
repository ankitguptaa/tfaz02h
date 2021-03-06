[CmdletBinding()]
param (
    [Parameter(Mandatory = $true)]
    [string]
    $Name,

    [Parameter()]
    [string]
    [ValidateSet('Running', 'Stopped')]
    $Status,

    [Parameter()]
    [string]
    [ValidateSet('Automatic', 'Disabled', 'Manual')]
    $StartupType
)

$service = Get-Service -Name $Name -ErrorAction Stop

if ($service.StartType -ne $StartupType) {
    Write-Verbose -Message "Setting startup type for $Name to $StartupType"
    Set-Service -Name $Name -StartupType $StartupType
}

if ($service.Status -ne $Status) {
    if ($Status -eq 'Running') {
        Write-Verbose -Message "Starting service $Name"
        Start-Service -Name $Name
    }
    else {
        Write-Verbose -Message "Stopping service $Name"
        Stop-Service -Name $Name    
    }
}