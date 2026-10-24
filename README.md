# pi-server

Raspberry Pi 4 home server: setup notes, scripts and fixes.
## Firewall
ufw: deny all incoming except SSH from the LAN (192.168.0.0/24).
## Hardening
- fail2ban: sshd jail, systemd backend (trixie has no auth.log),
5 retries, 1h ban. Config: /etc/fail2ban/jail.local
- unattended-upgrades: daily automatic security updates
## DOCKER
Installed from Docker's official Debian repo; user added to the docker group.

## Public access
Tailscale Funnel exposes localhost:8080 at https://<host>.ts.net
No router ports opened. Postgres is never exposed.
## Backups

backup.sh dumps the books database nightly at 03:30 (cron) to ~/backups,
gzipped, keeping 14 days. Log: ~/backups/backup.log
## UPS shutdown (NUT)
Standalone mode, UPS "ippon" over USB (driver from nut-scanner).
upsmon shuts the Pi down when the UPS reports low battery.
Check status: upsc ippon@localhost
Config in /etc/nut; the password lives only there, never in this repo.
