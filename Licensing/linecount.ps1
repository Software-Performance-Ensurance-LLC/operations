# Navigate to the solution directory first
# Example: cd "C:\Path\To\Solution"

param(
    [string]$Path = "."
)

# Resolve the full path
$ResolvedPath = Resolve-Path $Path

# Count lines of C# code in all .cs files
Get-ChildItem -Path $ResolvedPath -Recurse -Filter *.cs | ForEach-Object {
    (Get-Content $_.FullName) -match '\S'
} | Measure-Object | Select-Object -ExpandProperty Count
