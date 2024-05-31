if type "xrandr"; then
  for m in $(xrandr --query | grep " primary" | cut -d" " -f1); do
    MONITOR=$m polybar --reload --config="$HOME/.config/polybar/config.ini" toph &
  done
else
  polybar --reload toph &
fi
