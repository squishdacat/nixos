{ ... }:
{
  # TODO: Set this up
  services.matrix-conduit.settings = {
    global = {
      turn_uris = [
        #"turn:turn.cloudflare.com:3478?transport=udp"

        "stun:stun.cloudflare.com:3478"
        "turn:turn.cloudflare.com:3478?transport=udp"
        "turn:turn.cloudflare.com:3478?transport=tcp"
        "turns:turn.cloudflare.com:5349?transport=tcp"
      ];
    };
  };
}
