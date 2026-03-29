{
  attrs,
  ...
}:
{
  environment.systemPackages = [
    attrs.alienfx.packages.x86_64-linux.default
  ];
}
