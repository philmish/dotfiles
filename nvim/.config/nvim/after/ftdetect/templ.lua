vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.templ",
	desc = "Detect and set filetype for templ files",
	callback = function ()
		vim.cmd("set filetype=templ")
	end
})
