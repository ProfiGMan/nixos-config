{
  home.file.".config/kitty/kitty.conf".text = ''
    include ~/.config/HyprV/kitty/mocha.conf
    font_family      jetbrains mono nerd font
    font_size        16
    bold_font        auto
    italic_font      auto
    bold_italic_font auto
    mouse_hide_wait  2.0
    cursor_shape     block
    url_color        #0087bd
    url_style        dotted
    map ctrl+shift+c copy_to_clipboard
    map ctrl+shift+v paste_from_clipboard
    #Close the terminal without confirmation
    confirm_os_window_close 0
    background_opacity 0.95
  '';

  home.file.".config/kitty/mocha.conf".text = ''
    # vim:ft=kitty

    ## name:     Catppuccin-Mocha
    ## author:   Pocco81 (https://github.com/Pocco81)
    ## license:  MIT
    ## upstream: https://github.com/catppuccin/kitty/blob/main/mocha.conf
    ## blurb:    Soothing pastel theme for the high-spirited!
    
    
    
    # The basic colors
    foreground              #CDD6F4
    background              #1E1E2E
    selection_foreground    #1E1E2E
    selection_background    #F5E0DC
    
    # Cursor colors
    cursor                  #F5E0DC
    cursor_text_color       #1E1E2E
    
    # URL underline color when hovering with mouse
    url_color               #F5E0DC
    
    # Kitty window border colors
    active_border_color     #B4BEFE
    inactive_border_color   #6C7086
    bell_border_color       #F9E2AF
    
    # OS Window titlebar colors
    wayland_titlebar_color system
    macos_titlebar_color system
    
    # Tab bar colors
    active_tab_foreground   #11111B
    active_tab_background   #CBA6F7
    inactive_tab_foreground #CDD6F4
    inactive_tab_background #181825
    tab_bar_background      #11111B
    
    # Colors for marks (marked text in the terminal)
    mark1_foreground #1E1E2E
    mark1_background #B4BEFE
    mark2_foreground #1E1E2E
    mark2_background #CBA6F7
    mark3_foreground #1E1E2E
    mark3_background #74C7EC
    
    # The 16 terminal colors
    
    # black
    color0 #45475A
    color8 #585B70
    
    # red
    color1 #F38BA8
    color9 #F38BA8
    
    # green
    color2  #A6E3A1
    color10 #A6E3A1
    
    # yellow
    color3  #F9E2AF
    color11 #F9E2AF
    
    # blue
    color4  #89B4FA
    color12 #89B4FA
    
    # magenta
    color5  #F5C2E7
    color13 #F5C2E7
    
    # cyan
    color6  #94E2D5
    color14 #94E2D5
    
    # white
    color7  #BAC2DE
    color15 #A6ADC8
  '';
}
