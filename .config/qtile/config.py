
# Qtile configuration 
# User: Israelgal

import os
import subprocess
from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from libqtile import hook
from libqtile.widget.textbox import TextBox

mod = 'mod4'
terminal = 'alacritty'

#The theme that I'm currently using
Catppuccin = [['#a6e3a1', '#a6e3a1'],
            ['#cba6f7', '#cba6f7'],
            ['#313244', '#313244']]


keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html



    # Toggle qtile bar 
    Key([mod], 'b',
        lazy.hide_show_bar(),
        desc='Toggle qtile bar'),

    #To change keyboard layout 
    Key([mod], 'i',
        lazy.spawn('tlenguage'),
        desc='Toggle keyboard layout us-latam'),

    Key([mod], 'm',
        lazy.spawn('tmic'),
        desc='Toggle microphone'),
    
    # Launch with rofi 
    Key([mod], 'a',
        lazy.spawn('rofi -show drun'),
        desc='Launch rofi app instance'),
    Key([mod], 'c',
        lazy.spawn('rofi -show calc'),
        desc='Launch rofi calc instance'),

    # Screenshot tool 
    Key([mod], 'p',
        lazy.spawn('screenshot select'),
        desc='Screenshot section'),
    Key([mod, 'shift'], 'p',
        lazy.spawn('screenshot'),
        desc='Screenshot'),
    Key([mod, 'shift'], 'f',
        lazy.spawn('firefox'),
        desc='Launch firefox'),
    
    #Change volume program
    Key([], 'XF86AudioRaiseVolume',
        lazy.spawn('changevolume up'),
        desc='Raises the volume'),
    Key([], 'XF86AudioLowerVolume',
        lazy.spawn('changevolume down'),
        desc='Lower the volume'),
    Key([], 'XF86AudioMute',
        lazy.spawn('changevolume mute'),
        desc='Mute'),

    Key([mod], 'Left',
        lazy.screen.prev_group(),
        desc = 'Switch to the left desktop'),

    Key([mod], 'Right',
        lazy.screen.next_group(),
        desc = 'Switch to the right desktop'),
    

   
    # Toggle Fullscreen and floating mode 
    Key([mod], 'f',
        lazy.window.toggle_fullscreen(),
        desc='Toggle Fullscreen'),
    Key([mod,'shift'], 'c',
        lazy.window.toggle_floating(),
        desc='Toggle floating'),


    # Switch between windows
    Key([mod], 'h',
        lazy.layout.left(),
        desc='Move focus to left'),
    Key([mod], 'l',
        lazy.layout.right(),
        desc='Move focus to right'),
    Key([mod], 'j',
        lazy.layout.down(),
        desc='Move focus down'),
    Key([mod], 'k',
        lazy.layout.up(),
        desc='Move focus up'),
    Key([mod], 'space',
        lazy.layout.next(),
        desc='Move window focus to other window'),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, 'shift'], 'h',
        lazy.layout.shuffle_left(),
        desc='Move window to the left'),
    Key([mod, 'shift'], 'l',
        lazy.layout.shuffle_right(),
        desc='Move window to the right'),
    Key([mod, 'shift'], 'j',
        lazy.layout.shuffle_down(),
        desc='Move window down'),
    Key([mod, 'shift'], 'k',
        lazy.layout.shuffle_up(),
        desc='Move window up'),


    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, 'control'], 'h',
        lazy.layout.grow_left(),
        desc='Grow window to the left'),
    Key([mod, 'control'], 'l',
        lazy.layout.grow_right(),
        desc='Grow window to the right'),
    Key([mod, 'control'], 'j',
        lazy.layout.grow_down(),
        desc='Grow window down'),
    Key([mod, 'control'], 'k',
        lazy.layout.grow_up(),
        desc='Grow window up'),
    Key([mod], 'n',
        lazy.layout.normalize(),
        desc='Reset all window sizes'),



    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, 'shift'], 'Return',
        lazy.layout.toggle_split(),
        desc='Toggle between split and unsplit sides of stack'),
    Key([mod], 'Return',
        lazy.spawn(terminal),
        desc='Launch terminal'),

    # Toggle between different layouts as defined below
    Key([mod], 'Tab',
        lazy.next_layout(),
        desc='Toggle between layouts'),
    Key([mod], 'q',
        lazy.window.kill(),
        desc='Kill focused window'),
    Key([mod, 'shift'], 'r',
        lazy.reload_config(),
        desc='Reload the config'),
    Key([mod, 'control'], 'q',
        lazy.shutdown(),
        desc='Shutdown Qtile'),
    Key([mod], 'r',
        lazy.spawncmd(),
        desc='Spawn a command using a prompt widget'),
]

groups = [Group(i) for i in '123456789']

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc='Switch to group {}'.format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, 'shift'],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc='Switch to & move focused window to group {}'.format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

#This is my layout, I write this 
layout_theme = {
        'border_width':2,
        'margin':2,
        'border_focus':'#a6e3a1',
        'border_normal':'#cba6f7'
}


layouts = [
    layout.MonadTall(**layout_theme),
]

widget_defaults = dict(
    font='JetbrainsMono Nerd Font',
    fontsize=15,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [   
                widget.NvidiaSensors(),
                widget.Spacer(
                    desc = 'Is the blank space into the left'
                    ),

                widget.GroupBox(
                    highlight_method = 'block',
                    block_highlight_text_color = 'ffffff',#Catppuccin[1],
                    disable_drag = True,
                    inactive = 'ffffff',
                    rounded = False,
                    active = Catppuccin[1],
                    this_current_screen_border = Catppuccin[0]
                    ),


                widget.Spacer(),

                widget.Systray(),

                widget.Clock(
                    format='%A%e/%m  %k:%M', padding = 5
                    ),

                widget.TextBox(fmt = ' ',
                               mouse_callbacks = {"Button1": lazy.spawn('powermenu')},                               padding = 10
                               )
            ],
            size = 24,
            background = Catppuccin[2]
            
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.Popen([home])
