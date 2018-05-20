from powerline_shell.themes.default import DefaultColor


class Color(DefaultColor):
    """Basic theme which only uses colors in 0-15 range"""
    USERNAME_FG = 8
    USERNAME_BG = 15
    USERNAME_ROOT_BG = 1

    HOSTNAME_FG = 8
    HOSTNAME_BG = 7

    HOME_SPECIAL_DISPLAY = True
    HOME_BG = 4
    HOME_FG = 7
    PATH_BG = 8  
    PATH_FG = 7 
    CWD_FG = 15
    SEPARATOR_FG = 12

    READONLY_BG = 1
    READONLY_FG = 15

    REPO_CLEAN_BG = 2   
    REPO_CLEAN_FG = 0  
    REPO_DIRTY_BG = 11
    REPO_DIRTY_FG = 0

    JOBS_FG = 14
    JOBS_BG = 8

    CMD_PASSED_BG = 8
    CMD_PASSED_FG = 15
    CMD_FAILED_BG = 1
    CMD_FAILED_FG = 15

    SVN_CHANGES_BG = REPO_DIRTY_BG
    SVN_CHANGES_FG = REPO_DIRTY_FG

    VIRTUAL_ENV_BG = 2
    VIRTUAL_ENV_FG = 0

    AWS_PROFILE_FG = 14
    AWS_PROFILE_BG = 8

    TIME_FG = 8
    TIME_BG = 7
