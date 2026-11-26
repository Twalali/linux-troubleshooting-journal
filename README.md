# Linux Troubleshooting Journal

Daily practice diagnosing and fixing broken Linux servers, using hands-on
scenarios from [SadServers](https://sadservers.com).

This repository is a **learning journal**. Each write-up explains my own
investigation process: the symptom, the commands I used, what they told me,
the root cause, and how to prevent the problem in production.

> Scenario text, answer keys and check scripts are not reproduced here.
> They belong to SadServers. Everything in this repo is written in my own words.

## Goals

- Build a repeatable troubleshooting method (see [methodology.md](methodology.md))
- Practice every day and keep a visible record of progress
- Work toward a Linux system administrator role

## Skills practiced

systemd, journald, process and resource analysis, disk and inode usage,
file permissions, networking (ports, DNS, firewall), web servers,
Docker basics, log analysis, shell scripting.

## Progress

| # | Date | Topic | Difficulty | Time | Key skills | Write-up |
|---|------|-------|-----------|------|-----------|----------|
| 1 | YYYY-MM-DD | Example topic | Easy | 10 min | df, du, lsof | [link](write-ups/_template.md) |

## Repository layout

```
.
├── README.md          Overview and progress table
├── methodology.md     My standard troubleshooting checklist
├── cheatsheet.md      Commands I use most
├── scripts/
│   └── new-writeup.sh Creates a dated write-up from the template
└── write-ups/
    └── _template.md   Template for each scenario
```

## Usage

```bash
./scripts/new-writeup.sh "service-fails-to-bind-port"
```

This creates `write-ups/YYYY-MM-DD-service-fails-to-bind-port.md`.

## Author

Twalaly - System and Network Administrator, Burundi.
