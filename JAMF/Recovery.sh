#! /bin/bash

## +[DiskEncryptionPayloadParser parsePayloadsFromXML:]:
JSSDiskEncryptionConfigurationID="$4"

personalKey=$(recovery=$(fdesetup changerecovery -personal); echo $recovery | cut -d "'" -f2)

function prepareRecoveryForJSS
{
	##  -[FileVaultSetupWrapper deferFilePath]
	cat <<EOD > "/Library/Application Support/JAMF/run/file_vault_2_id.xml"
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
    <dict>
        <key>FV2_ID</key>
        <string>${JSSDiskEncryptionConfigurationID}</string>
    </dict>
</plist>
EOD
	## -[BaseEncryptionPayload submitKeytoJss]:
	cat <<EOF > "/Library/Application Support/JAMF/run/file_vault_2_recovery_key.xml"
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
    <dict>
        <key>RecoveryKey</key>
        <string>${personalKey}</string>
    </dict>
</plist>
EOF

}

prepareRecoveryForJSS

jamf recon

exit 0