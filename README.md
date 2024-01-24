# 🪄 Sei

> A fixed, patched, and modified window manager from a dwm base

[![Screenshot](https://i.imgur.com/GEDBZ6N.png)](https://i.imgur.com/GEDBZ6N.png)

## Installation

```bash
git clone https://github.com/Fuwn/seiwm.git
cd seiwm
sudo ninja install

# or

curl https://raw.githubusercontent.com/Fuwn/seiwm/master/PKGBUILD
makepkg -si
```

### Build Dependencies

- [FreeType2](https://freetype.org/)
- [libX11](https://x.org/releases/current/doc/libX11/libX11/libX11.html)
- [libXft](https://gitlab.freedesktop.org/xorg/lib/libxft)
- [Imlib2](https://docs.enlightenment.org/api/imlib2/html/index.html)
- [GNU FriBidi](https://github.com/fribidi/fribidi)
- [libXinerama](https://gitlab.freedesktop.org/xorg/lib/libxinerama)
- [xcb](https://xcb.freedesktop.org/)

## Recommendations

- Use [Compfy](https://github.com/allusive-dev/compfy) for X11 compositing for
  "transparency, background blurring, rounded corners, animations and way more!"
- Install and specify [Zig](https://ziglang.org/) as `CC` inside of
  [`rules.ninja`](https://github.com/Fuwn/seiwm/blob/master/rules.ninja#L42) for
  improved memory allocation efficiency and runtime speed: `CC = zig cc`

## Sei Specific Fixes & Patches

- Removed refresh rate limit
- Fixed tray position and button responsiveness for use with custom padding
- Reactive bar toggling: If the user has manually toggled the bar visibility
  using <kbd>mod+b</kbd>, the bar
  will stay locked with the same visibility. If the user has not manually
  toggled the bar visibility, the bar visibility will
  reflect that of the full-screen state.
- Clear nametag patch's current tag name upon new assignment and reset tag name
  to default upon empty string. (why is this not default behaviour?)
- Append mode for nametag: Chose between appending the name of a tag to the
  default name or to overwrite it completely
- XSession desktop entry
- centretitle patch toggle
- `followclient`: Optionally follow a client's view if the target tag is empty
- `systraypinning` toggle fix: If `systraypinning` is enabled, the system tray will
  only toggle its visibility if the mutation originates from the monitor it is
  pinned on.

## "Official" Patches

- [xresources](https://dwm.suckless.org/patches/xresources/): Applies colours
  and other variables (i.e. using [`pywal`](https://github.com/dylanaraps/pywal)
  , etc.)
- [scratchpad](https://dwm.suckless.org/patches/scratchpad/): Accessible using
  <kbd>mod+shift+enter</kbd>
- [fibonacci](https://dwm.suckless.org/patches/fibonacci/),
  [deck](https://dwm.suckless.org/patches/deck/),
  [centeredmaster](https://dwm.suckless.org/patches/centeredmaster/), and more:
  New layout options bound to keys <kbd>super+(shift+)t/y/u/i</kbd>
- [actualfullscreen](https://dwm.suckless.org/patches/actualfullscreen/): Using
  <kbd>super+f</kbd>, and prevents focus shifting
- [sticky](https://dwm.suckless.org/patches/sticky/): Persist window across all
  tags using <kbd>super+s</kbd>
- [statuscmd](https://dwm.suckless.org/patches/statuscmd/): A clickable status
  bar, applied if using Luke Smith's build of [dwmblocks](https://github.com/lukesmithxyz/dwmblocks)
- [hide vacant tags](https://dwm.suckless.org/patches/hide_vacant_tags/): Hides
  tags with no windows
- [stacker](https://dwm.suckless.org/patches/stacker/): Move windows up the
  stack manually using <kbd>super-K/J</kbd>
- [shiftview](https://dwm.suckless.org/patches/nextprev/): Cycle through tags
  using <kbd>super+g/;</kbd>
- [vanitygaps](https://dwm.suckless.org/patches/vanitygaps/): Gaps allowed
  across all layouts
- [swallow](https://dwm.suckless.org/patches/swallow/): Replaces terminal with
  program if spawned from terminal
- [systray](https://dwm.suckless.org/patches/systray/): Functional system tray
- [bidi](https://dwm.suckless.org/patches/bidi/): Bidirectional text support
- [barpadding](https://dwm.suckless.org/patches/barpadding/): Padding for status
  bar
- [winicon](https://dwm.suckless.org/patches/winicon/): Active window icon shown
  in status bar
- [attachaside](https://dwm.suckless.org/patches/attachaside/): Attach and focus
  new clients to the side instead of making it the new master
- [zoomswap](https://dwm.suckless.org/patches/zoomswap/): Swap client and master
  in-place when assigning new master
- [pertag](https://dwm.suckless.org/patches/pertag/): Tag-unique layouts
- [combo](https://dwm.suckless.org/patches/combo/): View multiple tags at once by
  holding down the mod key and one or more tag
- [nametag](https://dwm.suckless.org/patches/nametag/): Name tags using <kbd>mod+n</kbd>
- [centretitle](https://dwm.suckless.org/patches/centretitle/): Optionally
  centre the focused client's title
- [cursor](https://dwm.suckless.org/patches/cursorwarp/): Warps the mouse cursor
  to the center of the target window when changing focus
