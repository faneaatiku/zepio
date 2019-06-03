@echo off

SET bzedgedir=%appdata%\BZEdge
SET bzedgeconf=%bzedgedir%\bzedge.conf
SET paramsdir=%appdata%\ZcashParams
SET currentdir=%cd%

SET sprout-proving_url=https://z.cash/downloads/sprout-proving.key?a=.js?a=.js
SET sprout-verifying_url=https://z.cash/downloads/sprout-verifying.key?a=.js

SET sapling-spend_url=https://z.cash/downloads/sapling-spend.params
SET sapling-outpout_url=https://z.cash/downloads/sapling-output.params
SET sprout-groth16_url=https://z.cash/downloads/sprout-groth16.params

SET sprout-proving="%paramsdir%\sprout-proving.key"
SET sprout-verifying="%paramsdir%\sprout-verifying.key"

SET sapling-spend="%paramsdir%\sapling-spend.params"
SET sapling-outpout="%paramsdir%\sapling-output.params"
SET sprout-groth16="%paramsdir%\sprout-groth16.params"

SET sprout-proving-hash=8bc20a7f013b2b58970cddd2e7ea028975c88ae7ceb9259a5344a16bc2c0eef7
SET sprout-verifying-hash=4bd498dae0aacfd8e98dc306338d017d9c08dd0918ead18172bd0aec2fc5df82

SET sapling-spend-hash=8e48ffd23abb3a5fd9c5589204f32d9c31285a04b78096ba40a79b75677efc13
SET sapling-outpout-hash=2f0ebbcbb9bb0bcffe95a397e7eba89c29eb4dde6191c339db88570e3f3fb0e4
SET sprout-groth16-hash=b685d700c60328498fbde589c8c7c484c722b788b265b72af448a5bf0ee55b50


rem ###################################################
rem check existence of bzedgedir
if exist "%bzedgedir%" goto EXIST_bzedgeDIR
mkdir "%bzedgedir%"
:EXIST_bzedgeDIR


rem ###################################################
rem check existence of bzedge.conf
if exist "%bzedgeconf%" goto EXIST_bzedgeCONF
echo create bzedge.conf
cd "%bzedgedir%"
echo rpcuser=bzeuser > bzedge.conf
echo rpcpassword=bzepass >> bzedge.conf
echo rpcport=1980 >> bzedge.conf
cd "%currentdir%"
:EXIST_bzedgeCONF

rem ###################################################
rem check existence of paramsdir
if exist "%paramsdir%" goto EXIST_PARAMSDIR
mkdir "%paramsdir%"
:EXIST_PARAMSDIR

rem ###################################################
rem check existence of sapling-spend
if exist "%sprout-proving%" goto EXIST_PROVING

:DOWNLOAD_PROVING
rem download if it does not exist
echo start downloading sprout-proving.key
bitsadmin.exe /TRANSFER DOWNLOAD_PROVING %sprout-proving_url% %sprout-proving%

:EXIST_PROVING
rem compare hash if it exsits
echo comparing hash of sprout-proving
@FOR /F "delims=/" %%i IN ('CERTUTIL -hashfile %sprout-proving% SHA256 ^| FIND /V ":"') DO @((SET hash_sha256=%%i))
set proving_sha256=%hash_sha256: =%

if not %proving_sha256%==%sprout-proving-hash% (
echo bad hash
del /Q %sprout-proving%
goto DOWNLOAD_PROVING
)
:END_PROVING

rem ###################################################
rem check existence of sprout-verifying
if exist %sprout-verifying% goto EXIST_VERIFYING

:DOWNLOAD_VERIFYING
rem download if it does not exist
echo start downloading sprout-verifying.key
bitsadmin.exe /TRANSFER DOWNLOAD_VERIFYING %sprout-verifying_url% %sprout-verifying%

:EXIST_VERIFYING
rem compare hash if it exsist
echo comparing hash of sprout-verifying
@FOR /F "delims=/" %%i IN ('CERTUTIL -hashfile %sprout-verifying% SHA256 ^| FIND /V ":"') DO @((SET hash_sha256=%%i))
set verifying_sha256=%hash_sha256: =%

if not %verifying_sha256%==%sprout-verifying-hash% (
echo bad hash
del /Q %sprout-verifying%
goto DOWNLOAD_VERIFYING
)
:END_VERIFYING

rem ###################################################
rem check existence of sapling-spend
if exist %sapling-spend% goto EXIST_SPEND

:DOWNLOAD_SPEND
rem download if it does not exist
echo start downloading sapling-spend.params
bitsadmin.exe /TRANSFER DOWNLOAD_SPEND %sapling-spend_url% %sapling-spend%

:EXIST_SPEND
rem compare hash if it exsist
echo comparing hash of sapling-spend
@FOR /F "delims=/" %%i IN ('CERTUTIL -hashfile %sapling-spend% SHA256 ^| FIND /V ":"') DO @((SET hash_sha256=%%i))
set verifying_sha256=%hash_sha256: =%

if not %verifying_sha256%==%sapling-spend-hash% (
echo bad hash
del /Q %sapling-spend%
goto DOWNLOAD_SPEND
)
:END_SPEND

rem ###################################################
rem check existence of sapling-outpout
if exist %sapling-outpout% goto EXIST_OUTPOUT

:DOWNLOAD_OUTPOUT
rem download if it does not exist
echo start downloading sapling-outpout.params
bitsadmin.exe /TRANSFER DOWNLOAD_OUTPOUT %sapling-outpout_url% %sapling-outpout%

:EXIST_OUTPOUT
rem compare hash if it exsist
echo comparing hash of sapling-outpout
@FOR /F "delims=/" %%i IN ('CERTUTIL -hashfile %sapling-outpout% SHA256 ^| FIND /V ":"') DO @((SET hash_sha256=%%i))
set verifying_sha256=%hash_sha256: =%

if not %verifying_sha256%==%sapling-outpout-hash% (
echo bad hash
del /Q %sapling-outpout%
goto DOWNLOAD_OUTPOUT
)
:END_OUTPOUT

rem ###################################################
rem check existence of sprout-groth16
if exist %sprout-groth16% goto EXIST_GROTH16

:DOWNLOAD_GROTH16
rem download if it does not exist
echo start downloading sprout-groth16.params
bitsadmin.exe /TRANSFER DOWNLOAD_GROTH16 %sprout-groth16_url% %sprout-groth16%

:EXIST_GROTH16
rem compare hash if it exsist
echo comparing hash of sprout-groth16
@FOR /F "delims=/" %%i IN ('CERTUTIL -hashfile %sprout-groth16% SHA256 ^| FIND /V ":"') DO @((SET hash_sha256=%%i))
set verifying_sha256=%hash_sha256: =%

if not %verifying_sha256%==%sprout-groth16-hash% (
echo bad hash
del /Q %sprout-groth16%
goto DOWNLOAD_GROTH16
)
:END_GROTH16

rem ###################################################
echo.
echo Initialization completed.
echo Your username and password can be found in "%bzedgeconf%".
echo It is advised to change default username and password !
echo.
@pause
