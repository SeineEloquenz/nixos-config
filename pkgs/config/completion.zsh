#compdef config
local line

_arguments -C \
    "1: :(apply test cache build build-all pull push status repair update reset help)" \
    "*::arg:->args"


case $line[1] in
    apply|build|build-all)
        _arguments \
            "--cache[Use our binary cache]"
    ;;
    update)
        _arguments \
            "--push[push update to remote]"
    ;;
esac
