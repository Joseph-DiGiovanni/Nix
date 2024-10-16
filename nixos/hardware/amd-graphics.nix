{ pkgs, ... }:

{
  hardware.amdgpu = {
    initrd.enable = true;
    opencl.enable = true;
  };

  # Workaround for software that uses hard-coded HIP libraries
  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];
}
