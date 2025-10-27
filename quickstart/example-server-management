class Server {
    [string]$Name
    [bool]$Running = $false

    Server([string]$name) {
        $this.Name = $name
    }

    [void]Start() {
        $this.Running = $true
        Write-Host "Server $($this.Name) started."
    }

    [void]Stop() {
        $this.Running = $false
        Write-Host "Server $($this.Name) stopped."
    }
}

$web = [Server]::new("Web01")
$web.Start()
$web.Stop()
