{ config, pkgs, ... }:{

  xdg.configFile."wireplumber/main.lua.d/51-alsa-disable.lua".text = ''
    spdif = {
      matches = {
        {
          { "node.name", "equals", "alsa_output.pci-0000_00_1f.3.iec958-stereo" },
        },
      },
      apply_properties = {
        ["node.disabled"] = true,
      },
    }

    camera = {
      matches = {
        {
          { "node.name", "equals", "alsa_input.usb-HD_Web_Camera_HD_Web_Camera_Ucamera001-02.mono-fallback" },
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
