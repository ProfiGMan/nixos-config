{
  services.keyd = {
    enable = true;
    keyboards = {
      # The name is just the name of the configuration file, it does not really matter
      default = {
        ids = [ "*" ]; # what goes into the [id] section, here we select all keyboards
        # Everything but the ID section:
        settings = {
          # The main layer, if you choose to declare it in Nix
          main = {
            # capslock = "layer(control)"; # you might need to also enclose the key in quotes if it contains non-alphabetical symbols
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
	  };
        };
        extraConfig = ''
          # put here any extra-config, e.g. you can copy/paste here directly a configuration, just remove the ids part
        '';
      };
    };
  };
}
