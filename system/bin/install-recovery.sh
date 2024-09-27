#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 9568256 c0acbb924aa3e2a8bca91adf8ccab3979cf09a8b 6453248 2b3f402657bbfc0e0f32f623a6f743e1421ca5ab
fi
if ! applypatch -c EMMC:/dev/block/platform/dw_mmc.0/by-name/RECOVERY:9568256:c0acbb924aa3e2a8bca91adf8ccab3979cf09a8b; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/dw_mmc.0/by-name/BOOT:6453248:2b3f402657bbfc0e0f32f623a6f743e1421ca5ab EMMC:/dev/block/platform/dw_mmc.0/by-name/RECOVERY c0acbb924aa3e2a8bca91adf8ccab3979cf09a8b 9568256 2b3f402657bbfc0e0f32f623a6f743e1421ca5ab:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
