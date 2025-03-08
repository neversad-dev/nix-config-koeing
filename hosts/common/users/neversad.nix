{
  config,
  pkgs,
  inputs,
  ...
}:{
  users.users.neversad = {
    initialHashedPassword = "$y$j9T$JPo6qXo7wfQUVQzw6ypSp0$HmJSkGSd8XjRPMifbgho6lbuWzqqXtJWiwl8XnmCPJ3";
    isNormalUser = true;
    description = "neversad";
    extraGroups = [
      "wheel"
      "networkmanager"
      "libvirtd"
      "flatpak"
      "audio"
      "video"
      "plugdev"
      "input"
      "kvm"
      "qemu-libvirtd"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJVsSOgz45KiRctwTGpWbGowBFp4T3a8X7LUh5mD4Kdl o.novosad.reg@gmail.com"
    ];
    packages = [inputs.home-manager.packages.${pkgs.system}.default];
  };
  home-manager.users.neversad =
     import ../../../home/neversad/${config.networking.hostName}.nix;

}
