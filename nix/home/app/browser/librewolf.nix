{ ... }:
{
  programs.librewolf = {
    enable = true;

    settings = {
      "webgl.disabled" = false;
      "privacy.resistFingerprinting" = false;

      "privacy.clearOnShutdown.history" = false;
      "privacy.clearOnShutdown.cookies" = false;
      "privacy.clearOnShutdown.downloads" = false;

      "network.cookie.lifetimePolicy" = 0;

      "general.useragent.compatMode.firefox" = true;

      "identity.fxaccounts.enabled" = true;
    };
  };
}
