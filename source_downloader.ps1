
# We create the variables that will handle the data
$url = "https://github.com/firehol/blocklist-ipsets/archive/master.zip"
$filename = "C:\Users\$env:UserName\Downloads\R\master_blocklist-ipsets.zip"
$destinationFolder = "C:\Users\$env:UserName\Downloads\R\master_blocklist-ipsets"

# We create the folder without even if the path doesn't exist (shouldn't fail)
New-Item -ItemType Directory -Force -Path $destinationFolder

# We choose the protocol TLS 1.2 since by default powershell uses 1.0 and it gives issues.
[Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12
$webClient = new-object System.Net.WebClient
$webClient.DownloadFile( $url, $filename)

# We unzip the file and save it to a folder.
Expand-Archive $filename -DestinationPath $destinationFolder
