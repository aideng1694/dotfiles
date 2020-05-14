# [@aideng1694][owner]'s dotfiles

Dotfiles are how you configure your system. These are [@aideng1694][owner]'s configurations.

## Installation

To install you simply run:

```bash
# Using cURL
sh -c "$(curl -fsSL https://raw.github.com/aideng1694/dotfiles/master/x/install.sh)";

# Using wget
sh -c "$(wget https://raw.github.com/aideng1694/dotfiles/master/x/install.sh -O -)"
```

## Uninstall

To uninstall, simply run:

```bash
bash $HOME/.dotfiles/script/uninstall.sh
```

## To Update

This will update to the latest version on the [GitHub][dotfiles]. You ***will*** lose any and all changes you have made to your local copy.

```bash
# The variable $DOTFILES_DIR should be set by bash/variables
bash $DOTFILES_DIR/script/update.sh
```

[owner]: https://github.com/aideng1694
[dotfiles]: https://github.com/aideng1694/dotfiles
