let 
  rien = import ./.rien/rien.nix {
    packageName = "digest-example";
    packagePath = ./.;

    # Instead of using <nixpkgs>, use a lock-file to stick to
    # a particular `nixpkgs` commit.
    nixpkgsLock = ./nixpkgs.json;

    ghcVersion = "ghc822";

  };
in
  rien.shell {
    wantHoogle = false;

    deps = hsPkgs: with hsPkgs; [
      digest
    ];

    depSets = hsPkgs: with (rien.package-sets hsPkgs); [ ];

    nativeDeps = pkgs: with pkgs; [
      zlib
    ];
  }
