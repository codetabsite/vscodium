#!/usr/bin/env bash
# VSCodium extension kurulum scripti
# Çalıştır: bash install-extensions.sh

EXTENSIONS=(
  # --- Kotlin / Android ---
  "fwcd.kotlin"                          # Kotlin language server
  "mathiasfrohlich.kotlin"               # Kotlin syntax

  # --- Python / Pygame ---
  "ms-python.python"                     # Python (VSX registry'den)
  "ms-python.black-formatter"            # Black formatter

  # --- Web / React Native ---
  "dbaeumer.vscode-eslint"               # ESLint
  "esbenp.prettier-vscode"               # Prettier
  "ms-vscode.vscode-typescript-next"     # TypeScript

  # --- YAML / GitHub Actions ---
  "redhat.vscode-yaml"                   # YAML şema desteği
  "github.vscode-github-actions"         # GHA workflow editörü

  # --- Git ---
  "eamodio.gitlens"                      # GitLens (güçlü git UI)
  "mhutchie.git-graph"                   # Git graph görselleştirme
  "github.vscode-pull-request-github"    # PR yönetimi

  # --- Tema / UI ---
  "pkief.material-icon-theme"            # Dosya ikonları

  # --- Genel ---
  "christian-kohler.path-intellisense"   # Path autocomplete
  "streetsidesoftware.code-spell-checker" # Yazım denetimi
  "aaron-bond.better-comments"           # Renkli yorumlar
  "wakatime.vscode-wakatime"             # Kod istatistikleri (opsiyonel)

  # --- Embedded / Arduino ---
  "vsciot-vscode.vscode-arduino"         # Arduino (ESP32 için)
  "ms-vscode.cpptools"                   # C/C++ (Arduino)

  # --- Dockerfile ---
  "ms-azuretools.vscode-docker"          # Docker desteği
)

echo "VSCodium extension kurulumu başlıyor..."
echo ""

for ext in "${EXTENSIONS[@]}"; do
  # Yorum satırlarını atla
  [[ "$ext" == \#* ]] && { echo "--- $ext ---"; continue; }
  [[ -z "$ext" ]] && continue

  echo -n "  Kuruluyor: $ext ... "
  codium --install-extension "$ext" --force 2>/dev/null \
    && echo "OK" \
    || echo "ATILDI (bulunamadı)"
done

echo ""
echo "Tamamlandı. VSCodium'u yeniden başlat."
