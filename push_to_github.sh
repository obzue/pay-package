#!/bin/bash
set -e

echo "=== Pushing pay-package to https://github.com/obzue/pay-package.git ==="

git init
git add .
git commit -m "Initial commit: OBZUEAI MEA 14-Day Trial Engine, Pay-Package & ArrowHead Shield Assets"
git branch -M main
git remote add origin https://github.com/obzue/pay-package.git || git remote set-url origin https://github.com/obzue/pay-package.git

echo "Ready to push. Run:"
echo "git push -u origin main"
