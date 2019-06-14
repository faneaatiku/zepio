@echo off

IF NOT EXIST %AppData%\Bzedge (
    mkdir %AppData%\Bzedge
)

IF NOT EXIST %AppData%\ZcashParams (
    mkdir %AppData%\ZcashParams
)

IF NOT EXIST %AppData%\Bzedge\bzedge.conf (
   (
    echo addnode=explorer.getbze.com
    echo rpcuser=username
    echo rpcpassword=password%random%%random%
    echo daemon=1
    echo showmetrics=0
    echo gen=0
) > %AppData%\Bzedge\bzedge.conf
)
