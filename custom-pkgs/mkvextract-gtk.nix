{ boost, cmake, fetchFromGitHub, gtkmm3, lib, makeWrapper, mkvtoolnix-cli, pkg-config, stdenv }:

stdenv.mkDerivation rec {
  pname = "mkvextract-gtk";
  version = "0.9.6";

  src = fetchFromGitHub {
    owner = "Joseph-DiGiovanni";
    repo = pname;
    rev = version;
    sha256 = "sha256-rpCua6VQ2zOCvCMj9QUMhuq2nKYWJ81+U8KT1XTdnNA=";
  };

  nativeBuildInputs = [
    boost
    cmake
    gtkmm3
    makeWrapper
    pkg-config
  ];

  configurePhase = ''
    cmake .
  '';

  installPhase = ''
    install -Dm755 mkvextract-gtk $out/bin/mkvextract-gtk
    install -Dm644 desktop/mkvextract-gtk.desktop $out/share/applications/mkvextract-gtk.desktop
    install -Dm644 desktop/mkvextract-gtk.png $out/share/icons/hicolor/256x256/apps/mkvextract-gtk.png
  '';

  postFixup = ''
    wrapProgram $out/bin/mkvextract-gtk --set PATH ${lib.makeBinPath [ mkvtoolnix-cli ]}
  '';

  meta = with lib; {
    description = "Extract tracks from matroska (mkv) files";
    homepage = "https://github.com/Joseph-DiGiovanni/mkvextract-gtk/";
    license = with licenses; [ gpl2 ];
    maintainers = with maintainers; [ Joseph-DiGiovanni ];
    platforms = platforms.unix;
    mainProgram = "mkvextract-gtk";
  };
}
