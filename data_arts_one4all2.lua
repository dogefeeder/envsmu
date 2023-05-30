load("apptainer")


local img_name      = 'smuenv_jupyterlab-2023-05-29-90fdbd9f1bab.simg'
local img_directory = '/users/yunjieh/Documents/one4all/'
local img_path      = pathJoin(img_directory, img_name)

function build_command(cmd)
  local cmd_beginning = 'apptainer exec '
  local cmd_ending    = img_path .. ' ' .. cmd
  local sh_ending     = ' "$@"'
  local csh_ending    = ' $*'
  local sh_cmd        = cmd_beginning .. cmd_ending .. sh_ending
  local csh_cmd       = cmd_beginning .. cmd_ending .. csh_ending
  set_shell_function(cmd, sh_cmd, csh_cmd)
end

build_command('python3')
build_command('jupyter-lab')
build_command('jupyter')


