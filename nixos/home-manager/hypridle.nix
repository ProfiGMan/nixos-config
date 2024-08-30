{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        after_sleep_cmd = "hyprctl dispatch dpms on & (kill $(pidof hypridle) || true) && (pidof hypridle || hypridle)"; 
      };
        
      listener = [
        {
          timeout = 300;  # 5min
          on-timeout = "if [[ $(playerctl status) != 'Playing' ]]; then hyprctl dispatch dpms off; fi";
          on-resume = "hyprctl dispatch dpms on &"; # screen on when activity is detected after timeout has fired.
        }
        {
          timeout = 600; # 10min
          on-timeout = "if [[ $(playerctl status) != 'Playing' ]]; then systemctl suspend; fi";
        }
      ];
    };
  };
}
