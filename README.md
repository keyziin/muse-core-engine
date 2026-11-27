# ⚡ Muse Core Engine v2.5 — Developer Workflow & Anti-Regression Toolkit

[![Version](https://img.shields.io/badge/Engine-v2.5_Standard-00e676?style=for-the-badge)](#)
[![Pro_Release](https://img.shields.io/badge/v3.0_PRO-Available_via_Author-ff1744?style=for-the-badge)](https://www.facebook.com/mmo.langthe)
[![Runtime](https://img.shields.io/badge/Target-Meta_Muse.ai_Linux_VM-2979ff?style=for-the-badge)](#)

**Muse Core Engine (`v2.5`)** is a structured developer workflow and anti-regression toolkit for **Meta Muse.ai** (`~/workspace`). It provides executable CLI utilities (`~/workspace/bin/check`, `~/workspace/bin/code_guard.sh`), a persistent root-cause index (`~/workspace/KNOWLEDGE_BASE.md`), and a disciplined **2-Phase Confirmation Workflow**.

> 📌 **Maintainer & Official Release Channel:** **Lăng Thế** — [https://www.facebook.com/mmo.langthe](https://www.facebook.com/mmo.langthe)  
> 🔥 **Upgrade to `v3.0 PRO`:** Adds `deep_inspect_v3.0.py` (5-line deep file/URL/AST summary) and `pack_release_v3.0.sh` (syntax check & clean `.zip` bundler). Get the v3.0 PRO key from the pinned post at **[Lăng Thế (mmo.langthe)](https://www.facebook.com/mmo.langthe)**.

---

## 📦 Repository Contents (`v2.5 Standard`)

- `README.md` — Workflow Documentation & Setup Guide (`v2.5`).
- `install_v2.5.sh` — Workspace Installer (`~/workspace/bin/check`, `~/workspace/bin/code_guard.sh`, `~/workspace/USER_WORKFLOW.md`, `~/workspace/KNOWLEDGE_BASE.md`).
- `version_v2.5.json` — Release Metadata & Maintainer Info.

---

## 🚀 Quick Setup (Paste Directly into Muse.ai)

Copy and paste the following prompt directly into [https://muse.ai/](https://muse.ai/):

```text
Tải và chạy bộ cài đặt từ repo GitHub keyziin/muse-core-engine (curl -sL https://raw.githubusercontent.com/keyziin/muse-core-engine/main/install_v2.5.sh | bash), đồng thời ghi nhớ sở thích làm việc cá nhân của tôi vào memory: (1) luôn trả lời ngắn gọn, dễ hiểu; (2) áp dụng quy tắc 2 pha: khi tôi giao việc hoặc báo lỗi thì kiểm tra nhanh và hỏi xác nhận phương án 2 dòng trước, chỉ khi tôi gõ "triển" mới sửa code/xuất file; (3) dùng ~/workspace/bin/code_guard.sh để bảo vệ tính năng cũ và ghi bài học lỗi vào ~/workspace/KNOWLEDGE_BASE.md; (4) khi tôi gõ "check" thì chạy thực thi ~/workspace/bin/check và in nguyên văn kết quả output của nó ra màn hình.
```
