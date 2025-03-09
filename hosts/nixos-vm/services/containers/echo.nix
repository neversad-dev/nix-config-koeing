{lib,  pkgs, ...}: {
  virtualisation.oci-containers.containers."echo-http-service" = {
    image = "hashicorp/http-echo";
    extraOptions = ["-text='Hello, World!'" "--network=web"];
    ports = ["5678:5678"];
  };
  system.activationScripts.createPodmanNetworkWeb = lib.mkAfter ''
    if ! ${pkgs.podman}/bin/podman network exists web; then
      ${pkgs.podman}/bin/podman network create web
    fi
  '';
}
