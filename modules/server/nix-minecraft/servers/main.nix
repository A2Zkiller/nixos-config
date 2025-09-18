{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "server.nix-minecraft.main";

  options = delib.singleCascadeEnableOption;

  nixos.ifEnabled.services.minecraft-servers = {
    enable = true;
    eula = true;

    servers.main = {
      enable = true;

      package = pkgs.fabricServers.fabric-1_21_8;

      openFirewall = false;
      autoStart = true;
      enableReload = true;

      serverProperties = {
        white-list = true;
        difficulty = 3; # Hard difficulty
        gamemode = 0;
        max-players = 25;
        view-distance = 16;
        simulation-distance = 10;
        spawn-protection = 0;
        enable-rcon = true;
        "rcon.port" = 25575;
        "rcon.password" = "rcon";
        motd = "A2Zkiller's Minecraft Server";
      };

      jvmOpts = "-Xms3584M -Xmx4096M"; # 3.5 to 4 gigs of ram

      whitelist = {
        A2Zkiller = "897eca78-1df5-4f1e-8b3e-c4cf14e03805";
        Geykyume = "ecebe0cb-edcf-4b45-abe3-72a6659d9da1";
        Gretticheu = "3a0e439c-93f9-41e3-9619-1c13827ea486";
      };

      symlinks = {
        mods = pkgs.linkFarmFromDrvs "mods" (
          builtins.attrValues {
            Lithium = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/pDfTqezk/lithium-fabric-0.18.0%2Bmc1.21.8.jar";
              sha512 = "6c69950760f48ef88f0c5871e61029b59af03ab5ed9b002b6a470d7adfdf26f0b875dcd360b664e897291002530981c20e0b2890fb889f29ecdaa007f885100f";
            };

            FerriteCore = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/uXXizFIs/versions/CtMpt7Jr/ferritecore-8.0.0-fabric.jar";
              sha512 = "131b82d1d366f0966435bfcb38c362d604d68ecf30c106d31a6261bfc868ca3a82425bb3faebaa2e5ea17d8eed5c92843810eb2df4790f2f8b1e6c1bdc9b7745";
            };

            SimpleVoiceChat = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/9eGKb6K1/versions/meaWIBQj/voicechat-fabric-1.21.8-2.6.3.jar";
              sha512 = "5577a029f4728a914d45960a23d93ad8621e8d0ba23a22d569351e8d2de633659433ec94acd85ca62513112c3ec60d05b95936d02e1cc1e20f40b2589f639861";
            };
          }
        );
      };
    };
  };

  nixos.ifEnabled.networking.firewall = {
    enable = true;

    allowedTCPPorts = [
      25565
    ];

    allowedUDPPorts = [
      25565 # MC server Port
      24454 # Voice Chat Port
    ];

    extraCommands = ''
      iptables -A nixos-fw -p tcp --source localhost --dport 25575:25575 -j nixos-fw-accept
      iptables -A nixos-fw -p udp --source localhost --dport 25575:25575 -j nixos-fw-accept
    '';
  };

  home.ifEnabled.home.packages = [pkgs.mcrcon];
}
