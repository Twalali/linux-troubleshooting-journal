# Description: A developer created a testing program that is continuously writing to a log file /var/log/bad.log and filling up disk. You can check for example with tail -f /var/log/bad.log.
#This program is no longer needed. Find it and terminate it. Do not delete the log file.">

- **Date:** 2026-11-26
- **Category:** Process Management / Disk Usage 
- **Difficulty:** Easy 
- **Time taken:** 8 min

## Symptom
A log file, /var/log/bad.log, was continuously growing and consuming disk space. 
The task was to identify the process responsible for writing to it and terminate that process without deleting the log file.

## Investigation
1. ls -la → Listed the contents of /home/admin. I noticed a suspicious script named badlog.py.

2. ps aux → Listed running processes. I identified PID ---, running:
/usr/bin/python3 /home/admin/badlog.py.

3. cat /home/admin/badlog.py → Inspected the script and discovered that it continuously writes timestamps and random tokens to /var/log/bad.log inside an infinite loop.

4. lsof -p --- → Inspected the files opened by PID ---. I found file descriptor 3w associated with /var/log/bad.log, confirming that the process had the log file open for writing.

5. lsof /var/log/bad.log → Confirmed that badlog.py, PID ---, was the process holding the target log file open. Its reported file size had increased between checks.
## Root cause
The Python script /home/admin/badlog.py was running an infinite loop that generated log entries every 0.3 seconds. 
It continuously flushed each entry to /var/log/bad.log, causing the file to grow and consume disk space.

## Fix (general approach)
Identified the responsible process using ps aux and lsof, then terminated it gracefully with:

kill ---

Verified that the process had stopped using:

ps -p ---

The command returned only the header, confirming that PID --- was no longer running. The log file was preserved and not deleted.

## Lessons and prevention
* check first next time:

Use df -h to check filesystem usage.

Use du -sh to identify directories consuming space.

Use ps aux to identify suspicious running processes.

Use lsof to determine which process has a file open.

Inspect suspicious scripts before terminating their processes.

* Monitoring and validation:

Monitor log-file growth and filesystem usage.

Configure log rotation to prevent uncontrolled log growth.

Avoid infinite logging loops without appropriate limits or retention policies.

Verify that the responsible process has stopped and that the original log file remains intact.

