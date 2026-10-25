#!/usr/bin/env bash
set -e

echo "=========================================================="
echo "   OBZUEAI MEA — Pay-Package Pipeline Build System        "
echo "=========================================================="

DIST_DIR="./dist"
ZIP_NAME="obzueai-pay-package.zip"

# Step 1: Clean build directory
echo "[1/4] Cleaning previous builds..."
rm -rf "$DIST_DIR"
mkdir -p "$DIST_DIR"

# Step 2: Validate Brand & Files
echo "[2/4] Validating core assets and brand standards..."
test -f index.html || { echo "Error: index.html missing!"; exit 1; }
test -f TECHNICAL_SECRETARY_AGENT_SKILL.md || { echo "Error: TECHNICAL_SECRETARY_AGENT_SKILL.md missing!"; exit 1; }

# Step 3: Bundle Zip Archive
echo "[3/4] Compressing production package archive..."
zip -r9 "$DIST_DIR/$ZIP_NAME" index.html package.json README.md TECHNICAL_SECRETARY_AGENT_SKILL.md public/ -x "*.DS_Store*"

# Step 4: Summary
SIZE=$(du -h "$DIST_DIR/$ZIP_NAME" | cut -f1)
echo "[4/4] Pipeline build complete!"
echo "----------------------------------------------------------"
echo " Build Artifact: $DIST_DIR/$ZIP_NAME ($SIZE)"
echo " Deployment Target: https://obzueai.com"
echo " GitHub Repo: https://github.com/obzue/pay-package"
echo "=========================================================="