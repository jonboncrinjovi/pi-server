# pi-server

Raspberry Pi 4 home server: setup notes, scripts and fixes.
## Firewall
ufw: deny all incoming except SSH from the LAN (192.168.0.0/24).
## Hardening
- fail2ban: sshd jail, systemd backend (trixie has no auth.log),
5 retries, 1h ban. Config: /etc/fail2ban/jail.local
- unattended-upgrades: daily automatic security updates
