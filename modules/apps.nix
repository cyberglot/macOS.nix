{ pkgs, ... }: {

  ##########################################################################
  #
  #  Install all apps and packages here.
  #
  #  NOTE: Your can find all available options in:
  #    https://daiderd.com/nix-darwin/manual/index.html
  #
  # TODO Fell free to modify this file to fit your needs.
  #
  ##########################################################################

  # Install packages from nix's official package repository.
  #
  # The packages installed here are available to all users, and are reproducible across machines, and are rollbackable.
  # But on macOS, it's less stable than homebrew.
  #
  # Related Discussion: https://discourse.nixos.org/t/darwin-again/29331
  environment.systemPackages = with pkgs; [
    git
    wget
    just
    cachix
    devenv
    nodejs_23
    fish
    direnv
    ripgrep
    graphviz
    pandoc
    zstd
    nixfmt-classic
    nix-prefetch-github
    home-manager
    yt-dlp
    stdenv.cc
    pre-commit
    helix
    astro-language-server
    coreutils
    fd
    clang
    aerospace
    sketchybar
  ];

  # TODO To make this work, homebrew need to be installed manually, see https://brew.sh
  #
  # The apps installed by homebrew are not managed by nix, and not reproducible!
  # But on macOS, homebrew has a much larger selection of apps than nixpkgs, especially for GUI apps!
  homebrew = {
    enable = true;
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
    onActivation.cleanup = "zap";
    global.brewfile = true;
    caskArgs.language = "en-GB";

    masApps = {
      Xcode = 497799835;
      Notability = 360593530;
      Gifox = 1461845568;
      TabSpace = 1473726602;
      AdBlockerPro = 1018301773;
      Wakeout = 1242116567;
      Amphetamine = 937984704;
      Magnet = 441258766;
    };

    taps = [
      "homebrew/services"
      "nikitabobko/tap"
      "FelixKratz/formulae"
      "d12frosted/emacs-plus"
    ];

    # `brew install`
    brews = [
      "aspell"
      "gnu-tar"
      "pygments"
      "d12frosted/emacs-plus/emacs-plus@29"
      "agda"
    ];

    # `brew install --cask`
    casks = [
      "warp"
      "slack"
      "zoom"
      "discord"
      "firefox"
      "notion"
      "notion-calendar"
      "github"
      "whatsapp"
      "signal"
      "vlc"
      "obs"
      "raycast"
      "font-sf-pro"
      "sf-symbols"
      "transmission"
      "nordvpn"
      "fantastical"
      "sidenotes"
      "docker"
      "zulip"
      "vscodium"
      "mattermost"
      "zotero"
    ];
  };
}
