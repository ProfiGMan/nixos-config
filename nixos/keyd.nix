{
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ]; 
        settings = {
          main = {
	    tab = "overload(vimAnywhere, tab)";
	    capslock = "overload(meta, esc)";
	    space = "overloadt(control, space, 300)";
	    "leftshift+rightshift" = "capslock";
          };
          vimAnywhere = {
	    k = "up";
	    j = "down";
	    h = "left";
	    l = "right";
	    w = "macro(leftcontrol+right)";
	    b = "macro(felftcontrol+left)";
	    u = "pageup";
	    d = "pagedown";
	    e = "tab";
	    "0" = "home";
	    "shift+4" = "end";
	  };
	  "vimAnywhere+shift" = {
	    "4" = "end";
	  };
        };
      };
    };
  };
}
