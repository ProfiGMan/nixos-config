{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$mainMod" = "SUPER";

      exec-once = [
        "swaync"
        "waybar"
	"copyq --start-server"
	"flameshot"
	"playerctld daemon"
	"hypridle"
	"hyprpaper"
	"udiskie"
      ];

      windowrulev2 = [
        "float,title:CopyQ"
      ];

      bind = [
        "$mainMod, U, exec, kitty"
	"$mainMod, I, killactive,"
	"$mainMod, C, exec, copyq toggle"
	"SHIFT $mainMod, R, exec, hyprctl reload"
	"$mainMod, space, exec, rofi -show drun"
        "$mainMod, M, exec, wlogout --protocol layer-shell "
        "$mainMod, R, exec, thunar "
        "$mainMod, V, togglefloating, "
        "$mainMod, P, pseudo, # dwindle"
        "$mainMod, O, togglesplit, # dwindle"
        "$mainMod, S, exec, flameshot gui # take a screenshot"
        # "$mainMod, T, exec, ~/.config/HyprV/hyprv_util vswitch # switch HyprV version"
        "$mainMod, D, exec, kitty --start-as=fullscreen --title btop sh -c 'btop'"
        "$mainMod, Y, exec, kitty --title yazi sh -c 'yazi'"
        "$mainMod, Q, exec, playerctl previous"
        "ALT $mainMod, W, exec, playerctl stop"
        "$mainMod, W, exec, playerctl play-pause"
        "$mainMod, E, exec, playerctl next"
        "CTRL SHIFT, Q, pass, ^(firefox)$"
        "$mainMod, F, exec, swaync-client -d "
        "$mainMod, A, exec, swaync-client -t"
        # "SHIFT, SPACE, exec, hyprctl switchxkblayout keyd-virtual-keyboard next"
        "$mainMod, G, exec, killall -SIGUSR1 waybar "
        "$mainMod, N, fullscreen"
        # "$mainMod, B, exec, ~/.config/HyprV/waybar/scripts/idle_toggle.sh toggle"


        # Manipulating windows
        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, k, movefocus, u"
        "$mainMod, j, movefocus, d"

        "$mainMod SHIFT, h, swapwindow, l"
        "$mainMod SHIFT, l, swapwindow, r"
        "$mainMod SHIFT, k, swapwindow, u"
        "$mainMod SHIFT, j, swapwindow, d"

        "ALT $mainMod, h, resizeactive, -50 0"
        "ALT $mainMod, l, resizeactive, 50 0"
        "ALT $mainMod, k, resizeactive, 0 -50"
        "ALT $mainMod, j, resizeactive, 0 50"

        "CTRL $mainMod, l, workspace, e+1"
        "CTRL $mainMod, h, workspace, e-1"

	# Switching workspaces
	"$mainMod, 1, workspace, 1"
	"$mainMod, 2, workspace, 2"
	"$mainMod, 3, workspace, 3"
	"$mainMod, 4, workspace, 4"
	"$mainMod, 5, workspace, 5"
	"$mainMod, 6, workspace, 6"
	"$mainMod, 7, workspace, 7"
	"$mainMod, 8, workspace, 8"
	"$mainMod, 9, workspace, 9"
	"$mainMod, 0, workspace, 10"

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
      ];

      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
