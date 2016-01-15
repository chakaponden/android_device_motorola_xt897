#!/system/bin/sh

if [ "${0}" = "/system/bin/mm-qcamera-daemon" ]; then
	exec "/system/bin/mm-qcamera-daemon.exec" "${@}"
elif [ "${0}" = "/system/bin/mpdecision" ]; then
	exec "/system/bin/mpdecision.exec" "${@}"
elif [ "${0}" = "/system/bin/qdumpd" ]; then
	exec "/system/bin/qdumpd.exec" "${@}"
elif [ "${0}" = "/system/bin/qmuxd" ]; then
	exec "/system/bin/qmuxd.exec" "${@}"
elif [ "${0}" = "/system/bin/rmt_storage" ]; then
	exec "/system/bin/rmt_storage.exec" "${@}"
elif [ "${0}" = "/system/bin/sensors.qcom" ]; then
	exec "/system/bin/sensors.qcom.exec" "${@}"
elif [ "${0}" = "/system/bin/thermald" ]; then
	exec "/system/bin/thermald.exec" "${@}"
elif [ "${0}" = "/system/bin/whisperd" ]; then
	exec "/system/bin/whisperd.exec" "${@}"
fi

exit 1
