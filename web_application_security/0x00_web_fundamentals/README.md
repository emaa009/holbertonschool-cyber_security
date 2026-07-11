# Web Application Security - 0x00 Web Fundamentals

## Description

This project explores web application security vulnerabilities through hands-on exploitation of a intentionally vulnerable web application hosted at `http://web0x00.hbtn`.

## Target

- **Endpoint:** `http://web0x00.hbtn/login`
- **Application:** Holberton School Customer Support Dashboard

## Setup

### Requirements
- Kali Linux 2023.3
- curl 8.3.0+
- sqlmap 1.7.10+
- Firefox Browser
- OpenVPN (Holberton Network Access)

### Configuration

1. Connect to the VPN:
```bash
sudo openvpn holberton.ovpn
```

2. Add target to hosts file:
```bash
sudo bash -c "echo '<Target_IP> web0x00.hbtn' >> /etc/hosts"
```

3. Verify connectivity:
```bash
curl http://web0x00.hbtn
```

## Vulnerabilities Covered

- SQL Injection (SQLi)
- Cross-Site Scripting (XSS)
- CRLF Injection
- Host Header Injection

## Author

Holberton School - Cyber Security Track
