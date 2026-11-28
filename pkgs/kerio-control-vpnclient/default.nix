{ lib
, stdenv
, fetchurl
, dpkg
, autoPatchelfHook
, makeWrapper
, curl
, libxcrypt-legacy
, util-linux
, zlib
, iproute2
, nettools
, openresolv
, procps
, kmod
, coreutils
, bash
, gnugrep
, gnused
, gawk
}:

stdenv.mkDerivation rec {
  pname = "kerio-control-vpnclient";
  version = "9.4.5-8629";

  src = fetchurl {
    url = "https://cdn.kerio.com/dwn/control/control-9.4.5-8629/kerio-control-vpnclient-9.4.5-8629-linux-amd64.deb";
    hash = "sha256-rU5tinj1FN2z8u7w7GEV9oa21v+eeo8OQXXWnyZw9ys=";
  };

  nativeBuildInputs = [
    dpkg
    autoPatchelfHook
    makeWrapper
  ];

  buildInputs = [
    stdenv.cc.cc.lib
    curl
    libxcrypt-legacy
    util-linux
    zlib
  ];

  unpackPhase = ''
    runHook preUnpack
    dpkg-deb -x $src .
    runHook postUnpack
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin $out/lib $out/share

    # Locate and install the kvpncsvc daemon binary
    KVPNCSVC_PATH=$(find . -type f -name "kvpncsvc" -print -quit)
    install -Dm755 "$KVPNCSVC_PATH" $out/bin/kvpncsvc

    # Copy bundled shared libraries (libkvnet, libktssl, libktcrypto, libktz)
    find . \( -type f -o -type l \) -name "*.so*" -exec cp -P {} $out/lib/ \;

    # Preserve documentation/share assets if present
    if [ -d usr/share ]; then
      cp -r usr/share/* $out/share/ 2>/dev/null || true
    fi

    runHook postInstall
  '';

  postFixup = ''
    wrapProgram $out/bin/kvpncsvc \
      --prefix PATH : ${lib.makeBinPath [
        iproute2
        nettools
        openresolv
        procps
        kmod
        coreutils
        bash
        gnugrep
        gnused
        gawk
      ]}
  '';

  meta = with lib; {
    description = "Kerio Control VPN Client daemon";
    homepage = "https://www.gfi.com/products-and-solutions/network-security-solutions/kerio-control";
    license = licenses.unfree;
    platforms = [ "x86_64-linux" ];
    mainProgram = "kvpncsvc";
  };
}
