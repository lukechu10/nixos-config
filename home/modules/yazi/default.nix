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
		'';
		plugins = with pkgs; {
			starship = yaziPlugins.starship;
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
}
