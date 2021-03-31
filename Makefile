.PHONY: dotfiles

dotfiles: ~/.config/nvim
	# add aliases for dotfiles
	for file in $(shell find $(CURDIR) -maxdepth 1 -name ".*" -not -name ".git" -not -name ".gitmodules" -not -name ".gitignore" -not -name ".*.swp"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done
	ln -sf $(CURDIR)/.vimrc ~/.config/nvim/init.vim
	ln -sf $(CURDIR)/vim/mySnippets ~/.config/nvim/mySnippets

~/.config/nvim:
	mkdir -p ~/.config/nvim
