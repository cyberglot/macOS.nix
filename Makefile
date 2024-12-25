deploy:
	nix build .#darwinConfigurations."Aprils-MacBook-Pro".system \
	   --extra-experimental-features 'nix-command flakes'

	./result/sw/bin/darwin-rebuild switch --flake .#"Aprils-MacBook-Pro"
