#!/usr/bin/env nix-shell
#!nix-shell -p "python3.withPackages (p: with p; [i3ipc])" -i python

# https://github.com/swaywm/sway/issues/2787#issuecomment-429658379

import i3ipc

ipc = i3ipc.Connection()

exclude = {'firefox', 'zathura'}
PROPS = 'name app_id'.split()

def should_be_opaque(c):
    properties = [getattr(c, prop, "") for prop in PROPS]
    print(properties)
    
    return c.focused or any(s in prop.lower() for s in exclude for prop in properties)


def visible(c):
    wr = c.window_rect
    return any((wr.width, wr.height))


def on_window_focus(ipc, e):
    # We do this in two passes to make sure there's always a non-transparent window
    for b in [True, False]:
        for c in ipc.get_tree():
            if visible(c) and (should_be_opaque(c) == b):
                c.command(f'opacity {1 if b else 0.9}')


ipc.on("window::focus", on_window_focus)
ipc.main() # enter command loop
