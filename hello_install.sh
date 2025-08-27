#!/usr/bin/env bash

hello_install () {
    set -euo pipefail

    # "Інсталяція" програми hello
    INSTALL_DIR="/usr/local/bin"
    TARGET="$INSTALL_DIR/hello"

    echo '#!/usr/bin/env sh' > "$TARGET"
    echo 'echo "Hello, world!"' >> "$TARGET"

    chmod +x "$TARGET"

    echo "Installed hello to $TARGET"
}
