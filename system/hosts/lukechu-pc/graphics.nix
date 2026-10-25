{ config, pkgs, ... }:

{
  # Hardware Video Acceleration using VA-API.
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [ intel-media-driver ];
  };
  environment.variables.LIBVA_DRIVER_NAME = "iHD";

  services.xserver.videoDrivers = [
    "modesetting"
    "nvidia"
  ];

  # GTX 1060 is not supported by the new open source NVIDIA kernel driver.
  # Only supported by the legacy 580 series driver.
  hardware.nvidia.open = false;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.legacy_580;

  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.powerManagement.enable = true;
  hardware.nvidia.prime = {
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";

    offload.enable = true;
    offload.enableOffloadCmd = true;
  };
}
