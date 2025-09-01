if [ -x /usr/bin/zsh ]; then
    exec /usr/bin/zsh
fi
[ -r ~/.volc/.profile ] && source ~/.volc/.profile #[volc installer]