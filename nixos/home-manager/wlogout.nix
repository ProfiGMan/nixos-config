{
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "hibernate";
        action = "systemctl hibernate";
        text = "Hibernate (1)";
        keybind = "1";
      }
      {
        label = "logout";
        action = "hyprctl dispatch exit 0";
        text = "Logout (2)";
        keybind = "2";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown (3)";
        keybind = "3";
      }
      {
        label = "suspend";
        action = "touch ~/.suspended & systemctl suspend";
        text = "Suspend (4)";
        keybind = "4";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot (5)";
        keybind = "5";
      }
    ];
  };
}
