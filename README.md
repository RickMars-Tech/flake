#  IMPORTANT
-I recommend editing the configuration files to your liking since they contain a specific configuration for my hardware so you can improve your customization and also avoid errors.

# How to Use
```bash
git clone https://github.com/RickMars-Tech/NixOS-Mars.git
cd NixOS-Mars

# Built with detailed error messages 
sudo nixos-rebuild switch --flake . --show-trace --print-build-logs --verbose
```


# To clean up historical versions and free up storage space, use the following command:
```bash
# Delete all historical versions older than 7 days
sudo nix profile wipe-history --older-than 7d --profile /nix/var/nix/profiles/system

# Run garbage collection after wiping history
sudo nix-collect-garbage --delete-old
```

