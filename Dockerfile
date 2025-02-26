FROM docker.io/nixos/nix

RUN nix-env -iA nixpkgs.code-server nixpkgs.gnused nixpkgs.git nixpkgs.gh nixpkgs.direnv nixpkgs.htop nixpkgs.coreutils nixpkgs.which

COPY start.sh /start.sh

ENV PASSWORD=password
ENV PORT=8080

CMD [ "bash", "/start.sh" ]