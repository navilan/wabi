#!/usr/bin/env python3


config.load_autoconfig(False)

c.confirm_quit = ['downloads']

c.content.geolocation = False
c.content.headers.do_not_track = True
c.content.cookies.accept = "no-3rdparty"
c.content.canvas_reading = False

c.input.insert_mode.auto_load = True
c.scrolling.smooth = True

c.tabs.position = 'top'
c.tabs.show = 'switching'

c.window.hide_decoration = True
