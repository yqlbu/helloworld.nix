# helloworld.nix

## Build

```bash
nix build .
```

## Run

```bash
# run with default package
nix run
# run with specified package
nix run .#vim
```

## References

- [Practical Nix Flakes](https://serokell.io/blog/practical-nix-flakes)
- [Nix By Examples](https://mimoo.github.io/nixbyexample/flakes-packaging.html)
- [NixOS 系列（三）：软件打包，从入门到放弃](https://lantian.pub/article/modify-computer/nixos-packaging.lantian/)
