#!/bin/bash

showSyntax() {
    cat <<EOF
Usage: $0 [OPTIONS...] OPERATION

The operation is one of the following:

  apply:	make the configuration the boot default and activate now
  cache:	cache our store
  build-all:	build all configured systems
  pull:		pull the most recent configuration version
  push:		push our configuration
  status:	show configuration status
  update:	update configuration inputs

Options:

  --help               show this information
  --cache              use private binary cache
EOF
    exit 1
}

# Parse the command line.
action=
cache=
pushd ~/.dotfiles > /dev/null
while [ "$#" -gt 0 ]; do
    i="$1"; shift 1
    case "$i" in
      --help)
        showSyntax
        ;;
      apply|cache|build-all|pull|push|status|update)
        action="$i"
        ;;
      --cache)
        cache=1
        ;;
      *)
        echo "$0: unknown option \`$i'"
        exit 1
        ;;
    esac
done

if [ -z "$action" ]; then showSyntax; fi

if [ "$action" = apply ]; then
    if [ "$cache" = 1 ]; then
        bash ./scripts/apply-system.sh -c
    else
        bash ./scripts/apply-system.sh
    fi
elif [ "$action" = cache ]; then
    bash ./scripts/cache-system.sh
elif [ "$action" = build-all ]; then
    bash ./scripts/build-all.sh
elif [ "$action" = pull ]; then
    git pull
elif [ "$action" = push ]; then
    git push
elif [ "$action" = status ]; then
    git status
elif [ "$action" = update ]; then
    bash ./scripts/update-system.sh
else
    showSyntax
fi

popd > /dev/null
