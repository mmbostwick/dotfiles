function fish_prompt --description 'Write out the prompt'
	set -l last_status $status

	# Just calculate this once, to save a few cycles when displaying the prompt
	if not set -q __fish_prompt_hostname
		set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
	end

	set -l normal (set_color normal)

	# Hack; fish_config only copies the fish_prompt function (see #736)
	if not set -q -g __fish_classic_git_functions_defined
		set -g __fish_classic_git_functions_defined

		function __fish_repaint_user --on-variable fish_color_user --description "Event handler, repaint when fish_color_user changes"
			if status --is-interactive
				commandline -f repaint ^/dev/null
			end
		end
		
		function __fish_repaint_host --on-variable fish_color_host --description "Event handler, repaint when fish_color_host changes"
			if status --is-interactive
				commandline -f repaint ^/dev/null
			end
		end
		
		function __fish_repaint_status --on-variable fish_color_status --description "Event handler; repaint when fish_color_status changes"
			if status --is-interactive
				commandline -f repaint ^/dev/null
			end
		end

		function __fish_repaint_bind_mode --on-variable fish_key_bindings --description "Event handler; repaint when fish_key_bindings changes"
			if status --is-interactive
				commandline -f repaint ^/dev/null
			end
		end

		# initialize our new variables
		if not set -q __fish_classic_git_prompt_initialized
			#set -qU fish_color_user; or set -U fish_color_user -o green
			#set -qU fish_color_host; or set -U fish_color_host -o cyan
			#set -qU fish_color_status; or set -U fish_color_status red
			set -U __fish_classic_git_prompt_initialized
		end
	end

	set -l color_cwd
	set -l prefix
	#case root toor
	#	if set -q fish_color_cwd_root
	#		set color_cwd $fish_color_cwd_root
	#		set prompt_symbol '#'
	#	else
	#		set color_cwd $fish_color_cwd
	#		set prompt_symbol '$'
	#	end
	#	set suffix '#'
	#case '*'
	#	set color_cwd $fish_color_cwd
	#	set suffix '>'
	#	set prompt_symbol '$'
	#end

	set -l prompt_status
	if test $last_status -ne 0
		set prompt_status ' ' (set_color $fish_color_status) "[$last_status]" "$normal"
	end

	set -l mode_str
	switch "$fish_key_bindings"
	case '*_vi_*' '*_vi'
		# possibly fish_vi_key_bindings, or custom key bindings
		# that includes the name "vi"
		set mode_str (
			echo -n " "
			switch $fish_bind_mode
			case default
				set_color --bold --background red white
				echo -n "[N]"
			case insert
				set_color --bold green
				echo -n "[I]"
			case visual
				set_color --bold magenta
				echo -n "[V]"
			end
			set_color normal
		)
	end

set -l home_escaped (echo -n $HOME | sed 's/\//\\\\\//g')
   set -l pwd (echo -n $PWD | sed "s/^$home_escaped/~/" | sed 's/ /%20/g')
   set -l prompt_symbol ''
   switch $USER
       case root toor; set prompt_symbol '#'; set user_color red
       case '*';  set prompt_symbol '$'; set user_color normal 
   end

#	echo -n -s (set_color $fish_color_user) "$USER" $normal @ (set_color $fish_color_host) "$__fish_prompt_hostname" $normal ' ' (set_color $color_cwd) $pwd $normal (__fish_git_prompt) $normal $prompt_status "$mode_str" "$prompt_symbol" " "
printf "[%s@%s %s%s%s]%s%s " (set_color -b $user_color)$USER(set_color normal) (set_color -u cyan)(hostname -s)(set_color normal) (set_color $fish_color_cwd) $pwd  (set_color -u brown)(__fish_git_prompt)(set_color normal) $normal (set_color $user_color)$prompt_symbol
end
