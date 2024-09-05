{ fetchFromGitHub, lib, stdenvNoCC }:

stdenvNoCC.mkDerivation rec {
  pname = "plymouth-theme-neat";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "Joseph-DiGiovanni";
    repo = "plymouth-theme-neat-nixos";
    rev = "v${version}";
    sha256 = "sha256-kpRjnAVjRZMYe5hea4dVHTBwOCfQpQrJqaYuQWG/z3U=";
  };

  dontBuild = true;

  patchPhase = ''
    substituteInPlace src/neat.plymouth --replace "/usr/" "$out/"
  '';

  installPhase = ''
    mkdir -p $out/share/plymouth/themes/neat
    cp -r src/* $out/share/plymouth/themes/neat
  '';

  meta = with lib; {
    description = "HiDPI-Friendly Plymouth Theme for NixOS";
    homepage = "https://github.com/neetly/plymouth-theme-neat";
    license = licenses.mit;
    platforms = platforms.linux;
    maintainers = with maintainers; [ Joseph-DiGiovanni ];
  };
}
