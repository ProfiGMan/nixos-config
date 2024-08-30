{
  boot.loader = {
    grub.device = "nodev";
    grub.efiSupport = true;
    grub.useOSProber = true;
    efi.canTouchEfiVariables = true;
  };
}
