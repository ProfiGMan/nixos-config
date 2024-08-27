{
  programs.nixvim = {
    enable = true;

    defaultEditor = true;
    colorschemes.oxocarbon.enable = true;
    clipboard.register = "unnamedplus";

    opts = {
      number = true;
      relativenumber = true;
    };

    keymaps = [
      {
        key = "<C-d>";
	action = "<C-d>zz";
      }

      {
        key = "<C-u>";
	action = "<C-u>zz";
      }

      {
        key = "n";
	action = "nzz";
      }

      {
        key = "N";
	action = "Nzz";
      }
    ];

    plugins = {
      lualine.enable = true;
    };
  };
}
