{ config, pkgs, lib, ... }:

{
  networking.firewall = {
    # if packets are still dropped they show up in dmesg
    logReversePathDrops = true;
    # wireguard trips rpfilter up - let traffic by wireguard pass
     extraCommands = ''
       ip46tables -t raw -I nixos-fw-rpfilter -p udp -m udp --sport 51820 -j RETURN
       ip46tables -t raw -I nixos-fw-rpfilter -p udp -m udp --dport 51820 -j RETURN
     '';
     extraStopCommands = ''
       ip46tables -t raw -D nixos-fw-rpfilter -p udp -m udp --sport 51820 -j RETURN || true
       ip46tables -t raw -D nixos-fw-rpfilter -p udp -m udp --dport 51820 -j RETURN || true
     '';
  };
  
  networking.wg-quick.interfaces = {
    wg0 = {
      autostart = false;
      address = [ "192.168.179.3/24" ];
      dns = [ "192.168.178.101" ];
      privateKeyFile = "/home/alexa/.dotfiles/.secrets/wg/private";
      postUp = [ "ip r a 192.168.178.0/24 via 192.168.179.1 " "ip li set dev wg0" "iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu" ];
      postDown = [ "ip r d 192.168.178.0/24 via 192.168.179.1" "iptables -D FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu" ];
      peers = [
        {
          publicKey = "bPmzguRkP08IsdOY36CQVVnSAoZ9I3E7rr9TRs/oDzU=";
          allowedIPs = [ "0.0.0.0/0" ];
          endpoint = "mondcarion.group:51820";
          persistentKeepalive = 25;
        }
      ];
    };
  };
}
