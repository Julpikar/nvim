-- NerdTree
vim.g.NERDTreeDirArrowExpandable = '╰▸'
vim.g.NERDTreeDirArrowCollapsible = '├▸'
vim.g.NERDTreeChDirMode = 2
vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeHijackNetrw = 1
vim.g.NERDTreeGitStatusIndicatorMapCustom = {
	Modified  = '✹',
	Staged    = '✚',
	Untracked = '✭',
	Renamed   = '➜',
	Unmerged  = '═',
	Deleted   = '✖',
	Dirty     = '✗',
	Ignored   = '☒',
	Clean     = '✔︎',
	Unknown   = '?',
}
vim.g.NERDTreeGitStatusUseNerdFonts = 1

-- Startify
vim.g.startify_lists = {
	{ type = 'files',     header = {'   Files'}},
	{ type = 'dir',       header = {'   Current Directory '.. vim.fn.getcwd()}},
	{ type = 'sessions',  header = {'   Sessions'}},
	{ type = 'bookmarks', header = {'   Bookmarks'}},
}

vim.g.startify_bookmarks = {
    {Code = "D:/sources"},
	{Config = "~/AppData/Local/nvim/init.lua"},
    {Packer = "~/AppData/Local/nvim-data/site/pack/packer"}
}

vim.g.startify_session_delete_buffers = 0
vim.g.startify_session_persistence = 1

-- Vista
vim.g.vista_icon_indent = {"╰─▸ ", "├─▸ "}
vim.g.vista_fold_toggle_icons = {"╰─▸ ", "├─▸ "}
vim.g.vista_default_executive = 'ctags'
vim.g.vista_disable_statusline = 1
vim.cmd("let g:vista#renderer#enable_icon = 1")
vim.cmd([[let g:vista#renderer#icons = {"function": "\uf794","variable": "\uf71b",}]])
