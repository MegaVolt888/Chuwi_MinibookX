#!/bin/bash

{
echo mxc4005 0x15 > /sys/bus/i2c/devices/i2c-0/new_device > /dev/null
echo mxc4005 0x15 > /sys/bus/i2c/devices/i2c-1/new_device > /dev/null
} ||
{
echo "The device is already ready"
}

echo "sensor:modalias:acpi:/dev/iio-device0
 ACCEL_MOUNT_MATRIX=0, 1, 0; 1, 0, 0; 0, 0, 1" > /etc/udev/hwdb.d/61-sensor-local.hwdb

echo "sensor:modalias:acpi:/dev/iio-device1
 ACCEL_MOUNT_MATRIX=0, 1, 0; 1, 0, 0; 0, 0, 1" >> /etc/udev/hwdb.d/61-sensor-local.hwdb

function no_pos {
 echo -n $1
}

function to_pos {
if ! [ "$1" -gt 0 ]; then
    echo -n $(($1*-1))
else
    echo -n $1
fi
}

function is_vertical {

if  [ $(($1+$2)) -gt 500 ]; then
  echo 1
else
 echo 0
fi
}

XA=$(no_pos `cat /sys/bus/iio/devices/iio:device0/in_accel_x_raw`)
YA=$(to_pos `cat /sys/bus/iio/devices/iio:device0/in_accel_y_raw`)
ZA=$(no_pos `cat /sys/bus/iio/devices/iio:device0/in_accel_z_raw`)

XB=$(no_pos `cat /sys/bus/iio/devices/iio:device1/in_accel_x_raw`)
YB=$(to_pos `cat /sys/bus/iio/devices/iio:device1/in_accel_y_raw`)
ZB=$(no_pos `cat /sys/bus/iio/devices/iio:device1/in_accel_z_raw`)

ANGLE=$(./angle  $XA $ZA $XB $ZB)
VERTICAL=$(is_vertical $YA $YB )

echo "Angle: $ANGLE"
echo ""
echo "Vertical: $VERTICAL"
echo "Is tablet $TABLET"
