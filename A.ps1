# Get the path to the current user's desktop
$desktopPath = [System.Environment]::GetFolderPath("Desktop")
$filePath = Join-Path -Path $desktopPath -ChildPath "AdminCheck.txt"

# Check for administrative privileges
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

# Prepare the content based on the check
if ($isAdmin) {
    $content = "The script is running with Administrator privileges."
    Write-Host $content -ForegroundColor Green
} else {
    $content = "The script is NOT running with Administrator privileges."
    Write-Host $content -ForegroundColor Yellow
}

# Write the result to the text file on the desktop
try {
    Set-Content -Path $filePath -Value $content -Force
    Write-Host "Successfully wrote the result to $filePath"
} catch {
    Write-Host "Error: Could not write to the file at $filePath" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
}
