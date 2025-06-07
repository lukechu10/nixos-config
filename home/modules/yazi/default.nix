{ config, pkgs, ... }:

{
	programs.yazi = {
		enable = true;
		settings = {
			mgr = {
				show_hidden = true;
				sort_by = "natural";
				sort_dir_first = true;
			};
		};
		initLua = ''
			require('starship'):setup()
			require('full-border'):setup {
				type = ui.Border.ROUNDED
			}
		'';
		plugins = with pkgs; {
			starship = yaziPlugins.starship;
			full-border = yaziPlugins.full-border;
		};
	};

	home.file.".config/yazi/flavors/" = {
		source = ./flavors;
		recursive = true;
	};
	home.file.".config/yazi/theme.toml".text = ''
		[flavor]
		dark = "catppuccin-mocha"
	'';
	home.file.".config/yazi/keymap.toml".text = ''
		[manager]
		prepend_keymap = [
			{ on = "t", run = "shell --orphan --confirm kitty", desc = "Open terminal at current dir" },
		]
	'';
}
