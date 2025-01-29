# Shell Script Globbing Bug

This repository demonstrates a common error in shell scripts involving the use of globbing (wildcard expansion) with filenames containing special characters.  The `bug.sh` script showcases the problem, while `bugSolution.sh` provides the corrected version.

The issue arises when filenames themselves contain characters that are also used for globbing (like `*` or `?`).  Incorrect handling of these filenames can lead to unexpected file processing or errors.

This example highlights the importance of proper quoting and escaping when dealing with filenames in shell scripts, especially those that may be dynamically generated or come from external sources.