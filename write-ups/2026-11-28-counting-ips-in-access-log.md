# Counting requests per IP in a web server log

- **Date:** 2026-11-28
- **Category:** bash / log analysis
- **Difficulty:** Easy
- **Time taken:** 6 min

## Symptom
Needed to find which client IP made the most requests in a web server
access log and record it in a file.

## Investigation
1. `head -n 5 access.log` -> confirmed this is a standard access log and
   the client IP is the first column
2. `awk '{print $1}' access.log | sort | uniq -c | sort -rn | head -5`
   -> ranked IPs by request count; the top one was clearly ahead of the
   second, so there was no tie
3. Wrote only the IP (without the count) into the answer file with `echo`
4. Verified the result with `sha1sum` and the platform check

## Root cause
Not a fault: a log analysis task. The key idea is that `uniq -c` only
counts adjacent duplicates, so the input must be sorted first.

## Fix (general approach)
Extract the column, sort, count, sort by count descending, take the top
entry, and save only the IP.

## Mistake and lesson
I ran my verification `grep` before creating the answer file, so the
command expanded to an empty pattern and returned 0. The solution was
correct; the order of my commands was wrong. Lesson: write the result
first, then verify it, and read a surprising output before assuming the
answer is wrong.

## Lessons and prevention
- Always `sort` before `uniq -c`
- Strip the count before writing the result to a file
- Anchor greps (`^IP `) to avoid substring matches
- The same pipeline works for status codes (`$9`) or URLs (`$7`)
- In production, this is a quick way to spot abusive clients or a
  DDoS source
