from powerline_shell.themes.default import DefaultColor


class Color(DefaultColor):
    
    """ read_only segment """ 

    READONLY_BG = 1
    READONLY_FG = 15

    """ cwd segment """

    HOME_SPECIAL_DISPLAY = True
    HOME_BG = 4
    HOME_FG = 7
    PATH_BG = 8  
    PATH_FG = 7 
    CWD_FG = 15
    SEPARATOR_FG = 12

    """ git segment """

    REPO_CLEAN_BG = 2   
    REPO_CLEAN_FG = 0  
    REPO_DIRTY_BG = 11
    REPO_DIRTY_FG = 0

    """ jobs segment """

    JOBS_FG = 14
    JOBS_BG = 8

    """ root segment """

    CMD_PASSED_BG = 0
    CMD_PASSED_FG = 15
    CMD_FAILED_BG = 1
    CMD_FAILED_FG = 15