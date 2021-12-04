from typing import List  # noqa: F401
from libqtile import qtile, bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
import os
import subprocess

mod = "mod4"
terminal = "lxterminal"#guess_terminal()
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

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "j",
        lazy.layout.grow_down().when(layout='columns'),
        lazy.layout.grow().when(layout='verticaltile'),
        desc="Grow window to the down"
        ),
    Key([mod, "control"], "k",
        lazy.layout.grow_up().when(layout='monadtall'),
        lazy.layout.shrink().when(layout='verticaltile'),
        desc="Grow window to the up"
        ),
    Key([mod, "control"], "h",
        lazy.layout.grow_left().when(layout='columns'),
        lazy.layout.grow().when(layout='monadtall'),
        desc="Grow window to the right"
        ),
    Key([mod, "control"], "l",
        lazy.layout.grow_right().when(layout='columns'),
        lazy.layout.shrink().when(layout='monadtall'),
        desc="Grow window to the left"
        ),
    Key([mod, "control"], "n",
        lazy.layout.normalize().when(layout='columns'),
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

    #Audio control
    Key([],"XF86AudioRaiseVolume",
        lazy.spawn("change_volume +1%"),
        desc="Volume Up"
        ),
    Key([],"XF86AudioLowerVolume",
        lazy.spawn("change_volume -1%"),
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
    ## Pavucontrol
    Key([mod], "p",
        lazy.spawn("pavucontrol"),
        desc="Pulse audio volume control"
        ),

    #Brightness
    Key([], "XF86MonBrightnessUp",
        lazy.spawn("brightnessctl -s set +150"),
        desc="Brigtness Up"
        ),
    Key([], "XF86MonBrightnessDown",
        lazy.spawn("brightnessctl -s set 150-"),
        desc="Brightness Down"
        ),

    #PrintScreen saves it to $HOME/Pictures/Scrot
    Key([], "Print",
        lazy.spawn("scrot_full"),
        desc="Takes screen-shot of full screen"
        ),
    Key(["shift"], "Print",
        lazy.spawn("scrot_part"),
        desc="Select and take a screen-shot of selected part"
        ),

    #Browser
    ## Firefox
    Key([mod], "x",
        lazy.spawn("firefox"),
        desc="Launch Firefox"
        ),
    ## QuteBrowser
    Key([mod], "z",
        lazy.spawn("qutebrowser"),
        desc="Launch QuteBrowser"
        ),
    ## nyxt
    Key([mod], "b",
        lazy.spawn("/home/yoda/Activities/OSS/Wexond.AppImage"),
        desc="Launch Chromium"
        ),

    #configs (for xterm add -wf)
    ## qtile
    Key([mod], "F1",
        lazy.spawn("lxterminal -e nvim /home/yoda/.config/qtile/config.py"),
        desc="Qtile config"
        ),
    ### qtile autostart
    Key([mod], "F2",
        lazy.spawn("lxterminal -e nvim /home/yoda/.config/qtile/autostart.sh"),
        desc="Qtile config"
        ),
    ## picom
    Key([mod], "F3",
        lazy.spawn("lxterminal -e nvim /home/yoda/.config/picom/picom.conf"),
        desc="picom config"
        ),
    
    #PowerMenu
    Key([mod, "shift"],"p",
        lazy.spawn("/home/yoda/.config/rofi/powermenu/powermenu.sh")
        ),

    #File manager (Thunar)
    Key([mod], "t",
        lazy.spawn("thunar"),
        desc="Launch Thunar"
        ),

    # Rofi
    Key(["mod1"], "Return",
        lazy.spawn("rofi -show drun"),
        desc="Launch rofi app launcher"
        ),
    # Rofi-Pass
    Key([mod, "mod1"], "Return",
        lazy.spawn("rofi-pass"),
        desc="Rofi-Pass"
        ),

    #LibreOffice
    Key([mod], "o",
        lazy.spawn("/home/yoda/Activities/OSS/LibreOffice.AppImage")
        ),

    # Cool Features ## requires: "xclip"
    Key([mod, "mod1"], "m",
        lazy.spawn("mlink"),
        desc="Play the copied link in mpv"
        ),
]

group_names = [("", {'layout': 'monadtall'}),
               ("", {'layout': 'max'}),
               ("", {'layout': 'monadtall'}),
               ("", {'layout': 'monadtall'}),
               ("", {'layout': 'monadtall'}),
               ("", {'layout': 'monadtall'}),
               ("", {'layout': 'floating'}),
               ("", {'layout': 'monadtall'}),
               ("", {'layout': 'monadtall'})]

groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names, 1):
	keys.append(Key([mod], str(i), lazy.group[name].toscreen()))        # Switch to another group
	keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name, switch_group=True))) # Send current window to another group

layout_theme = {"border_width": 1,
                "margin": 8,
                "border_focus": "#555555",#"6BA7C0",
                "border_normal": "#303232"#"1D2330"
                }

layouts = [
    layout.MonadTall(**layout_theme),
    layout.Max(**layout_theme),
    layout.Columns(**layout_theme),
    layout.VerticalTile(**layout_theme),
    layout.Floating(**layout_theme),
    # layout.Stack(num_stacks=2),
    # layout.Bsp(**layout_theme),
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
        widget.GroupBox(
			fontsize=34,
			borderwidth=3,
			rounded=False,
			highlight_method="line",
			inactive = "888888",
			highlight_color="#444444",#["#3d3f4b", "#434758"],
			foreground="#ffffff",
            disable_drag=True
			),
		widget.Sep(
			linewidth=1,
			padding=5,
			foreground="#575757",
			),
		widget.CurrentLayout(
			foreground="AABBCC",
			),
		widget.Sep(
			linewidth=1,
			padding=5,
			foreground="#575757",
			),
        widget.Prompt(
			padding=10,
			foreground='76C92D',
			background='#3d3f4b',
			),
		widget.WindowName(
            max_chars=60,
            fontsize=20,
            ),
        widget.Cmus(
			background='3d3f4b',
            play_color='76C92D',
            max_chars=25,
            ),
        widget.Chord(
            chords_colors={
                            'launch': ("#ff0000", "#ffffff"),
                          },
            name_transform=lambda name: name.upper(),
            ),
        widget.TextBox(
            text = " ",
            padding = 0
            ),
#        "  ",
#        widget.Sep(
#			linewidth=1,
#			padding=5,
#			foreground="#575757",
#			),
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
#        widget.GenPollText(
#            update_interval=0.08,
#            func=lambda: subprocess.check_output("show_volume").decode(),
#            mouse_callbacks={'Button4': lambda: qtile.cmd_spawn("change_volume +2%", shell=True),
#            'Button5': lambda: qtile.cmd_spawn("change_volume -2%", shell=True),
#            'Button3': lambda: qtile.cmd_spawn("change_volume toggle", shell=True),
#            'Button2': lambda: qtile.cmd_spawn("pavucontrol", shell=True),}
#            ),
        widget.TextBox(
            text = " ",
            padding = 0
            ),
        widget.GenPollText(
            update_interval=2,
            func=lambda: subprocess.check_output("battery").decode(),
            mouse_callbacks={'Button1': lambda: qtile.cmd_spawn("battery --c left-click", shell=True)}
            ),
        widget.Clock(
			padding=5,
            format=' %H:%M',#%d %B
            mouse_callbacks={"Button1":lambda:qtile.cmd_spawn("dateandtime")}
			),
            ],
            34,
	    background="#1b1d24",#"#282c34",
        #margin=[8, 8, 0, 8],
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
    Match(wm_class='pinentry-gtk-2'), #Pass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
],**layout_theme)
auto_fullscreen = True
focus_on_window_activation = "smart"

def f1():
    home = os.path.expanduser('~')
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
