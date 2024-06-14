def bind(key, command, mode):  # noqa: E302
    """Bind key to command in mode."""
    # TODO set force; doesn't exist yet
    config.bind(key, command, mode=mode)

def nmap(key, command):
    """Bind key to command in normal mode."""
    bind(key, command, 'normal')

def unmap(key, mode):
    """Unbind key in mode."""
    config.unbind(key, mode=mode)

def nunmap(key):
    """Unbind key in normal mode."""
    unmap(key, mode='normal')
# config
c.aliases = {'q': 'quit --save'}
c.auto_save.session = True
c.backend = 'webengine'
c.url.searchengines = {'DEFAULT': 'https://google.com/search?q={}'}
c.zoom.levels = ['25%', '33%', '50%', '60%', '70%', '80%', '90%', '100%', '110%', '125%', '150%', '175%', '200%', '250%', '300%', '400%', '500%']

nunmap("'")
# mapping
nmap("'13", ':open --tab localhost:1313')
nmap("'a", ':open --tab https://bbs.archlinux.org/')
nmap("'A", ':open --tab https://kenkoooo.com/atcoder/#/table/pres1dent')
nmap("'g", ':open --tab https://www.github.com/')
nmap("'n", ':open --tab https://www.reddit.com/r/neovim')
nmap("'r", ':open --tab https://reddit.com/')
nmap("'T", ':open --tab https://twitter.com/home/')
nmap("'v", ':open --tab https://www.reddit.com/r/vim/')
nmap("'y", ':open --tab https://youtube.com/')


config.load_autoconfig(False)
