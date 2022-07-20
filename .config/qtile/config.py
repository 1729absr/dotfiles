from typing import List
from libqtile import qtile, bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, KeyChord, Match, Screen, ScratchPad, DropDown
from libqtile.lazy import lazy
from qtile_extras import widget as ewd
#from libqtile.utils import guess_terminal
import os
import subprocess

home = os.path.expanduser('~')
gap = int(subprocess.getoutput("grep GAP= "+home+"/.local/bin/scripts/dmenu_base | awk -F '=' '{print $2}'"))
mod = "mod4"
terminal = "st"
keys = [
    # Switch between windows
    Key([mod], "h",
        lazy.layout.left(),
        desc="Move focus to left"
        ),
    Key([mod], "l",
        lazy.layout.right(),
        desc="Move focus to right"
        ),
    Key([mod], "j",
        lazy.layout.down(),
        desc="Move focus down"
        ),
    Key([mod], "k",
        lazy.layout.up(),
        desc="Move focus up"
        ),
    Key([mod],
        "space",
        lazy.layout.next(),
        desc="Move window focus to other window"
        ),

    # Move windows between left/right columns or move up/down in current stack.
    Key([mod, "shift"], "h",
        lazy.layout.shuffle_left(),
        desc="Move window to the left"
        ),
    Key([mod, "shift"], "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right"
        ),
    Key([mod, "shift"], "j",
        lazy.layout.shuffle_down(),
        desc="Move window down"
        ),
    Key([mod, "shift"], "k",
        lazy.layout.shuffle_up(),
        desc="Move window up"
        ),

    # Change windowsize.
    # -> In 'columns' layout
    Key([mod, "control"], "h",
        lazy.layout.grow_left().when(layout='columns'),
        desc="Grow window to the right"
        ),
    Key([mod, "control"], "j",
        lazy.layout.grow_down().when(layout='columns'),
        desc="Grow window to the down"
        ),
    Key([mod, "control"], "k",
        lazy.layout.grow_up().when(layout='columns'),
        desc="Grow window to the up"
        ),
    Key([mod, "control"], "l",
        lazy.layout.grow_right().when(layout='columns'),
        desc="Grow window to the left"
        ),
    # -> In monadtall and verticaltile
    Key([mod, "control"], "i",
        lazy.layout.grow().when(layout='monadtall'),
        desc="Grow in size"
        ),
    Key([mod, "control"], "m",
        lazy.layout.shrink().when(layout='monadtall'),
        lazy.layout.maximize().when(layout='verticaltile'),
        desc="Grow window to the left"
        ),
    # -> Normalize all
    Key([mod, "control"], "n",
        lazy.layout.normalize().when(layout=['columns','verticaltile']),
        lazy.layout.reset().when(layout='monadtall'),
        desc="Reset all window sizes"
        ),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"
        ),
    Key([mod], "Return",
        lazy.spawn(terminal),
        desc="Launch terminal"
        ),

    # Toggle between different layouts as defined below
    Key([mod], "Tab",
        lazy.next_layout(),
        desc="Toggle between layouts"
        ),
    Key([mod, "shift"], "Tab",
        lazy.prev_layout(),
        desc="Toggle between layouts"
        ),

    # Kill the window in focus
    Key([mod], "w",
        lazy.window.kill(),
        desc="Kill focused window"
        ),

    # Qtile restart and shutdown
    Key([mod, "control"], "r",
        lazy.restart(),
        desc="Restart Qtile"
        ),
    Key([mod, "control"], "q",
        lazy.shutdown(),
        desc="Shutdown Qtile"
        ),

    # A simple command prompt
    Key([mod], "r",
        lazy.spawncmd(),
        desc="Spawn a command using a prompt widget"
        ),
    
    # Toggle fullscreen or floating mode
    Key([mod], "f",
        lazy.window.toggle_fullscreen(),
        desc='toggle fullscreen'
        ),
    Key([mod, "shift"], "f",
        lazy.window.toggle_floating(),
        desc='toggle floating'
        ),

    # Audio control
    Key([],"XF86AudioRaiseVolume",
        lazy.spawn("change_volume +2%"),
        desc="Volume Up"
        ),
    Key([],"XF86AudioLowerVolume",
        lazy.spawn("change_volume -2%"),
        desc="Volume Down"
        ),
    Key([],"XF86AudioMute",
        lazy.spawn("change_volume toggle"),
        #lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle"),
        desc="Mute Audio"
        ),
    Key([],"XF86AudioMicMute",
        lazy.spawn("pactl set-source-mute @DEFAULT_SOURCE@ toggle"),
        desc="Mute Mic"
        ),
    # Pavucontrol
    Key([mod], "p",
        lazy.spawn("pavucontrol"),
        desc="Pulse audio volume control"
        ),

    # Brightness
    Key([], "XF86MonBrightnessUp",
        lazy.spawn("brightnessctl -s set +1%"),
        desc="Brigtness Up"
        ),
    Key([], "XF86MonBrightnessDown",
        lazy.spawn("brightnessctl -s set 1%-"),
        desc="Brightness Down"
        ),
    KeyChord([mod], "b", [
        Key([], "k",
            lazy.spawn("brightnessctl -s set +1%"),
            desc="Brigtness Up"
            ),
        Key([], "j",
            lazy.spawn("brightnessctl -s set 1%-"),
            desc="Brightness Down"
            ),
        ],
        mode="backlight"
        ),

    # PrintScreen saves it to $HOME/Pictures/Scrot
    Key([], "Print",
        lazy.spawn("scrot_full"),
        desc="Takes screen-shot of full screen"
        ),
    Key(["shift"], "Print",
        lazy.spawn("scrot_part"),
        desc="Select and take a screen-shot of selected part"
        ),

    # Browser
    # -> Firefox
    Key([mod], "x",
        lazy.spawn("firefox"),
        desc="Launch Firefox"
        ),

    # File manager
    # -> Thunar
    Key([mod], "t",
        lazy.spawn("thunar"),
        desc="Launch Thunar"
        ),

    #configs (for xterm add -wf)
    KeyChord([mod], "c", [
        # -> autostart
        Key([], "a",
            lazy.spawn(terminal+" -e nvim "+home+"/.config/qtile/autostart.sh"),
            desc="Autostart"
            ),
        # -> dunst
        Key([], "d",
            lazy.spawn(terminal+" -e nvim "+home+"/.config/dunst/dunstrc"),
            desc="dunstrc"
            ),
        # -> picom
        Key([], "p",
            lazy.spawn(terminal+" -e nvim "+home+"/.config/picom/picom.conf"),
            desc="picom config"
            ),
        # -> qtile
        Key([], "q",
            lazy.spawn(terminal+" -e nvim "+home+"/.config/qtile/config.py"),
            desc="Qtile config"
            ),
        # -> sxiv
        Key([], "s",
            lazy.spawn(terminal+" -e nvim "+home+"/.config/dunst/dunstrc"),
            desc="Sxiv Key-handler"
            ),
        ],
        mode="config"
        ),

    # Dmenu
    # -> dmenu desktop files
    Key([mod], "a",
        lazy.spawn("menu"),
        desc="menu"
        ),
    # -> dmenu_run
    Key(["mod1"], "Return",
        lazy.spawn("dmenu_mod"),
        desc="dmenu"
        ),
    KeyChord([mod], "d", [
        # -> dmenu-Pass
        Key([], "p",
            lazy.spawn("passmenu_mod"),
            desc="pass"
            ),
        # -> dmenu-emoji
        Key([], "e",
            lazy.spawn("dmenuunicode"),
            desc="Emoji support"
            ),
        # -> dmenu-ambient-sounds-player
        Key([], "a",
            lazy.spawn("ambient"),
            desc="Ambient Sound Player"
            ),
        # -> dmenu of papers and books organiser
        Key([], "r",
            lazy.spawn("rorg"),
            desc="Research Paper Organiser"
            ),
        # -> PowerMenu
        Key([mod], "p",
            lazy.spawn("powermenu")
            ),
            ],
        mode='dmenu'
        ),

    # Control mouse from keyboard
    KeyChord([mod], "m", [
        # -> move up
        Key([], "k",
            lazy.spawn("xdotool mousemove_relative -- 0 -15"),
            desc="move pointer up"
            ),
        # -> move down
        Key([], "j",
            lazy.spawn("xdotool mousemove_relative -- 0 +15"),
            desc="move pointer down"
            ),
        # -> move right
        Key([], "l",
            lazy.spawn("xdotool mousemove_relative -- +15 0"),
            desc="move pointer right"
            ),
        # -> move left
        Key([], "h",
            lazy.spawn("xdotool mousemove_relative -- -15 0"),
            desc="move pointer left"
            ),
        # -> click 1
        Key([], "b",
            lazy.spawn("xdotool click 1"),
            desc="cick left mouse button"
            ),
        # -> click 2
        Key([], "n",
            lazy.spawn("xdotool click 2"),
            desc="cick left mouse button"
            ),
        # -> click 3
        Key([], "m",
            lazy.spawn("xdotool click 3"),
            desc="cick left mouse button"
            ),
            ],
        mode='mouse'
        ),
]

group_names = [("1", {'label':'', 'layout': 'monadtall'}),
               ("2", {'label':'', 'layout': 'max'}),
               ("3", {'label':'', 'layout': 'monadtall'}),
               ("4", {'label':'', 'layout': 'monadtall'}),
               ("5", {'label':'', 'layout': 'monadtall'}),
               ("6", {'label':'', 'layout': 'monadtall'}),
               ("7", {'label':'', 'layout': 'floating'}),
               ("8", {'label':'', 'layout': 'monadtall'}),
               ("9", {'label':'', 'layout': 'monadtall'})]


groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names, 1):
	keys.append(Key([mod], str(i), lazy.group[name].toscreen(toggle=True)))        # Switch to another group
	keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name, switch_group=True))) # Send current window to another group

groups.append(ScratchPad("scratchpad", [DropDown("term", terminal, opacity=1, x=gap/1920, y=gap/1080, width=1-2*gap/1920)]))
keys.append(Key(['mod1'], 'space', lazy.group['scratchpad'].dropdown_toggle('term')))

layout_theme = {"border_width": 2,
                "margin": 8,
                "border_focus": "#04A5AA",
                "border_normal": "#43576E",#"#303232"
                "single_border_width": 0,
                "border_on_single": False
                }

layout_theme_ = layout_theme.copy()
layout_theme_["margin"] = 0

layouts = [
    layout.MonadTall(**layout_theme),
    layout.Max(**layout_theme),
    layout.Bsp(**layout_theme_),
    layout.Columns(**layout_theme),
    layout.VerticalTile(**layout_theme_),
    layout.Floating(**layout_theme),
    # layout.Stack(num_stacks=2),
    # layout.Matrix(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(**layout_theme),
    # layout.TreeTab(),
    # layout.Zoomy(**layout_theme),
]

widget_defaults = dict(
    font='mononoki Nerd Font Bold',
    fontsize=24,
    padding=4,
)

extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                #ewd.GlobalMenu(),
		        widget.TextBox(
                    text = "  ",
                    padding = 0,
		        	foreground="#1793d1",
                    mouse_callbacks={'Button1': lazy.spawn("menu"),}
                    ),
                widget.GroupBox(
                    fontsize=28,
                    borderwidth=1,
		        	rounded=False,
                    highlight_method="text",
		        	inactive = "#666666",
                    active='#dddddd',
                    this_current_screen_border="#1793d1",#"#589cc5",
                    disable_drag=True,
		        	),
		        widget.Sep(
		        	linewidth=1,
		        	padding=5,
		        	foreground="#575757",
		        	),
		        widget.CurrentLayout(
		        	foreground="#AABBCC",
		        	),
		        widget.Sep(
		        	linewidth=1,
		        	padding=5,
		        	foreground="#575757",
		        	),
                widget.Chord(
                    chords_colors={
                                    'config': ("#171919", "#1793d1"),
                                    'dmenu': ("#171919", "#994477"),
                                    'mouse': ("#171919", "#998775"),
                                    'backlight': ("#171919", "#cccc11"),
                                  },
                    ),
                widget.Prompt(
		        	padding=10,
		        	foreground='#76C92D',
		        	background='#3d3f4b',
		        	),
                #widget.StatusNotifier(),
		        widget.WindowName(
                    max_chars=40,
                    fontsize=20,
                    mouse_callbacks={
                        'Button1':lazy.spawn("xdotool key ctrl+k"),
                        'Button2':lazy.window.kill(),
                        'Button3':lazy.spawn("xdotool key F1"),
                        'Button4':lazy.layout.up(),
                        'Button5':lazy.layout.down(),}
                    ),
                widget.Cmus(
		        	background='3d3f4b',
                    play_color='76C92D',
                    max_chars=25,
                    ),
                widget.TextBox(
                    text = " ",
                    padding = 0
                    ),
                widget.Systray(
		        	icon_size=32,
		        	),
		        widget.TextBox(
                    text = "  ",
                    padding = 0
                    ),
		        widget.Backlight(
		        	backlight_name='intel_backlight',
                    change_command="brightnessctl -s set {0}%",
                    step=2
		        	),
                widget.GenPollText(
                    update_interval=1,
                    func=lambda: subprocess.check_output("show_volume").decode(),
                    mouse_callbacks={'Button4': lambda: qtile.cmd_spawn("change_volume +2%", shell=True),
                    'Button5': lambda: qtile.cmd_spawn("change_volume -2%", shell=True),
                    'Button3': lambda: qtile.cmd_spawn("change_volume toggle", shell=True),
                    'Button2': lambda: qtile.cmd_spawn("pavucontrol", shell=True),}
                    ),
                widget.TextBox(
                    text = " ",
                    padding = 0
                    ),
                widget.GenPollText(
                    update_interval=2,
                    func=lambda: subprocess.check_output("battery").decode(),
                    ),
                widget.Clock(
		        	padding=5,
                    format=' %H:%M',
                    mouse_callbacks={"Button1":lambda:qtile.cmd_spawn("calendar c"),
                    'Button4': lambda: qtile.cmd_spawn("calendar p"),
                    'Button5': lambda: qtile.cmd_spawn("calendar n"),}
		        	),
                widget.TextBox(
                    text = "",
                    #foreground="#AA7700",
                    padding = 10,
                    mouse_callbacks={"Button1":lambda:qtile.cmd_spawn("powermenu")}
                    ),
            ],
            34,
            background="#171717",#"#1b1d24",
            margin=[gap, gap, 0, gap],
	        #opacity=0.1
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position()
        ),
    Drag([mod], "Button3",
        lazy.window.set_size_floating(),
        start=lazy.window.get_size()
        ),
    Drag([mod,"mod1"], "Button1",
        lazy.window.set_size_floating(),
        start=lazy.window.get_size()
        ),
    Click([mod], "Button2",
        lazy.window.bring_to_front()
        ),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='hp-toolbox'),   #hp-printer
    Match(wm_class='lxappearance'),
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(wm_class='pavucontrol'), # pavucontrol-gtk
    Match(wm_class='pinentry-gtk-2'), # Pass
    Match(wm_class='matplotlib'),
    Match(wm_class='xbindkeys_show'),
    Match(wm_class='display'),  # ImageMagick Display
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
],**layout_theme)
auto_fullscreen = True
focus_on_window_activation = "smart"

def f1():
    os.system(home + '/.config/qtile/autostart.sh')
hook.subscribe.startup_once(f1)

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
