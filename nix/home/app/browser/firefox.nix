{ ... }:
{
  programs.firefox = {
    enable = true;

    settings = {
      "webgl.disabled" = false;
      "privacy.resistFingerprinting" = true;

      "privacy.clearOnShutdown.history" = false;
      "privacy.clearOnShutdown.cookies" = false;
      "privacy.clearOnShutdown.downloads" = false;

      "network.cookie.lifetimePolicy" = 0;
    };
  };
}
