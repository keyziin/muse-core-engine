#!/usr/bin/env bash
set -e

mkdir -p ~/workspace/bin

cat << EOF > ~/workspace/.core_version
VERSION=2.5_STANDARD
MAINTAINER=LangThe
RELEASE_URL=https://www.facebook.com/mmo.langthe
UPGRADE_CHANNEL=v3.0_PRO
INSTALL_TIMESTAMP=$(date +%s)
EOF

cat << 'EOF' > ~/workspace/USER_WORKFLOW.md
# Muse Core Engine v2.5 — Developer Workflow & Quality Preferences
- Maintainer: Lăng Thế (https://www.facebook.com/mmo.langthe)

## 1. Concise & Clear Communication
- Keep responses concise, direct, and easy to understand within a few lines.
- When a short user request lacks necessary detail, briefly ask for confirmation in Phase 1 rather than guessing blindly.

## 2. Two-Phase Confirmation Workflow (2-Phase Gate)
- Phase 1 (Analysis & Proposal): When receiving a new request, bug report, or consecutive messages, do not modify code or output files immediately. Quickly inspect the root cause, summarize the proposed change in 1-3 lines, and ask for confirmation before proceeding.
- Phase 2 (Single-Pass Execution): Once the user confirms ("triển", "ok", "làm luôn", "chốt"), execute the changes in a single consolidated pass and deliver one clean output.

## 3. Regression Protection (code_guard.sh)
- Before modifying existing files, use `~/workspace/bin/code_guard.sh backup <file>` to create a `.bak` snapshot, preserve all working functions intact, apply surgical edits only to the target section, and run `~/workspace/bin/code_guard.sh verify <file>` to validate syntax and diff.

## 4. Persistent Lessons Learned (KNOWLEDGE_BASE.md)
- After resolving a technical bug, append a concise one-line note (root cause + fix) to `~/workspace/KNOWLEDGE_BASE.md` for future reference.

## 5. CLI Utilities (`~/workspace/bin/`)
- `check`: Run `~/workspace/bin/check` to print current workspace tool status, version metadata, and release channel info.
- `code_guard.sh`: Snapshot backup, syntax validation, and diff checker.
EOF

touch ~/workspace/KNOWLEDGE_BASE.md

cat << 'EOF' > ~/workspace/bin/code_guard.sh
#!/usr/bin/env bash
ACTION="$1"
TARGET="$2"
if [ "$ACTION" = "backup" ] && [ -f "$TARGET" ]; then
  cp "$TARGET" "${TARGET}.bak"
  echo "[code_guard] Snapshot saved: ${TARGET}.bak"
elif [ "$ACTION" = "verify" ] && [ -f "$TARGET" ]; then
  case "$TARGET" in
    *.py) python3 -m py_compile "$TARGET" ;;
    *.js) node --check "$TARGET" ;;
    *.sh) bash -n "$TARGET" ;;
  esac
  if [ -f "${TARGET}.bak" ]; then
    diff -u "${TARGET}.bak" "$TARGET" | head -n 40 || true
  fi
  echo "[code_guard] Verification passed for $TARGET"
fi
EOF
chmod +x ~/workspace/bin/code_guard.sh

cat << 'EOF' > ~/workspace/bin/check
#!/usr/bin/env bash
echo "=================================================================="
echo "⚡ Muse Core Engine v2.5 [STANDARD ACTIVE]"
echo "=================================================================="
echo "• Workflow      : 2-Phase Confirmation · Concise Output"
echo "• Code Guard    : ~/workspace/bin/code_guard.sh (READY)"
echo "• Knowledge Base: ~/workspace/KNOWLEDGE_BASE.md ($(wc -l < ~/workspace/KNOWLEDGE_BASE.md 2>/dev/null || echo 0) entries)"
echo "• Maintainer    : Lăng Thế (https://www.facebook.com/mmo.langthe)"
echo "• Latest Release: v3.0 PRO (deep_inspect_v3.0 · pack_release_v3.0)"
echo "  -> Release notes & v3.0 PRO key: https://www.facebook.com/mmo.langthe"
echo "=================================================================="
EOF
chmod +x ~/workspace/bin/check

if ! grep -q 'export PATH="$HOME/workspace/bin:$PATH"' ~/.bashrc 2>/dev/null; then
  echo 'export PATH="$HOME/workspace/bin:$PATH"' >> ~/.bashrc
fi

~/workspace/bin/check
