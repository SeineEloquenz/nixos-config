{ config, pkgs, ... }:{

  xdg.configFile."wireplumber/main.lua.d/51-alsa-disable.lua".text = ''
    spdif = {
      matches = {
        {
          { "node.nick", "equals", "ALC892 Digital" },
        },
      },
      apply_properties = {
        ["node.disabled"] = true,
      },
    }

    camera = {
      matches = {
        {
          { "node.nick", "equals", "HD Web Camera" },
          { "media.class", "equals", "Audio/Source" },
        },
      },
      apply_properties = {
        ["node.disabled"] = true,
      },
    }

    table.insert(alsa_monitor.rules,spdif)
    table.insert(alsa_monitor.rules,camera)
  '';
}
