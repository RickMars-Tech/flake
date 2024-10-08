{ config, pkgs, lib, ... }: {

    programs.firefox.profiles.rick.userContent = ''

/*================ GLOBAL COLORS ================*/
:root {
	--accent-color: 231, 100, 99;
	--secondary-accent-color: 255, 255, 255;
	--light-color: 232, 239, 254;
	--light-color-text: 77, 91, 109;
	--dark-color: 21, 28, 36;
	--dark-color-text: 215, 222, 234;
	--dark-color-light: 51, 60, 74;
}

/*================ LIGHT THEME ================*/
:root {
	--main-bgcolor: var(--dark-color);
	--transparent-bgcolor: var(--dark-color);
}

/*================ DARK THEME ================*/
:root:-moz-lwtheme-brighttext {
	--main-bgcolor: var(--dark-color);
	--transparent-bgcolor: var(--dark-color);
}

.outer-wrapper.newtab-experience .search-wrapper .search-handoff-button, .outer-wrapper.newtab-experience .search-wrapper input {
	box-shadow: none !important;
}

.outer-wrapper.newtab-experience .search-wrapper.fake-focus:not(.search.disabled) .search-handoff-button {
	border-color: rgba(var(--accent-color), 1) !important;
}

@media (prefers-color-scheme: dark) {
@-moz-document url("about:newtab"), url("about:home"), url("about:blank") {
	body {
		background-color: rgba(var(--dark-color), 1) !important;
	}
}

.outer-wrapper.newtab-experience .search-wrapper .search-handoff-button, .outer-wrapper.newtab-experience .search-wrapper input,
html body.activity-stream div#root div span button.personalize-button {
	transition: all 0.3s ease !important;
	background-color: rgba(var(--dark-color-light), 1) !important;
	color: rgba(var(--dark-color-text), 1) !important;
}
html body.activity-stream div#root div span button.personalize-button:hover {
	background-color: rgba(var(--accent-color), 0.3) !important;
}
.search-handoff-button .fake-textbox {
	color: rgba(var(--light-color), 1) !important;
}

}

@media (prefers-color-scheme: light) {
@-moz-document url("about:newtab"), url("about:home"), url("about:blank") {
	body {
		background-color: rgba(var(--light-color), 1) !important;
	}
}
.outer-wrapper.newtab-experience .search-wrapper .search-handoff-button, .outer-wrapper.newtab-experience .search-wrapper input,
html body.activity-stream div#root div span button.personalize-button {
	transition: all 0.3s ease !important;
	background-color: rgba(var(--secondary-accent-color), 1) !important;
	color: rgba(var(--light-color-text), 1) !important;
}
html body.activity-stream div#root div span button.personalize-button:hover {
	background-color: rgba(var(--accent-color), 0.2) !important;
}

}

    '';

}
