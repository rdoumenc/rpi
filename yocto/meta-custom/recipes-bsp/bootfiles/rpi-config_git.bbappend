
do_deploy_append() {
    echo 'dtoverlay=rpi-ft5406' >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    echo 'ignore_lcd=0' >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    echo 'lcd_rotate=2' >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
}
