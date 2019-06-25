### fish prompt

set fish_prompt_pwd_dir_length 1
set fish_color_cwd bfcd7e

# Git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch 888888
set __fish_git_prompt_color_dirtystate FCBC47
set __fish_git_prompt_color_stagedstate green
set __fish_git_prompt_color_upstream cyan

# Git Characters
set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_char_stagedstate '⇢'
set __fish_git_prompt_char_upstream_prefix ''
set __fish_git_prompt_char_upstream_equal ''
set __fish_git_prompt_char_upstream_ahead '⇡'
set __fish_git_prompt_char_upstream_behind '⇣'
set __fish_git_prompt_char_upstream_diverged '⇡⇣'

function _print_in_color
  set -l string $argv[1]
  set -l color  $argv[2]

  set_color $color
  printf $string
  set_color normal
end

function _prompt_color_for_status
  if test $argv[1] -eq 0
    echo 6fc2d0
  else
    echo f3c1c6
  end
end

function fish_prompt
  set -l last_status $status

  echo

	set_color $fish_color_cwd
  printf '%s' (prompt_pwd)

  set_color normal
  printf ' %s' (__fish_git_prompt \
    | sed 's/[(]//' \
    | sed 's/[)]//' \
    | sed 's/ //g' \
    | sed 's/$/ /g' \
    | sed 's/^ $//g'
  )

set git_branch (__fish_git_prompt | sed 's/ //g')
  if [ "$git_branch" != '' ]
    printf '\n  '
  end

  switch $fish_bind_mode
		case default
      _print_in_color '<< ' (_prompt_color_for_status $last_status)
		case insert
      _print_in_color '>> ' (_prompt_color_for_status $last_status)
		case visual
      _print_in_color '<< ' (_prompt_color_for_status $last_status)
	end

end

function fish_right_prompt
  set_color $fish_color_autosuggestion 2> /dev/null; or set_color 555
  date "+%H:%M:%S"
  set_color normal
end

