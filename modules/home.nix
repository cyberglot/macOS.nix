{ config, pkgs, ... }:

{
  home.username = "cyberglot";
  home.homeDirectory = "/Users/cyberglot";
  home.enableNixpkgsReleaseCheck = false;
  programs.home-manager.enable = true;

  home.stateVersion = "24.05";

  programs.ssh.extraConfig = ''
    Host github.com
      AddKeysToAgent yes
      UseKeychain yes
      IdentityFile ~/.ssh/id_ed25519
  '';

  programs.git = {
    enable = true;
    userName = "cyberglot";
    userEmail = "april@cyberglot.me";
    signing.key = "0xD8CB8D10176A3C80";
    signing.signByDefault = true;
    aliases = {
      undo = "reset HEAD~1 --mixed";
      amend = "commit -m --amend";
      st = "status";
      cl = "clone";
      co = "checkout";
      ci = "commit";
    };
    extraConfig = {
      github.user = "cyberglot";
      color.ui = "auto";
      diff.external = "emacs";
      pull.rebase = true;
      init.defaultBranch = "main";
    };
    ignores = [
      # General
      ".DS_Store"
      ".AppleDouble"
      ".LSOverride"

      # Icon must end with two \r
      "Icon"

      # Thumbnails
      "._*"

      # Files that might appear in the root of a volume
      ".DocumentRevisions-V100"
      ".fseventsd"
      ".Spotlight-V100"
      ".TemporaryItems"
      ".Trashes"
      ".VolumeIcon.icns"
      ".com.apple.timemachine.donotpresent"

      # Directories potentially created on remote AFP share
      ".AppleDB"
      ".AppleDesktop"
      "Network Trash Folder"
      "Temporary Items"
      ".apdisk"
    ];
  };

  # programs.gpg = {
  #   enable = true;
  #   mutableKeys = false;
  #   mutableTrust = false;
  #   settings = {
  #     personal-cipher-preferences = "AES256 AES192 AES";
  #     personal-compress-preferences = "ZLIB BZIP2 ZIP Uncompressed";
  #     default-preference-list =
  #       "SHA512 SHA384 SHA256 AES256 AES192 AES ZLIB BZIP2 ZIP Uncompressed";
  #     cert-digest-algo = "SHA512";
  #     s2k-digest-algo = "SHA512";
  #     s2k-cipher-algo = "AES256";
  #     charset = "utf-8";
  #     fixed-list-mode = "";
  #     no-comments = "";
  #     no-emit-version = "";
  #     no-greeting = "";
  #     keyid-format = "0xlong";
  #     list-options = "show-uid-validity";
  #     verify-options = "show-uid-validity";
  #     with-fingerprint = "";
  #     require-cross-certification = "";
  #     no-symkey-cache = "";
  #     use-agent = "";
  #     throw-keyids = "";
  #   };
  #   scdaemonSettings = {
  #     pcsc-driver = "${pkgs.pcsclite.lib}/lib/libpcsclite.so";
  #     card-timeout = "5";
  #     disable-ccid = "";
  #     pcsc-shared = "";
  #   };
  # };

  # services.gpg-agent = { enable = true; };

}
