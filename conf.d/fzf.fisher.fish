function _fzf.fisher_install --on-event fzf.fisher_install
  brew install exa fd fzf

  fisher install PatrickF1/fzf.fish
end

function _fzf.fisher_uninstall --on-event fzf.fisher_uninstall
  fisher remove PatrickF1/fzf.fish
  
  brew uninstall exa fd fzf
end

function _fzf.fisher_init
  # fzf.fish
  fzf_configure_bindings --directory=\cf --git_log=\cl --git_status=\cs

  set fzf_fd_opts --follow --hidden --exclude=Documents --exclude=Library --exclude=.git
  set fzf_preview_dir_cmd exa --all --color=always

  # fzf
  set -x FZF_DEFAULT_COMMAND "fd --type f $fzf_fd_opts"
end

if command --query fzf
  fzf.fisher_init
end
