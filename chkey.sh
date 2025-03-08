#!/bin/bash

set -e

if [ ! -f .sdickey ]; then
	echo "致命错误：无法找到文件\`.sdickey'。请确保你正确克隆了仓库，或向仓库管理员求助。"
	exit 1
fi

if [ ! -d "docs/$(cat .sdickey)" ]; then
	echo "致命错误：无法找到目录\`docs/$(cat .sdickey)'。请确保你正确设置了密钥，或向仓库管理员求助。"
	exit 1
fi

echo "修改斯迪克平台密钥（Sdickey）。"

printf "当前密钥："
cat .sdickey
printf \\n

printf "修改密钥为："
read -r SDICK_SDICKEY

printf "再次输入以确认："
read -r SDICK_SDICKEY_2

if [ "$SDICK_SDICKEY" != "$SDICK_SDICKEY_2" ]; then
	echo "致命错误：两次输入的密钥不同。"
	exit 1
fi

mv -v "docs/$(cat .sdickey)" "docs/$SDICK_SDICKEY"

printf "$SDICK_SDICKEY" > .sdickey

echo "已成功修改密钥。"

git add .
git commit -a -m "修改密钥为$SDICK_SDICKEY"

echo "已成功提交本次修改。"
