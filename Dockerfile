FROM nixos/nix

RUN nix-env -iA nixpkgs.code-server nixpkgs.gnused nixpkgs.git nixpkgs.gh

COPY start.sh /start.sh

ENV PASSWORD=password
ENV PORT=8080

CMD [ "bash", "/start.sh" ]