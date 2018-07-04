param(
    [Parameter(Mandatory=$false)][string]$maxDisks = 64,
    [Parameter(Mandatory=$false)][string]$maxMem = 229376,
    [Parameter(Mandatory=$false)][string]$maxCPU = 16,
    [Parameter(Mandatory=$false)][string]$location = 'westeurope'
)

$availableSizes = Get-AzureRmVMSize -Location $location

$availableSizes | Where-Object {$PSItem.MaxDataDiskCount -le $maxDisks} `
                | Where-Object {$PSItem.MemoryInMB -le $maxMem} `
                | Where-Object {$PSItem.NumberOfCores -le $maxCPU} `
                | Select-Object Name, MaxDataDiskCount, MemoryInMB, NumberOfCores
