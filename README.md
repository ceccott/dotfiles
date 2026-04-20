# Dotfiles

Managed with [chezmoi](https://www.chezmoi.io/).

## Quick Start

### Installation

On a new machine, you can initialize and apply your dotfiles with a single command:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply <your-github-username>
```

### Local Setup

If `chezmoi` is already installed, initialize with your repository:

```bash
chezmoi init https://github.com/<your-github-username>/dotfiles.git
chezmoi apply
```

## Common Commands

| Command | Description |
| :--- | :--- |
| `chezmoi add ~/.file` | Add a new file to chezmoi |
| `chezmoi edit ~/.file` | Edit the managed version of a file |
| `chezmoi apply` | Apply changes from source to your home directory |
| `chezmoi diff` | See changes between source and home directory |
| `chezmoi status` | See status of managed files |
| `chezmoi cd` | Open a shell in the chezmoi source directory |

## Workflow

1.  **Edit**: Always use `chezmoi edit ~/.config/hypr/hyprland.conf` to make changes. This ensures the source state is updated.
2.  **Apply**: Run `chezmoi apply` to push those changes to your actual configuration.
3.  **Sync**: 
    ```bash
    chezmoi cd
    git add .
    git commit -m "Update config"
    git push
    ```
