mkdir -p /root/.config/code-server

cat > /root/.bashrc <<EOF
_direnv_hook() {
  local previous_exit_status=$?;
  trap -- '' SIGINT;
  eval "$("/nix/store/irq2506ybbvsnpmb5gflcbg90390bmdg-direnv-2.35.0/bin/direnv" export bash)";
  trap - SIGINT;
  return $previous_exit_status;
};
if [[ ";${PROMPT_COMMAND[*]:-};" != *";_direnv_hook;"* ]]; then
  if [[ "$(declare -p PROMPT_COMMAND 2>&1)" == "declare -a"* ]]; then
    PROMPT_COMMAND=(_direnv_hook "${PROMPT_COMMAND[@]}")
  else
    PROMPT_COMMAND="_direnv_hook${PROMPT_COMMAND:+;$PROMPT_COMMAND}"
  fi
fi
EOF

exec code-server
