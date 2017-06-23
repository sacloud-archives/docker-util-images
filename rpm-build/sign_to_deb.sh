#!/bin/sh

# import private key
if [ -n "$GPG_PRIVATE_KEY" ]; then
    echo -e "$GPG_PRIVATE_KEY" | gpg2 --import
fi

# start gpg-agent
eval $(gpg-agent --allow-preset-passphrase --daemon -q)

# set pashphrase
if [ -n "$GPG_PASSPHRASE" -a -n "$GPG_FINGERPRINT" ]; then
    /usr/libexec/gpg-preset-passphrase --passphrase="$GPG_PASSPHRASE" --preset "$GPG_FINGERPRINT"
fi

gpg -s -b -a --batch --no-verbose --no-armor --use-agent --no-secmem-warning -u "$GPG_NAME" --digest-algo SHA256 -o Release.gpg Release
