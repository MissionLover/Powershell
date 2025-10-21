$filePath = "C:\AdminCheck.txt"

# Principle: The ability to write to C:\ itself is the test for administrative privileges.
# We will use a try/catch block to handle the outcome.

try {
    # Attempt to write a success message to the protected location.
    # The -ErrorAction Stop parameter ensures that a failure will trigger the catch block.
    Set-Content -Path $filePath -Value "The script successfully wrote to C:\, indicating it is running with Administrator privileges." -Force -ErrorAction Stop

    # If the above command succeeds, this confirmation message will be displayed.
    Write-Host "Success: Administrative privileges confirmed by writing to $filePath" -ForegroundColor Green

} catch {
    # If Set-Content fails due to permissions, the script will jump to this block.
    # The error message indicates a lack of administrative rights.
    $errorMessage = "Failure: Could not write to $filePath. The script is NOT running with Administrator privileges."
    
    # Display the error in the console.
    Write-Host $errorMessage -ForegroundColor Red
    
    # For diagnostic purposes, you can also output the specific system error.
    Write-Host "System Error: $($_.Exception.Message)" -ForegroundColor DarkRed
}