local augroup = vim.api.nvim_create_augroup("theme-persistance", { clear = true })
-- Define the path to the file where the colorscheme will be saved
local colorscheme_file = vim.fn.stdpath("data") .. "theme-persistance.txt"

local function log_error(msg, opts)
	vim.notify(msg, vim.log.levels.ERROR, opts)
end

-- Function to save the current colorscheme to a file
local function save_colorscheme()
	local current_theme = vim.g.colors_name
	local file, err = io.open(colorscheme_file, "w+")
	if file then
		file:write(current_theme)
		file:close()
	else
		log_error("Error opening file for writing: " .. err)
	end
end

-- Function to handle colorscheme changes
local function on_colorscheme_change()
	save_colorscheme()
	vim.notify("Current colorscheme saved: " .. vim.g.colors_name, vim.log.levels.INFO)
end

-- Load the colorscheme on startup
local function load_colorscheme()
	local file, err = io.open(colorscheme_file, "r")
	if file then
		local saved_theme = file:read("*a")
		file:close()
		if saved_theme and saved_theme ~= "" then
			vim.cmd("colo " .. saved_theme)
		end
	else
		_, err = io.open(colorscheme_file, "w")
		if err then
			log_error("Error creating the theme file")
		end
	end
end

-- Set up an autocommand to call the function on colorscheme changes
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = on_colorscheme_change,
	group = augroup,
	desc = "Automagically saves the set colorscheme to disk to be enabled in the next startup",
})

vim.api.nvim_create_autocmd("VimEnter", {
	group = augroup,
	callback = load_colorscheme,
	desc = "Automagically enables the last set colorscheme",
})
