# Copilot Instructions

## Build, test, and lint commands

- Bootstrap a machine from this repo with `./install.sh`. It installs `chezmoi` if needed and then runs `chezmoi init --apply --source=<repo>`.
- Apply the current dotfiles state with `make update`. For first-time setup use `make init`.
- Re-apply on file changes with `make watch`.
- Reset chezmoi script state with `make reset`. Recompute config data without applying with `make reset-config`.
- Open an Ubuntu-based test shell with the repo mounted as the chezmoi source using `make docker`.
- Refresh the tracked Homebrew bundle snapshot with `./update_brewfile.sh`.
- No repo-wide automated test suite, single-test command, or lint target is currently defined in the repository.

## High-level architecture

- This repository is a **chezmoi source tree**. The `home/` directory holds the managed home-directory content, and file prefixes control how chezmoi materializes them.
- `.chezmoi.toml.tmpl` is the central decision point for machine behavior. It derives `ephemeral`, `headless`, `personal`, `codespaces`, and OS/arch-specific data, and it also defines the age encryption backend.
- `.chezmoiignore` and the OS-specific script directories work together to decide what applies on each machine:
  - `home/.chezmoiscripts/darwin/`
  - `home/.chezmoiscripts/linux/`
  - `home/.chezmoiscripts/codespaces/`
- Shared shell fragments live in `home/.chezmoitemplates/` and are pulled into multiple chezmoi scripts instead of being reimplemented per script.
- External dependencies that chezmoi downloads are declared in `home/.chezmoiexternal.toml.tmpl` rather than committed directly.
- macOS package/bootstrap flow is driven from the **root-level** `Brewfile`: the darwin package script changes to `.chezmoi.sourceDir` and runs `brew bundle` there. `update_brewfile.sh` also regenerates that root `Brewfile`.
- `home/dot_config/nvim/` is a separate LazyVim-based Neovim config. `init.lua` only bootstraps lazy.nvim; the real customization lives under `lua/config/`, `lua/plugins/`, and `lua/cjs/`.
- The Neovim `lua/cjs/features/tools/*.lua` modules dynamically detect project-local tools such as Sorbet and RuboCop, and `lua/cjs/plugins/lang/*.lua` wires those features into language-specific setup.

## Key conventions

- Preserve chezmoi naming semantics when adding files:
  - `dot_` for dotfiles
  - `private_` for restricted-permission files
  - `encrypted_*.age` for encrypted secrets
  - `symlink_*.tmpl` for generated symlinks
  - `.tmpl` for templated output
- Keep machine-specific branching in `.chezmoi.toml.tmpl`, `.chezmoiignore`, or OS-specific script directories instead of scattering raw platform checks across unrelated files.
- Reuse `home/.chezmoitemplates/` helpers from new chezmoi scripts when possible; existing scripts rely on those shared fragments for guardrails like OS gating, sudo handling, brew path setup, and caffeinate behavior.
- Treat encrypted and private files as source-of-truth artifacts. Do not replace them with plaintext equivalents in the repo.
- The iTerm2 plist is intentionally managed as a symlinked/generated file. Update the source plist/template, not a copied file in `$HOME`.
- For Neovim changes, put general plugin imports in `lua/config/lazy.lua`, custom plugins in `lua/plugins/` or `lua/cjs/plugins/`, and tool-detection logic in `lua/cjs/features/tools/` rather than expanding `init.lua`.
- Be careful with Brewfile edits: the repository currently contains both `Brewfile` at the repo root and `home/Brewfile`, but the active darwin bootstrap/update flow uses the root-level `Brewfile`.
- Codespaces behavior is explicitly special-cased. Before changing shell or bootstrap logic, check `.chezmoi.toml.tmpl`, `.chezmoiignore`, and `home/dot_config/fish/custom_functions/codespaces.fish.tmpl` so local-machine assumptions do not leak into ephemeral environments.
