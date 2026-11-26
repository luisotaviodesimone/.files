#!/usr/bin/env bash
# Runs after tmux-resurrect restores: removes the empty panes left where the
# workmux sidebar was and starts the real sidebar again.
# ponytail: identifies sidebar panes by the saved command ("workmux"); session names containing "." break the sort
f=~/.local/share/tmux/resurrect/last
grep -qP '^pane\t.*\tworkmux\t' "$f" || exit 0 # sidebar was off when saved
awk -F'\t' '$1=="pane" && $10=="workmux" {print $2":"$3"."$6}' "$f" |
	sort -t. -k2 -rn | xargs -rn1 tmux kill-pane -t # highest index first so the indices don't shift
workmux sidebar on
