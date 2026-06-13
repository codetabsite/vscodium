# VSCodium Kurulum Paketi

Senin geliştirme ortamına özel: Android (Kotlin), Python/Pygame, embedded, Linux araçları.

---

## Dosyalar

| Dosya | Ne yapar |
|---|---|
| `settings.json` | Editör + git + terminal optimizasyonu |
| `keybindings.json` | Kısayol haritası |
| `matrix-green-theme.json` | Özel Matrix teması |
| `github-actions.code-snippets` | GHA snippet'leri |
| `install-extensions.sh` | Extension kurulum scripti |

---

## Kurulum

### 1. settings.json ve keybindings.json

Linux Mint:
```bash
cp settings.json ~/.config/VSCodium/User/settings.json
cp keybindings.json ~/.config/VSCodium/User/keybindings.json
```

### 2. Matrix Green Tema

```bash
# Tema klasörü oluştur
mkdir -p ~/.vscode-oss/extensions/matrix-green-theme/themes

# Tema dosyalarını koy
cp matrix-green-theme.json ~/.vscode-oss/extensions/matrix-green-theme/themes/

# package.json oluştur
cat > ~/.vscode-oss/extensions/matrix-green-theme/package.json << 'EOF'
{
  "name": "matrix-green-theme",
  "displayName": "Matrix Green",
  "version": "1.0.0",
  "publisher": "codetabsite",
  "engines": { "vscode": "^1.60.0" },
  "categories": ["Themes"],
  "contributes": {
    "themes": [{
      "label": "Matrix Green",
      "uiTheme": "vs-dark",
      "path": "./themes/matrix-green-theme.json"
    }]
  }
}
EOF
```

VSCodium'u yeniden başlat → `Ctrl+K Ctrl+T` → "Matrix Green" seç.

### 3. Extensions

```bash
chmod +x install-extensions.sh
./install-extensions.sh
```

### 4. GitHub Actions Snippets

```bash
mkdir -p ~/.config/VSCodium/User/snippets
cp github-actions.code-snippets ~/.config/VSCodium/User/snippets/
```

YAML dosyasında `gha-android` yaz → Tab.

---

## GitHub Actions Snippet'leri

| Prefix | Ne üretir |
|---|---|
| `gha-android` | APK build + sign + release |
| `gha-deb` | Debian .deb paketi |
| `gha-pygame` | PyInstaller binary |
| `gha-release` | Tag'e göre release |
| `gha-secrets` | Keystore secret kurulum notu |

---

## Önemli Kısayollar

| Kısayol | İşlev |
|---|---|
| `Ctrl+Shift+U` | git push |
| `Ctrl+Shift+I` | git pull |
| `Ctrl+Shift+M` | git commit all |
| `Ctrl+Alt+S` | git stash |
| `Ctrl+D` | Satırı aşağı kopyala |
| `Alt+↑/↓` | Satır taşı |
| `Ctrl+/` | Yorum satırı |
| `F2` | Rename |
| `F12` | Go to definition |

---

## Termux'ta VSCodium

Termux'ta doğrudan çalışmaz ama SSH + remote development ile kullanılabilir:

```bash
# Termux'ta SSH server
pkg install openssh
sshd

# Linux Mint'te VSCodium'a Remote-SSH extension kur
# sonra Termux IP:8022'ye bağlan
```
