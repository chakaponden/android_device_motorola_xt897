#!/bin/bash

<<<<<<< HEAD
export DEVICE=xt897
export FAMILY_DEVICE=xt897

../$FAMILY_DEVICE/extract-files-msm8960_jbbl-common.sh $@
=======
# Check to see if the user passed a folder in to extract from rather than adb pull
if [ $# -eq 1 ]; then
    COPY_FROM=$1
    test ! -d "$COPY_FROM" && echo error reading dir "$COPY_FROM" && exit 1
fi

set -e

function extract() {
    for FILE in `egrep -v '(^#|^$)' $1`; do
        echo "Extracting /system/$FILE ..."
        OLDIFS=$IFS IFS=":" PARSING_ARRAY=($FILE) IFS=$OLDIFS
        FILE=`echo ${PARSING_ARRAY[0]} | sed -e "s/^-//g"`
        DEST=${PARSING_ARRAY[1]}
        if [ -z $DEST ]; then
            DEST=$FILE
        fi
        DIR=`dirname $FILE`
        if [ ! -d $2/$DIR ]; then
            mkdir -p $2/$DIR
        fi
        if [ "$COPY_FROM" = "" ]; then
            # Try CM target first
            if [ -f /system/$DEST ]; then
                adb pull /system/$DEST $2/$DEST
            else
                # if file does not exist try OEM target
                if [ "$?" != "0" ]; then
                    adb pull /system/$FILE $2/$DEST
                fi
            fi
        else
            # Try CM target first
            if [ -f $COPY_FROM/$DEST ]; then
                cp $COPY_FROM/$DEST $2/$DEST
            else
                # if file does not exist try OEM target
                if [ "$?" != "0" ]; then
                    cp $COPY_FROM/$FILE $2/$DEST
                fi
            fi
        fi
    done
}

DEVICE_BASE=../../../vendor/$VENDOR/$DEVICE/proprietary
rm -rf $DEVICE_BASE/*

# Extract the device specific files
extract ../../$VENDOR/$DEVICE/device-proprietary-files.txt $DEVICE_BASE

# Check if their is a family device tree for this device
if [ ! -z $FAMILY_DEVICE ]; then
    FAMILY_BASE=../../../vendor/$VENDOR/$FAMILY_DEVICE/proprietary
    rm -rf $FAMILY_BASE/*

    # Check if there are files common to all devices but family specific
    if [ -f ../../$VENDOR/$FAMILY_DEVICE/proprietary-files.txt ]; then
        extract ../../$VENDOR/$FAMILY_DEVICE/proprietary-files.txt $DEVICE_BASE
    fi
    # Extract the files common to all devices using this common device tree
    extract ../../$VENDOR/$FAMILY_DEVICE/common-proprietary-files.txt $FAMILY_BASE
fi

# Check if their is a common device tree for this device
if [ ! -z $COMMON_DEVICE ]; then
    COMMON_BASE=../../../vendor/$VENDOR/$COMMON_DEVICE/proprietary
    rm -rf $COMMON_BASE/*

    # Check if there are files common to all devices but device specific
    if [ -f ../../$VENDOR/$COMMON_DEVICE/proprietary-files.txt ]; then
        extract ../../$VENDOR/$COMMON_DEVICE/proprietary-files.txt $DEVICE_BASE
    fi
    # Extract the files common to all devices using this common device tree
    extract ../../$VENDOR/$COMMON_DEVICE/common-proprietary-files.txt $COMMON_BASE
fi

../$COMMON_DEVICE/setup-makefiles.sh
>>>>>>> qcom-common
