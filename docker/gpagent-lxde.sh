#!/bin/bash
# Wait for the X server started by lightdm, then run gpagent on the LXDE desktop.
while [ ! -S /tmp/.X11-unix/X0 ]; do
	echo "Waiting for X server"
	sleep 1
done

export DISPLAY=:0
export XAUTHORITY=/var/run/lightdm/root/:0
exec /usr/bin/gpagent --now
