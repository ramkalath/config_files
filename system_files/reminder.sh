
time="${1}"

if [[ -z ${time} ]]; then
  echo "Need a time to ring!" >&2
  exit 1
fi

echo "DISPLAY=:0 xmessage alarm" | at ${time}
