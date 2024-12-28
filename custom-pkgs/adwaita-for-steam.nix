{ customCss ? null, extraOptions ? [ ], fetchFromGitHub, lib, python3, stdenvNoCC, ... }:

let
  customCssFlag = if customCss != null then "--custom-css" else "";
  extras = builtins.concatStringsSep " " (map (s: "-e ${s}") extraOptions);
  importCustomCSS = if customCss != null then "cp -rf ${customCss} ./custom/custom.css" else "rm ./custom/custom.css";
in
stdenvNoCC.mkDerivation rec {
  name = "adwaita-for-steam";
  version = "3.1";

  src = fetchFromGitHub {
    owner = "tkashkin";
    repo = "Adwaita-for-Steam";
    rev = "v${version}";
    hash = "sha256-V2Ps4jP7UeoXTY1q7gLbWVQW9WwUzMM6RPYUvNDAJ0I=";
  };

  preferLocalBuild = true;

  nativeBuildInputs = [ python3 ];

  buildPhase = ''
    mkdir build
    ${importCustomCSS}
    python install.py --target ./build ${customCssFlag} ${extras}
    find ./build -type f \( -name "README.md" -o -name ".gitignore" \) -delete # Remove unnecessary files
  '';

  installPhase = ''
    mv build $out
  '';

  meta = with lib; {
    description = "A skin to make Steam look like a native GTK application";
    homepage = "https://github.com/tkashkin/Adwaita-for-Steam";
    license = licenses.mit;
    maintainers = with maintainers; [ jdigi78 ];
    mainProgram = "adwaita-for-steam";
  };
}
