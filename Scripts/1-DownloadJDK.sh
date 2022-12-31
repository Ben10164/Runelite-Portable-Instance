curl -L "https://github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.17%2B8/OpenJDK11U-jdk_aarch64_mac_hotspot_11.0.17_8.tar.gz" --output mac.tar.gz

mkdir jdk-11
tar -xf mac.tar.gz -C jdk-11 --strip-components 1
rm mac.tar.gz