# Usage:
# "pre_install": [
#     "Persist-File 'settings'"
# ]
#
# or:
# "pre_install": [
#    Persist-Files @('file1', 'file2')"
# ]


function Persist-File {
    param(
        [Parameter(Mandatory)]
        [string]$Name
    )

    $path = Join-Path $dir $Name

    if (-not (Test-Path $path)) {
        New-Item -Path $path -ItemType File | Out-Null
    }
}

function Persist-Files {
    param(
        [Parameter(Mandatory)]
        [string[]]$Names
    )

    foreach ($name in $Names) {
        Persist-File $name
    }
}
