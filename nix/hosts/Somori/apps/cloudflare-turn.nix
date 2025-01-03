{ ... }:
{
  # TODO: Set this up
  services.matrix-conduit.settings = {
    global = {
      turn_uris = [
        "turn:turn.cloudflare.com:3478?transport=udp"
      ];
    };
  };
}
