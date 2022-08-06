packer = ~/.local/share/nvim/site/pack/packer/start/packer.nvim

.PHONY: plugins
plugins: $(packer)
	@echo "----- Installing/updating plugins"
	@nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

$(packer):
	@echo "----- Adding packer.nvim to location $(packer)"
	@git clone --depth 1 https://github.com/wbthomason/packer.nvim $(packer)

