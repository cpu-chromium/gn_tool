$guzip = $PSScriptRoot + "\gsutil.zip"
$gsutil =$PSScriptRoot + "\gsutil\gsutil.py"

If (-Not (Test-Path $gsutil)) {
    del $guzip
    Invoke-WebRequest https://commondatastorage.googleapis.com/pub/gsutil.zip -OutFile $guzip
    Add-Type -assembly "system.io.compression.filesystem"
    [io.compression.zipfile]::ExtractToDirectory($guzip, $PSScriptRoot);
    python "$gsutil" --version
}

mkdir ./mac -Force
mkdir ./linux -Force
mkdir ./win -Force

# https://chromium.googlesource.com/chromium/buildtools/+/master/win/gn.exe.sha1
python "$gsutil" cp gs://chromium-gn/1380b36db64aace2523d6bea32c59e48a51c82a4 win/gn.exe

# https://chromium.googlesource.com/chromium/buildtools/+/master/mac/gn.sha1
python "$gsutil" cp gs://chromium-gn/a68b194afb05d6a6357cf2e2464136ed7723c305 mac/gn

# https://chromium.googlesource.com/chromium/buildtools/+/master/linux64/gn.sha1 
python "$gsutil" cp gs://chromium-gn/4e3a214794b25c37e57b8c690c0b24daa631a420 linux/gn

