if vim.g.vscode then
  vim.cmd('source ~/.config/nvim/vscode.vim')
else
	vim.cmd("source ~/.config/nvim/nvim.lua")
end
