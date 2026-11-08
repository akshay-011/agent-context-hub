---
scope: stack
globs: "**/*.{conf,sh,qml,cpp}"
description: Omarchy Linux desktop, Hyprland window manager, and Qt/QML conventions
---
# Omarchy Linux & Hyprland Standards

- **Desktop Framework:** Omarchy user configuration lives under `~/.config/hypr/` and `~/.config/omarchy/`.
- **App Development:** Desktop applications use C++ and Qt Quick (QML) compiled via `qmake6` and `make`.
- **Display & Scaling:** Respect fractional scaling and multi-monitor boundaries without hardcoding pixel dimensions.
- **Shell & Tooling:** Use modern Linux utilities (`systemd --user`, `fish`/`bash`, standard Wayland protocols).
