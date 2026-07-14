#!/usr/bin/env bash
# claude-popup.sh — open Claude Code in a zellij floating pane.
#
# Persistence is handled by Claude Code's OWN session: `--resume` opens the
# conversation picker so you choose which chat to reopen for this directory.
# If there is nothing to resume, it falls back to a fresh session.
#
# The popup itself is just a zellij floating pane — minimize/restore it with
# your pane-mode `w` (ToggleFloatingPanes) / Alt+f. No separate zellij session.
# NOTE: the first claude is NOT exec'd — if it exits non-zero (e.g. nothing to
# resume, or "start new conversation" chosen from the --resume picker),
# control returns here and we fall back to a fresh session, keeping bypass.
claude --dangerously-skip-permissions --resume 2>/dev/null || exec claude --dangerously-skip-permissions
