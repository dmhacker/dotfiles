# fix wide symbols by adding a space after them
GEOMETRY_SYMBOL_GIT_DIRTY="⬡ "
GEOMETRY_SYMBOL_GIT_CLEAN="⬢ "
GEOMETRY_SYMBOL_GIT_BARE="⬢ "

# adjust prompt colors 
GEOMETRY_COLOR_PROMPT="magenta"               
GEOMETRY_COLOR_EXIT_VALUE="red"
GEOMETRY_COLOR_ROOT="yellow"                   

# add these sections to the rprompt 
PROMPT_GEOMETRY_EXEC_TIME=true
PROMPT_GEOMETRY_GIT_CONFLICTS=true

# remove these sections from the rprompt 
PROMPT_GEOMETRY_GIT_TIME=false

GEOMETRY_PROMPT_PLUGINS=(virtualenv exec_time git hg)
