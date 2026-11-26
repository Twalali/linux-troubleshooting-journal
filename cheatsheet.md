# Command Cheatsheet

## Logs
| Task | Command |
|------|---------|
| Service logs | `journalctl -u NAME -n 100 --no-pager` |
| Follow logs | `journalctl -u NAME -f` |
| Errors this boot | `journalctl -p err -b` |
| Kernel messages | `dmesg -T \| tail -50` |

## Processes
| Task | Command |
|------|---------|
| Find process | `ps aux \| grep NAME` |
| Open files of PID | `lsof -p PID` |
| Who uses a port | `ss -tlnp \| grep :PORT` |
| Kill gracefully | `kill PID` then `kill -9 PID` only if needed |

## Disk
| Task | Command |
|------|---------|
| Space by filesystem | `df -h` |
| Inodes | `df -i` |
| Biggest directories | `du -xh / --max-depth=2 2>/dev/null \| sort -h \| tail` |
| Deleted but open files | `lsof +L1` |

## Network
| Task | Command |
|------|---------|
| Listening sockets | `ss -tlnp` |
| Test HTTP | `curl -I http://localhost` |
| DNS lookup | `dig example.com` |
| Firewall rules | `iptables -L -n -v` or `nft list ruleset` |

## Permissions
| Task | Command |
|------|---------|
| Permissions of full path | `namei -l /path/to/file` |
| Change owner | `chown user:group file` |
| SELinux/AppArmor | `getenforce`, `aa-status` |

## Docker
| Task | Command |
|------|---------|
| Containers | `docker ps -a` |
| Logs | `docker logs NAME --tail 50` |
| Inspect | `docker inspect NAME` |
