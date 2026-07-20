-- ifg apps

hl.on("hyprland.start", function()
    -- backups
    hl.exec_cmd(run_app .. " syncthingtray-qt6 --wait")
    -- password manager
    hl.exec_cmd(run_app .. " bitwarden-desktop")
    -- XPPen drawing table
    -- hl.exec_cmd(run_app .. ' QT_QPA_PLATFORM="xcb" /usr/lib/pentablet/PenTablet.sh /mini')
end)