#!/data/data/com.termux/files/usr/bin/bash

echo "Installing NexTerm..."

# Script'in gerçek bulunduğu klasör
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

TARGET="$PREFIX/opt/nexterm"

# Eski kurulumu temizle
rm -rf "$TARGET"
mkdir -p "$TARGET"

# Tüm dosyaları kopyala
cp -r "$SCRIPT_DIR"/* "$TARGET"

# Çalıştırılabilir yap
chmod +x "$TARGET/nexterm"

# Global komut linki
ln -sf "$TARGET/nexterm" "$PREFIX/bin/nexterm"

echo "Installation complete."
echo "You can now run: nexterm"
