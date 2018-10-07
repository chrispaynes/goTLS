# goTLS
Golang HTTPS Client/Server Example

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Requirements](#requirements)
- [Quickstart](#quickstart)
- [Architecture](#architecture)
- [Todo](#todo)
- [See Also](#see-also)
- [Credits](#credits)

## Overview

Basic Go Client/Server app using TLS with local certificates signed by a local certificate authority.

## Features

- [PKI Infrastructure](https://en.wikipedia.org/wiki/Public_key_infrastructure)
- [OpenSSL](https://www.openssl.org/)
- [Traefik](https://github.com/containous/traefik)

## Requirements

  - [Docker](https://www.docker.com/)
  - [Docker-Compose](https://docs.docker.com/compose/install/)
  - [OpenSSL](https://www.openssl.org/docs/)

## Quickstart

### 1. Configure The Root Certificate Authority (CA).
#### Generate an RSA private key
```bash
$ sudo openssl genrsa -des3 -out rootCA.key 4096

    Generating RSA private key, 4096 bit long modulus
    ....................................++++
    ..........................................++++
    e is 65537 (0x010001)
    Enter pass phrase for rootCA.key: <insert passphrase>
    Verifying - Enter pass phrase for rootCA.key: <insert passphrase>
```

```
$ sudo cat rootCA.key

    -----BEGIN RSA PRIVATE KEY-----
    Proc-Type: 4,ENCRYPTED
    DEK-Info: DES-EDE3-CBC,3B43EA5DCEA3F75B

    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
    -----END RSA PRIVATE KEY-----
```

#### Create a self-signed Root CA Certificate

```bash
$ sudo openssl req -x509 -new -nodes -key rootCA.key -sha256 -days 1024 -out rootCA.pem

    Enter pass phrase for rootCA.key: <insert passphrase>
    You are about to be asked to enter information that will be incorporated
    into your certificate request.
    What you are about to enter is what is called a Distinguished Name or a DN.
    There are quite a few fields but you can leave some blank
    For some fields there will be a default value,
    If you enter '.', the field will be left blank.
    -----
    Country Name (2 letter code) [XX]:US
    State or Province Name (full name) []:NY
    Locality Name (eg, city) [Default City]:New York City
    Organization Name (eg, company) [Default Company Ltd]:Acme Labs
    Organizational Unit Name (eg, section) []:
    Common Name (eg, your name or your server's hostname) []:localhost
    Email Address []:acme@example.com
```

```bash
$ sudo cat rootCA.pem

            -----BEGIN CERTIFICATE-----
    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
    -----END CERTIFICATE-----

```

#### Move The Certificate to the Appropriate Trust Store(s)
The trust store location will differ based on your server. See [Adding trusted root certificates to the server].(https://manuals.gfi.com/en/kerio/connect/content/server-configuration/ssl-certificates/adding-trusted-root-certificates-to-the-server-1605.html)
```bash
$ sudo mv ./rootCA.pem /etc/pki/ca-trust/source/anchors/
```

#### Update The CA Trust Store
The CA Trust Updtate command will differ based on your server. See [Updating The CA Trust Store].(https://manuals.gfi.com/en/kerio/connect/content/server-configuration/ssl-certificates/adding-trusted-root-certificates-to-the-server-1605.html)
```bash
    $ sudo update-ca-trust
```

---

### 2. Create The Server Certificate
#### Create A Signing Request Configuration

```bash
$ server.csr.cnf
    [req]
    default_bits = 4096
    prompt = no
    default_md = sha256
    distinguished_name = dn


    [dn]
    C=US
    ST=NY
    L=NYC
    O=ServerLab
    OU=AL
    emailAddress=hello@server.com
    CN=acmeServer

```

#### Create a [X509 V3 Certificate Extension Configuration File](https://www.openssl.org/docs/manmaster/man5/x509v3_config.html)

```bash
$ v3.ext

    authorityKeyIdentifier=keyid,issuer
    basicConstraints=CA:FALSE
    keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
    subjectAltName = @alt_names


    [alt_names]
    DNS.1 = localhost
    DNS.2 = localhost:8443
    DNS.2 = 127.0.0.1
    DNS.3 = 127.0.0.1:8443
```

#### Create a Certificate Signing Request With A New Private Server Key
* Do not use `Sudo` for this command
```bash
$ openssl req -new -sha256 -nodes -out server.csr -newkey rsa:4096 -keyout server.key -config <( cat server.csr.cnf )

    Generating a 4096 bit RSA private key
    .................................................................++++
    .................................................................++++
    ........................................++++
    writing new private key to 'server.key'
    -----
```

```bash
$ cat server.key

    -----BEGIN PRIVATE KEY-----
    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
    d3dMEyn9zmS+TTkBCm3U5/DZhxm6/UXj
    -----END PRIVATE KEY-----
```

```bash
$ cat server.csr

    -----BEGIN CERTIFICATE REQUEST-----
    MIIEwTCCAqkCAQAwfDELMAkGA1UEBhMCVVMxCzAJBgNVBAgMAkNPMQ8wDQYDVQQH
    DAZBZGFtc0MxFTATBgNVBAoMDEFmdGVybGFiTGFiczELMAkGA1UECwwCQUwxGzAZ
    BgkqhkiG9w0BCQEWDGFjbWVAdGxzLmNvbTEOMAwGA1UEAwwFbWludHkwggIiMA0G
    CSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDeWWlXhYSis4UXh8yv3pY/N0lhyLDh
    SzJfnPJPt8qjUarvYHBhhrddehgh5XnQ5xVKXFlVOSd882TGjFpKd8meM5G0gxDc
    r+OZoYghN+wNe6brlYbdEGmv0K4LQkW0+yT38/LsRHgHhH9CNit7coy/UaDF5FYQ
    7+1cc4JCqT1pKBUeoZsp06Tk+y1Rm8SN8uDo2w+acAVy+L/O/yV2RDimQIvFAO9s
    yUSJdf6hF78oSxr83rfTK8Lv6F9d5BVGhXZ9owxvaRIunJlajcVUd8FZQp5z2uIy
    wxFSzq4sfafioNzjhufCnAG33ZkRqH54SaJu337qs01XkUHN61sIpFjj9dhPe8mn
    dfCROswij7N6P9zw1WszLB8ioQPntmhMyYS77A4Cb/+rB6xh4uffyXBsIzyZj2en
    2X55VVoDuDPSNWYtgUTqChsro+D5cpP6lCP8wqHFeJrOKb6XQzUFSX4VvWm37W8/
    xOhvaMRRU2AbXvsiZgXWsMYy/Zy//OKYHucv5xg1eSvK0SqQT7f0cYUNpEhBFQpw
    Dpbyd7fHLxQvxz2rYvRUTOxAXdf/4VB9Ae6sSlz5i64VjR6F5YlgZH0s5NRC/Wpn
    k3I/duCIYstXVH8knnSdkwtWhjho9FLZkzk/pB/NdzNaCLkQW3ie91prJ7GxNcuW
    zhq+rCp1i95x4QIDAQABoAAwDQYJKoZIhvcNAQELBQADggIBAGqMIKs57dMzfvaz
    2r3JanukjNmsUFSCJhPZdDyTdFZN3FF6ZLTCza3YVEvqR6AR3Pn97I3I8RLuamfY
    fQiRCHPPXo7FswqoeD7KuOroaWheFo34zeNbcMQccNqMQx7MlVRkIkavyhDM2Rft
    T45GP3eAmElsNQX6kcZvHHj/EoYsanz/HbIqm+OT+QP6mBfJ+eGbBtpecuHHho18
    fuNXU8SE20o3wz6aHXwxKZ46uAQYF9V2YQysCPnDEDM/McA/0QBDU5hTm3EZSYHE
    reLV7WQpfBbUnRVLHDuBvBqhcRk3XC+As6pU/eqDE3hIpGUz/GBgTFjsIp09rFaT
    Qz+LDwnr0MiOJor5oOpB/gIpAjDfvvBQL3kGKGe7nvEDxZYGLL5xVplyN0DBdNvZ
    yMLSyPaLOyQk/MHyzouLKGhtGszjp9Rn6c+nDfKf/6RM6rMIvKoICYOarKX7yOj4
    uYabOaEBATW/OjDg/km1B6T5PV/NX+Sa2dnScSO+hDf3xuiEkv3uOwhbsJj1YryX
    73AUgjovoJxWp4xLcCgv7oYCKWdMfduLKbi6L2Ek7LzfRS14F6Yj3zygnzUh5zU/
    4DM9/1ct4D/C1Tg9RNpJZZlAnKJOfKHfXIJhbZyUue92NsjGxoOQFDzNL4ZR5fw9
    JAYHRxPqGPVHcYp0fzESUO9kCQvj
    -----END CERTIFICATE REQUEST-----

```

---

### 3. Sign The Server Certificate With The Root CA
```bash
$ sudo openssl x509 -req -in server.csr -CA rootCA.pem -CAkey rootCA.key -CAcreateserial -out server.crt -days 500 -sha256 -extfile v3.ext

    Signature ok
    subject=C = US, ST = NY, L = NYC, O = ServerLab, OU = AL, emailAddress = hello@server.com, CN = acmeServer
    Getting CA Private Key
    Enter pass phrase for rootCA.key: <insert passphrase>

```

---

### 4. Read The Certificate
```bash
$ openssl x509 -in server.crt -text -noout

    Certificate:
        Data:
            Version: 3 (0x2)
            Serial Number:
                e2:8c:9f:9e:b9:ba:b9:6b
        Signature Algorithm: sha256WithRSAEncryption
            Issuer: C = US, ST = NY, L = New York City, O = Acme Labs, CN = localhost, emailAddress = acme@example.com
            Validity
                Not Before: Oct  7 20:43:40 2018 GMT
                Not After : Feb 19 20:43:40 2020 GMT
            subject=C = US, ST = NY, L = NYC, O = ServerLab, OU = AL, emailAddress = hello@server.com, CN = acmeServer
            Subject Public Key Info:
                Public Key Algorithm: rsaEncryption
                    Public-Key: (4096 bit)
                    Modulus:
                        00:de:59:69:57:85:84:a2:b3:85:17:87:cc:af:de:
                        96:3f:37:49:61:c8:b0:e1:4b:32:5f:9c:f2:4f:b7:
                        ca:a3:51:aa:ef:60:70:61:86:b7:5d:7a:18:21:e5:
                        79:d0:e7:15:4a:5c:59:55:39:27:7c:f3:64:c6:8c:
                        5a:4a:77:c9:9e:33:91:b4:83:10:dc:af:e3:99:a1:
                        88:21:37:ec:0d:7b:a6:eb:95:86:dd:10:69:af:d0:
                        ae:0b:42:45:b4:fb:24:f7:f3:f2:ec:44:78:07:84:
                        7f:42:36:2b:7b:72:8c:bf:51:a0:c5:e4:56:10:ef:
                        ed:5c:73:82:42:a9:3d:69:28:15:1e:a1:9b:29:d3:
                        a4:e4:fb:2d:51:9b:c4:8d:f2:e0:e8:db:0f:9a:70:
                        05:72:f8:bf:ce:ff:25:76:44:38:a6:40:8b:c5:00:
                        ef:6c:c9:44:89:75:fe:a1:17:bf:28:4b:1a:fc:de:
                        b7:d3:2b:c2:ef:e8:5f:5d:e4:15:46:85:76:7d:a3:
                        0c:6f:69:12:2e:9c:99:5a:8d:c5:54:77:c1:59:42:
                        9e:73:da:e2:32:c3:11:52:ce:ae:2c:7d:a7:e2:a0:
                        dc:e3:86:e7:c2:9c:01:b7:dd:99:11:a8:7e:78:49:
                        a2:6e:df:7e:ea:b3:4d:57:91:41:cd:eb:5b:08:a4:
                        58:e3:f5:d8:4f:7b:c9:a7:75:f0:91:3a:cc:22:8f:
                        b3:7a:3f:dc:f0:d5:6b:33:2c:1f:22:a1:03:e7:b6:
                        68:4c:c9:84:bb:ec:0e:02:6f:ff:ab:07:ac:61:e2:
                        e7:df:c9:70:6c:23:3c:99:8f:67:a7:d9:7e:79:55:
                        5a:03:b8:33:d2:35:66:2d:81:44:ea:0a:1b:2b:a3:
                        e0:f9:72:93:fa:94:23:fc:c2:a1:c5:78:9a:ce:29:
                        be:97:43:35:05:49:7e:15:bd:69:b7:ed:6f:3f:c4:
                        e8:6f:68:c4:51:53:60:1b:5e:fb:22:66:05:d6:b0:
                        c6:32:fd:9c:bf:fc:e2:98:1e:e7:2f:e7:18:35:79:
                        2b:ca:d1:2a:90:4f:b7:f4:71:85:0d:a4:48:41:15:
                        0a:70:0e:96:f2:77:b7:c7:2f:14:2f:c7:3d:ab:62:
                        f4:54:4c:ec:40:5d:d7:ff:e1:50:7d:01:ee:ac:4a:
                        5c:f9:8b:ae:15:8d:1e:85:e5:89:60:64:7d:2c:e4:
                        d4:42:fd:6a:67:93:72:3f:76:e0:88:62:cb:57:54:
                        7f:24:9e:74:9d:93:0b:56:86:38:68:f4:52:d9:93:
                        39:3f:a4:1f:cd:77:33:5a:08:b9:10:5b:78:9e:f7:
                        5a:6b:27:b1:b1:35:cb:96:ce:1a:be:ac:2a:75:8b:
                        de:71:e1
                    Exponent: 65537 (0x10001)
            X509v3 extensions:
                X509v3 Authority Key Identifier:
                    keyid:B1:24:88:9C:9D:6F:E3:DB:5A:62:05:AF:37:58:B7:D2:98:04:7D:D8

                X509v3 Basic Constraints:
                    CA:FALSE
                X509v3 Key Usage:
                    Digital Signature, Non Repudiation, Key Encipherment, Data Encipherment
                X509v3 Subject Alternative Name:
                    DNS:tls.server.localhost, DNS:tls.server.localhost:8443
        Signature Algorithm: sha256WithRSAEncryption
            9b:7d:02:bd:21:df:ab:0b:95:db:00:fc:73:02:8c:bf:ef:03:
            92:be:21:cb:e5:f2:51:10:7d:2b:e5:50:72:40:0a:a5:f9:9e:
            64:46:e5:71:83:e9:0f:20:c0:aa:80:35:22:88:22:3f:a7:f4:
            ae:6a:a8:3f:89:9d:47:0d:10:5c:3a:90:b3:55:63:76:cf:44:
            35:19:d9:cb:c8:0a:9c:40:26:9e:2d:20:43:0d:96:99:92:70:
            5e:4f:26:e5:eb:9b:9e:bd:b3:dc:ed:55:bc:82:02:84:59:f5:
            8b:ed:c5:c8:b2:e9:f5:0e:54:ea:67:48:9f:3c:6d:55:ee:9f:
            e7:bd:a9:82:91:31:76:9e:7c:9a:55:7e:4a:98:5d:cf:f6:b6:
            9e:c8:3b:57:02:2c:bc:89:e3:14:80:62:b3:bd:9a:ae:3c:27:
            eb:2b:b0:68:81:c5:46:c5:d8:99:fb:24:51:9a:7a:d8:35:48:
            31:8f:8c:d4:87:c2:72:13:19:ee:95:26:1d:cf:ec:ab:c1:ee:
            46:d4:74:05:95:c1:7e:21:09:44:22:34:f7:98:6d:25:a4:03:
            29:8c:b1:6d:b2:b0:5e:d7:f5:fb:8e:5b:b9:b9:f3:96:45:bd:
            84:06:f7:4f:e8:5a:81:97:7e:ce:9e:78:e1:f7:8c:9b:9b:6d:
            66:23:fe:df:84:1a:c0:09:45:38:6c:66:da:d2:6a:7c:1c:80:
            f7:ad:3f:28:b0:8a:3e:84:21:b7:2d:40:29:fa:86:29:73:53:
            17:89:71:ad:3f:1e:6b:ed:2a:0c:1f:af:53:13:f8:0c:b0:2b:
            0d:d1:be:5e:da:a4:6d:a7:78:7a:fc:39:99:a7:c8:75:e2:09:
            92:93:6b:fe:63:0d:bb:62:33:f0:07:3e:a3:9c:d9:dc:c6:85:
            f5:b5:e3:c8:45:7b:65:bf:f7:9c:cf:52:8f:2c:19:85:35:cb:
            2e:f6:b5:b6:fc:d5:4b:e4:44:ff:85:89:8b:a8:40:dc:7c:48:
            ed:68:1b:8e:7a:7b:2e:44:e1:42:63:d0:42:ee:65:22:26:cd:
            70:8f:10:16:d4:69:32:7d:62:89:2c:05:2b:af:26:8e:3a:1f:
            d0:93:5d:9a:0d:4f:09:f0:8f:f9:c5:58:27:29:ea:12:e5:74:
            49:d8:e8:ee:9f:e5:0a:fa:38:03:f5:18:4e:82:c5:79:8d:61:
            e2:f1:b2:b3:98:7b:73:5a:89:71:20:80:b2:55:d1:2f:83:be:
            8a:5a:ab:46:6e:70:61:78:bc:1f:3a:2d:6d:58:2c:e8:3b:95:
            77:38:70:03:78:43:cb:9d:63:af:12:b2:f6:16:4b:39:71:64:
            65:64:16:6b:26:9f:e9:b5

```

---

### 5. Install The Certificate In The Browser (Optional)


## Architecture
```

├── cert
│   ├── rootCA.key          -Root CA Private Key (Autogenerated)
│   ├── rootCA.pem          -Root CA Certificate (Autogenerated)
│   ├── rootCA.srl          -Root CA Serial File (Autogenerated)
│   ├── server.crt          -Server Certificate (Autogenerated)
│   ├── server.csr          -Server Certificate Signing Request
│   ├── server.csr.cnf      -Server Certificate Signing Request Configuration
│   ├── server.key          -Server Private Key
│   └── v3.ext              -Server X509 V3 Certificate Extension Configuration File
├── cmd
│   ├── client
│   │   └──main.go          -Client Connecting To TLS Server
│   └── server
│       ├── main.go         -TLS Server
│       ├── server.crt
│       └── server.key

```

## Todo
- Create Client Cert
- Configure Certs/Container to recognize and honor DNS Alt Names outside of the container
- Document Traefik Hostname Configuration

## See Also

- [mkcert](https://github.com/FiloSottile/mkcert) by [Filippo Valsorda](https://github.com/FiloSottile).
- CloudFlare's PKI toolkit, [cfssl](https://github.com/cloudflare/cfssl)
- [PKI Infrastructure](https://en.wikipedia.org/wiki/Public_key_infrastructure)
- [OpenSSL](https://www.openssl.org/)

## Credits
- [Liz Rice](https://github.com/lizrice) - [LondonGophers 19/09/2018: Liz RIce - A Go Programmer's Guide to Secure Connections](https://www.youtube.com/watch?v=OF3TM-b890E)