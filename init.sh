#! /bin/bash

openssl smime -verify -binary -inform PEM -in Certification.txt.asc.pkcs7 -content Certification.txt.asc -certfile Certification.txt.asc.pkcs7.cert

if [ $? -eq 0 ]; then
    gpg --import "Eason_Lu_(Main)_0xA9C46116_public.asc"
    gpg --import "Key_1_0x35E98024_public.asc"
    gpg --import "Key_2_0x9AF5FF79_public.asc"
    echo "660279E4B9E374894D7F51C31A41C324A9C46116:5:" | gpg --import-ownertrust
else
    echo "FAIL, the signature is invalid, please re-download the file."
fi
