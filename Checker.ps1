# ============================
# Check-IP.ps1
# Sends Gmail alert if public IP changes
# ============================

# Configuration
$ipFile = "$env:LOCALAPPDATA\last_ip.txt"
$smtpServer = "smtp.gmail.com"
$smtpPort = 587
$from = "seyiogunniran1@gmail.com"
$to = "seyi.no@greenafrica.com.com"
$subject = "Public IP Change Detected"
$appPassword = "bcvqmicvnqjvfkhw"  # Use your Gmail App Password here

# Get current public IP
try {
    $currentIP = Invoke-RestMethod -Uri "https://api.ipify.org"
} catch {
    Write-Error "Failed to retrieve public IP"
    exit 1
}

# Read last IP
$lastIP = ""
if (Test-Path $ipFile) {
    $lastIP = Get-Content $ipFile -Raw
}

# Compare and act if IP changed
if ($currentIP -ne $lastIP) {
    Set-Content -Path $ipFile -Value $currentIP
    $body = "New Public IP detected: $currentIP"

    Send-MailMessage -From $from `
                     -To $to `
                     -Subject $subject `
                     -Body $body `
                     -SmtpServer $smtpServer `
                     -Port $smtpPort `
                     -UseSsl `
                     -Credential (New-Object PSCredential ($from, (ConvertTo-SecureString $appPassword -AsPlainText -Force)))
}
