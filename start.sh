mkdir -p /root/.config/code-server

cat > /root/.config/code-server/config.yaml <<EOF
bind-addr: 0.0.0.0:${PORT}
auth: password
password: ${PASSWORD}
cert: false
EOF

exec code-server