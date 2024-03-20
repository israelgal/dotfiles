
# Qtile configuration 
# User: Israelgal AKA TheDirtyDan

import os
import subprocess
from libqtile import bar, layout, widget, qtile
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
# from libqtile.utils import guess_terminal
from libqtile import hook
# from libqtile.widget.textbox import TextBox

def power():
    qtile.cmd_spawn('powermenu')

def search():
    qtile.cmd_spawn('rofi -show drun')

mod = 'mod4'
terminal = 'alacritty'

#The theme that I'm currently using
Catppuccin = [['#a6e3a1', '#a6e3a1'],
            ['#cba6f7', '#cba6f7'],
            ['#313244', '#313244']]


# sakura theme 
# ctheme = [['#1F1D2E','#1F1D2E'], # Color used in layout
#           ['#282738','#282738'], # Color used in first spacer
#           ['#CAA9E0','#CAA9E0'], # Active color in bar
#           ['#91B1F0','#91B1F0'], # block_h_t_c 
#           ['#4B427E','#4B427E'], # highlight color  
#           ['#353446','#353446'], # background color
#           ]
# color_path = '~/.config/qtile/Assets/Sakura/'

# natura theme 
ctheme = [['#1F1D2E','#1F1D2E'], # Color used in layout
          ['#0F1212','#0F1212'], # Color used in first spacer
          ['#607767','#607767'], # Active color in bar
          ['#B2BEBC', '#B2BEBC'], # block_h_t_c 
          ['#D0DAF0','#D0DAF0'], # highlight color  
          ['#202222','#202222'], # background color
          ]
color_path = '~/.config/qtile/Assets/Natura/'




keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html


    # Miscellaneous commands 

    Key([mod], 'b',
        lazy.hide_show_bar(),
        desc='Toggle qtile bar'),
    Key([mod], 'i',
        lazy.spawn('tlenguage'),
        desc='Toggle keyboard layout us-latam'),
    # Key([mod], 'm',
    #     lazy.spawn('tmic'),
    #     desc='Toggle microphone'),
    Key([mod, 'shift'], 'f',
        lazy.spawn('firefox'),
        desc='Launch firefox'),

    # Launch with rofi 
    Key([mod], 'a',
        lazy.spawn('rofi -show drun'),
        desc='Launch rofi app instance'),

    # Screenshot tool 
    Key([mod], 'p',
        lazy.spawn('screenshot select'),
        desc='Screenshot section'),
    Key([mod, 'shift'], 'p',
        lazy.spawn('screenshot'),
        desc='Screenshot'),
    
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

    # Moving between groups 
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

# groups = [Group(f"{i+1}", label="") for i in range(8)]

groups = [ Group(i) for i in '12345678']
groups.append(Group("9", label="")) 
#󰎆
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

layouts = [
   layout.MonadTall(
        border_focus=ctheme[2],
        border_normal=ctheme[0],
        margin=2,
        border_width=2,
    ),

    layout.Columns( margin= [10,10,10,10], border_focus= ctheme[0],
	    border_normal=ctheme[0],
        border_width=0,
    ),

    layout.Max(	border_focus=ctheme[0],
	    border_normal=ctheme[0],
	    margin=10,
	    border_width=0,
    ),

    layout.Floating(	border_focus=ctheme[0],
	    border_normal=ctheme[0],
	    margin=10,
	    border_width=0,
	),
    # Try more layouts by unleashing below layouts
   #  layout.Stack(num_stacks=2),
   #  layout.Bsp(),
     layout.Matrix(	border_focus=ctheme[0],
	    border_normal=ctheme[0],
	    margin=10,
	    border_width=0,
	),

    layout.MonadWide(	border_focus=ctheme[0],
	    border_normal=ctheme[0],
	    margin=10,
	    border_width=0,
	),
   #  layout.RatioTile(),
     layout.Tile(	border_focus=ctheme[0],
	    border_normal=ctheme[0],
    ),
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
                widget.Spacer(
                    length=15,
                    background= ctheme[1]),

                widget.Image(
                    filename= color_path + 'launch_Icon.png',
                    margin=2,
                    background=ctheme[1],
                    mouse_callbacks={'Button1':power},
                ),
 
                widget.Image(
                    filename= color_path + '6.png',
                ),

                widget.GroupBox(
                    fontsize=18,
                    border_width=3,
                    highlight_method = 'block',
                    active = ctheme[2],
                    block_highlight_text_color = ctheme[3],
                    highlight_color= ctheme[4],
                    inactive=ctheme[1],
                    foreground=ctheme[4],
                    background= ctheme[5],
                    this_current_screen_border=ctheme[5],
                    this_screen_border=ctheme[5],
                    other_current_screen_border=ctheme[5],
                    other_screen_border=ctheme[5],
                    urgent_border=ctheme[5],
                    rounded=True,
                    disable_drag=True,
                    font="JetBrains Mono Bold",
                    ),
                
                widget.Spacer(
                    length=8,
                    background=ctheme[5],
                ),
                
                widget.Image(
                    filename= color_path + '1.png',
                ),
                
                widget.Image(
                    filename= color_path + 'layout.png',
                    background=ctheme[5],
                ),


                widget.CurrentLayout(
                    background=ctheme[5],
                    foreground=ctheme[2],
                    fmt='{}',
                    font="JetBrains Mono Bold",
                    fontsize=13,
                ),

                widget.Image(
                    filename= color_path + '5.png',
                ),


                widget.Image(
                    filename= color_path  + 'search.png',
                    margin=2,
                    background=ctheme[1],
                    mouse_callbacks={"Button1": search},
                ),

                widget.TextBox(
                    fmt='Search',
                    background=ctheme[1],
                    font="JetBrains Mono Bold",
                    fontsize=13,
                    foreground=ctheme[2],
                    mouse_callbacks={"Button1": search},
                ),

                widget.Image(
                    filename= color_path + '4.png',
                ),


                widget.WindowName(
                    background = ctheme[5],
                    format = "{name}",
                    font='JetBrains Mono Bold',
                    foreground=ctheme[2],
                    empty_group_string = 'Desktop',
                    fontsize=13,

                ),


                widget.Image(
                    filename= color_path + '3.png',
                ),

                widget.Systray(
                    background=ctheme[1],
                    fontsize=2,
                ),


                widget.TextBox(
                    text=' ',
                    background=ctheme[1],
                ),


                # widget.Image(
                #     filename= color_path + '6.png',
                #     background=ctheme[5],
                # ),
                #

                # widget.Image(
                #     filename= color_path + 'Misc/ram.png',
                #     background=ctheme[5],
                # ),
                #
                #
                #
                # widget.Spacer(
                #     length=-7,
                #     background=ctheme[5],
                # ),
                #
                #
                # widget.Memory(
                #     background=ctheme[5],
                #     format='{MemUsed: .0f}{mm}',
                #     foreground=ctheme[2],
                #     font="JetBrains Mono Bold",
                #     fontsize=13,
                #     update_interval=5,
                # ),

                # widget.Image(
                #     filename= color_path + '2.png',
                # ),
                #

                # widget.Spacer(
                #     length=8,
                #     background=ctheme[5],
                # ),

                # widget.TextBox(
                #     fmt = '󰏈',
                #     background=ctheme[5],
                #     foreground=ctheme[2],
                #     font="JetBrains Mono Bold",
                #     fontsize=15,
                # ),
                #
                # widget.Spacer(
                #     length=5,
                #     background=ctheme[5],
                # ),
                #
                # widget.NvidiaSensors(
                #     background=ctheme[5],
                #     # format='{MemUsed: .0f}{mm}',
                #     foreground=ctheme[2],
                #     font="JetBrains Mono Bold",
                #     fontsize=13,
                #     update_interval=5,
                # ),

                
                # widget.Image(
                #     filename= color_path + '2.png',
                # ),
                #

                # widget.Spacer(
                #     length=8,
                #     background=ctheme[5],
                # ),

                # widget.Volume(
                #     font='JetBrainsMono Nerd Font',
                #     theme_path= color_path + 'Volume/',
                #     emoji=True,
                #     fontsize=13,
                #     background=ctheme[5],
                # ),

                # widget.pulse_volume.PulseVolume(
                #     font='JetBrainsMono Nerd Font',
                #     theme_path= color_path + 'Volume/',
                #     emoji=True,
                #     fontsize=13,
                #     background=ctheme[5],
                # ),

                # widget.Spacer(
                #     length=-5,
                #     background=ctheme[5],
                #     ),
                #
                #
                # widget.Volume(
                #     font='JetBrains Mono Bold',
                #     background=ctheme[5],
                #     foreground=ctheme[2],
                #     fontsize=13,
                # ),


                # widget.Image(
                #     filename= color_path + '5.png',
                #     background=ctheme[5],
                # ),


                widget.Image(
                    filename= color_path + 'Misc/clock.png',
                    background=ctheme[1],
                    margin_y=6,
                    margin_x=5,
                ),


                widget.Clock(
                    format='%I:%M %p',
                    background=ctheme[1],
                    foreground=ctheme[2],
                    font="JetBrains Mono Bold",
                    fontsize=15,
                ),


                widget.Spacer(
                    length=18,
                    background=ctheme[1],
                ),

            ],
            size = 30,
            border_color = ctheme[1],
            border_width = [0,0,0,0],
            margin = [6,40,6,40],
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
