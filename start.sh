mkdir -p /root/.config/code-server

if [ ! -f /root/.bashrc ]; then
  # Install the direnv hook
  direnv hook bash > /root/.bashrc
fi

cat > /root/.config/code-server/config.yaml <<EOF
bind-addr: 0.0.0.0:${PORT}
EOF

exec code-server
