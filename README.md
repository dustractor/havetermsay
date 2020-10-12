# havetermsay
[Vim-plugin] gives a command -- :Havetermsay 

As long as your vim (or gvim) has been compiled with +clientserver then this plugin should be able to function.


Tired of alt-tabbing over to a command prompt to hit the up arrow and enter and then having to alt-tab twice to get back to your editor?
===

Havetermsay provides a substitute for approximately 0.001% of tmux functionality which is where it allows you remote-send to a session, creating it if necessary.

If you are on Windows this may be useful to you since the program tmux does not currently offer Windows builds.

Linux and Mac OS users have tmux, and so typically, a vim user could make hotkeys to create a session and send remotely send it commands, as if you had alt-tabbed over to that terminal and typed it yourself.

Each vim that is launched with a --servername argument can be treated as a 'session'.  The relevant tmux command ``ls`` or ``list-sessions`` would let us decide whether or not to create a session, but vim's ``serverlist()`` function can achieve a similar effect as tmux's ls.

The tmux command ``create-pane`` is analogous to vim's (relatively new) ``:term`` feature.

Lastly, all that is needed is vim's ``remote_send()`` which is able to more-or-less duplicate the effect of tmux ``send-keys.``

And with all that, we have the technology.

All that is left is to decide how to use it.


I made this to run blender, so in my vimrc, I made an autocommand group for while I am editing files inside the relevant location where they would be kept.
While editing any file inside of a certain directory, it adds a mapping to run blender in a terminal (named foo, just because).

```vim
    aug EditingBlenderPython
        au!
        au BufNew,BufReadPost */bpy/** nmap <F12> :HaveTermSay foo "c:\\Program\ Files\\Blender\ Foundation\\Blender\ 2.90\\blender.exe"<CR>
    aug END
```

