# Requires: Import-Module WebAdministration

class IISSite {
    [string]$Name

    IISSite([string]$name) {
        $this.Name = $name
    }

    hidden [Microsoft.IIs.PowerShell.Framework.ConfigurationElement] GetSite() {
        $site = Get-ChildItem IIS:\Sites | Where-Object { $_.Name -eq $this.Name }
        if (-not $site) {
            throw "Site '$($this.Name)' not found."
        }
        return $site
    }

    [void]Start() {
        $site = $this.GetSite()
        if ($site.State -eq 'Started') {
            Write-Host "Site '$($this.Name)' is already running." -ForegroundColor Yellow
        } else {
            Start-WebSite -Name $this.Name
            Write-Host "Site '$($this.Name)' started." -ForegroundColor Green
        }
    }

    [void]Stop() {
        $site = $this.GetSite()
        if ($site.State -eq 'Stopped') {
            Write-Host "Site '$($this.Name)' is already stopped." -ForegroundColor Yellow
        } else {
            Stop-WebSite -Name $this.Name
            Write-Host "Site '$($this.Name)' stopped." -ForegroundColor Red
        }
    }

    [void]Status() {
        $site = $this.GetSite()
        Write-Host "Site '$($this.Name)' status: $($site.State)" -ForegroundColor Cyan
    }

    static [IISSite[]] ListAll() {
        $sites = Get-ChildItem IIS:\Sites
        return $sites | ForEach-Object { [IISSite]::new($_.Name) }
    }
}

function Get-IISSite {
    param([string]$Name)
    if ($Name) {
        return [IISSite]::new($Name)
    }
    else {
        return [IISSite]::ListAll()
    }
}
