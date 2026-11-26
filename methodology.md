# Troubleshooting Methodology

My standard order of work on any broken server. I follow it every time so I
do not skip steps under pressure.

## 0. Read the task carefully
- What exactly is "fixed"? What is the success condition?
- What must NOT be changed?

## 1. Orient
```bash
whoami; hostname; uptime
cat /etc/os-release
history | tail -20
```

## 2. Services
```bash
systemctl status <service>
systemctl --failed
journalctl -u <service> -n 50 --no-pager
journalctl -p err -b --no-pager | tail -50
```

## 3. Resources
```bash
df -h          # disk space
df -i          # inodes
free -m        # memory
top -b -n1 | head -20
```

## 4. Network
```bash
ss -tlnp                 # who listens where
ip a; ip route
curl -v http://localhost:<port>
dig <name>; cat /etc/resolv.conf
```

## 5. Files and permissions
```bash
ls -la <path>
namei -l <path>          # permission of every path component
stat <file>
lsof +L1                 # deleted files still held open
```

## 6. Configuration
```bash
nginx -t
apachectl configtest
sshd -t
```

## 7. Fix, then verify
- Make the smallest change that works
- Re-test the original symptom
- Check logs again for new errors

## 8. Write it down
- Root cause in one sentence
- What would have prevented it (monitoring, validation, runbook)
