# ===== WINFETCH CONFIGURATION =====

# $image = "~/winfetch.png"
# $image = "~\Pictures\test3.png"
$image = "~\Pictures\test1.png"
# $noimage = $true

# Display image using ASCII characters
$ascii = $true

# Set the version of Windows to derive the logo from.
# $logo = "Windows XP"

# Specify width for image/logo
$imgwidth = 40

# Specify minimum alpha value for image pixels to be visible
# $alphathreshold = 50

# Custom ASCII Art
# This should be an array of strings, with positive
# height and width equal to $imgwidth defined above.
# $CustomAscii = @(
#     "  ___________  ",   
# )

# Make the logo blink
# $blink = $true

# Display all built-in info segments.
# $all = $true

# Add a custom info line
# function info_custom_time {
#     return @{
#         title = "Time"
#         content = (Get-Date)
#     }
# }
function info_custom_time {
    return @{
        title = "Time"
        content = (Get-Date)
    }
}

function info_custom_OS {
    return @{
        title = "OS"
        content = "Windows 10 Pro"
    }
}

function info_custom_title {
    return @{
        title = "ella"
        content = "@ ramiels.me"
    }
}

function info_custom_cpu {
    # $megahertz = (Get-WmiObject Win32_Processor).CurrentClockSpeed
    # $gigahertz = $megahertz / 1000

    $MaxClockSpeed = (Get-CimInstance CIM_Processor).MaxClockSpeed
    $ProcessorPerformance = (Get-Counter -Counter "\Processor Information(_Total)\% Processor Performance").CounterSamples.CookedValue
    $CurrentClockSpeed = ($MaxClockSpeed*($ProcessorPerformance/100)/1000).ToString("0.00")
    return @{
        title     = "CPU"
        CurrentClockSpeed = $CurrentClockSpeed
        content   = "Intel i5-12400 @ ${CurrentClockSpeed}GHz"
    }
}

# Configure which disks are shown
# $ShowDisks = @("C:", "D:")
# Show all available disks
# $ShowDisks = @("*")

# Configure which package managers are shown
# disabling unused ones will improve speed
# $ShowPkgs = @("winget", "scoop", "choco")
# $ShowPkgs = @("choco")

# Use the following option to specify custom package managers.
# Create a function with that name as suffix, and which returns
# the number of packages. Two examples are shown here:
# $CustomPkgs = @("cargo", "just-install")
# function info_pkg_cargo {
#     return (cargo install --list | Where-Object {$_ -like "*:" }).Length
# }
# function info_pkg_just-install {
#     return (just-install list).Length
# }

# Configure how to show info for levels
# Default is for text only.
# 'bar' is for bar only.
# 'textbar' is for text + bar.
# 'bartext' is for bar + text.
$cpustyle = 'bartext'
$memorystyle = 'bartext'
$diskstyle = 'bartext'
# $batterystyle = 'bartext'


# Remove the '#' from any of the lines in
# the following to **enable** their output.

@(
    # "title"
    "custom_title"

    "blank"
    "dashes"
    "blank"

    "custom_OS"
    "pwsh"
    "uptime"
    # "pkgs"
    # "custom_time"

    "blank"
    "dashes"
    "blank"
    
    "custom_cpu"
    "gpu"
    "resolution"
    # "cpu"
    
    "blank"
    "cpu_usage"
    "disk"
    "memory"

    "blank"
    # "colorbar"
    # "computer"
    # "kernel"
    # "motherboard"
    # "custom_time"  # use custom info line
    # "ps_pkgs"  # takes some time
    # "terminal"
    # "theme"
    # "cpu_usage"
    # "battery"
    # "locale"
    # "weather"
    # "local_ip"
    # "public_ip"
)
