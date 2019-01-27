#! /bin/bash

## Variable declarations
username="test"
uid="510"
name="TEST"
## As seen from defaults read of ShadowHashData
hash="( <62706c69 73743030 d2010203 0a5f101e 5352502d 52464335 3035342d 34303936 2d534841 3531322d 50424b44 46325f10 1453414c 5445442d 53484135 31322d50 424b4446 32d30405 06070809 58766572 69666965 72547361 6c745a69 74657261 74696f6e 734f1102 00d97dbf 77cbabb2 09a94853 aa1d7c46 4c7f1732 aac168ce 651a220a 9b9dc227 c19a2833 2e86e0c1 be1a8800 9147e64f 86c03fa4 9008ad28 386183a0 11a9e5ba 33dba835 cebd35a0 b66e94c5 243d288f a61aeca1 e824df42 b5578b14 b3643421 ae1b0ba3 6d94ac39 9e1eeb55 9c360172 99560e08 a5eb2811 3d69e444 19a827b8 fb5a702b 383fd5c5 f075f848 e68f42b3 10b25f5b e4820799 1a7dbfee 7594b88d 8960f541 dfa0034d 2167d00b 4e0079a7 7eb961ce fa5349cc c90ee26f 62e0682c 85534444 34d93e8a aa805a89 034a7fda 3bd70b65 f003397d f748f981 9bf1f466 1e264694 1d0cb815 c0e6519b 47e4c1c8 6bb8ba1c 2f827feb 170a639b ea54d9a1 1ab944c4 c920ed29 6e43c5e8 aafa60b5 786acd73 b5d02944 fe3bd6da de7cdd38 35724de4 5d1524fa b5806868 24d10628 243128b6 677bd4f4 4fb590fc 0fa914c8 60991021 0dd81ae7 8aca38f5 e630fda6 5cb64275 6c26a044 9b9096c2 ce2db19b ee88497a e1e9f187 9df5b819 bff7078a e2878d36 2ca9d9a3 f8edbad0 ef4ae131 47274b99 572c6e4e 07981f5e f4020177 22cea323 9c6e09b6 f9b97d89 42eef080 44774d54 e0e9d960 a261d018 f0c67d00 e621753d 3fb4116f 6f2b5fd4 7fcef62c ca494f6e 3477e045 666e59e0 25c6b24d 8cf585c3 39931e74 201cd0ba a82a30a4 1679e5a8 608c5243 8c2addd9 0a03a812 80ac197c 3231684e e87dee1d c21b7380 214f1020 685ef745 af414fb6 d1aebbf1 c4ef86d8 1bdc665f 2d10fe37 1fb8a81d 1c7e655b 11c44bd3 0b05060c 0d0e5765 6e74726f 70794f10 80bbe292 06a3ab76 302a19ed b943dae6 d546da9a b3571721 6e36316b 637cf5c0 d17a14e7 a63dd9c5 a4dedc56 040dbe31 95bc2477 a99f7de9 65f28ce4 51fddefe cfbcf0af 2ab5f4e3 0be88f65 05d8b728 4fa054f7 137b7b64 a532bb8b c2215b7e edc9abf0 b3b123cd 5ceecc15 832b5435 79fb6daf 34529398 9991f6a7 94da81ca 3c4f1020 34bd352f 88914ca5 c23f17bc 26bde1b8 3852b858 40bc8812 b5355bd5 aa8d1f52 1164ad00 08000d00 2e004500 4c005500 5a006502 69028c02 8f029602 9e032103 44000000 00000002 01000000 00000000 0f000000 00000000 00000000 00000003 47> )"

## Verify the user doesn't exist
if [[ -f /var/db/dslocal/nodes/Default/users/$username.plist ]]
then
	## If the user is there exit 1
	exit 1
else
	## Make a home folder
	mkdir /Users/$username
	
	## dscl make user
	dscl . -create /Users/$username
	dscl . -create /Users/$username NFSHomeDirectory /Users/$username 
	dscl . -create /Users/$username UserShell /bin/bash
	dscl . -create /Users/$username RealName "$name"
	dscl . -create /Users/$username UniqueID $uid
	dscl . -create /Users/$username PrimaryGroupID 20
	dscl . -passwd /Users/$username temp
	dscl . -append /groups/admin GroupMembership $username
	
	## Wait for OS to catch up
	sleep 0.5
	
	## Write the actual password to the user as a hash
	defaults write /var/db/dslocal/nodes/Default/users/$username.plist ShadowHashData "$hash"
	
fi
	

exit 0
