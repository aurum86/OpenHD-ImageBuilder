# Do this to the WORK folder of this stage
# Make version number visible, rename fat partition
pushd ${STAGE_WORK_DIR}

mv -f ${STAGE_WORK_DIR}/mnt/openhd_version.txt ${WORK_DIR}/openhd_version.txt; true


MNT_DIR="${STAGE_WORK_DIR}/mnt"

if [[ "${HAVE_CONF_PART}" == "false" ]] && [[ "${HAVE_BOOT_PART}" == "true" ]]; then
# Rename the DOS partition
    BOOT_MNT_DIR="${STAGE_WORK_DIR}/mnt/boot"
    BOOT_LOOP_DEV="$(findmnt -nr -o source $BOOT_MNT_DIR)"

    fatlabel "$BOOT_LOOP_DEV" "OPENHD"
fi


#return
popd
