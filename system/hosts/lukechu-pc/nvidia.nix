{ config, opts, ... }:

{
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [
    "modesetting"
    "nvidia"
  ];

  # GTX 1060 is not supported by the new open source NVIDIA kernel driver.
  hardware.nvidia.open = false;
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.powerManagement.enable = true;
  hardware.nvidia.prime = {
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";

    offload.enable = true;
    offload.enableOffloadCmd = true;
  };

  boot.kernelParams = [
    "nvidia-drm.fbdev=1"
    "nvidia-drm.modeset=1"
  ];
}
