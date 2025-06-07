{ config, pkgs, ... }:

{
	# Configure Git
	programs.git = {
		enable = true;
		userName = "Luke Chu";
		userEmail = "37006668+lukechu10@users.noreply.github.com";
		extraConfig = {
			init = {
				defaultBranch = "main";
			};
			url = {
				"https://github.com/" = {
					insteadOf = [ "gh:" "github:" ];
				};
			};
		};
	};

	# Configure GitHub CLI
	programs.gh = {
		enable = true;
	};
}
