{ lib, stdenv, cmake, fetchFromGitHub, hidapi, pkg-config }:

#PS2 MAC is e8:6b:ea:c8:32:7a

stdenv.mkDerivation {
  pname = "sixaxispairer";
  version = "unstable-2024-08-29";

  src = fetchFromGitHub {
    owner = "user-none";
    repo = "sixaxispairer";
    rev = "e9f7c7628d95ef160793b15a2e67e6f13e1ed5d7";
    sha256 = "sha256-o9tIEXAtISEHW49x/w7W1sPh6TkBGW74pnUGca3crP8=";
  };

  nativeBuildInputs = [ cmake pkg-config ];

  buildInputs = [ hidapi ];

  cmakeFlags = [
    "-DHIDAPI_LIBRARIES=${hidapi}/lib/libhidapi-hidraw.so"
  ];

  installPhase = ''
    mkdir -p $out/bin
    cp bin/sixaxispairing $out/bin/
  '';

  meta = with lib; {
    description = "A tool for viewing and setting the Bluetooth address a Sixaxis controller is paired with.";
    homepage = "https://github.com/user-none/sixaxispairer";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
