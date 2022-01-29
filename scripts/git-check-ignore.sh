find . -type d | grep -v .git | awk '{print $1"/"}' | git check-ignore -v --stdin

