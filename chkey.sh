#!/bin/bash

set -e

if [ ! -f .sdickey ]; then
	printf "\e[091m致命错误：\e[0m无法找到文件\`.sdickey'。请确保你正确克隆了仓库，或向仓库管理员求助。\\n"
	exit 1
fi

if [ ! -d "docs/$(cat .sdickey)" ]; then
	printf "\e[091m致命错误：\e[0m无法找到目录\`docs/$(cat .sdickey)'。请确保你正确设置了密钥，或向仓库管理员求助。\\n"
	exit 1
fi

printf "修改斯迪克平台密钥（Sdickey）。\\n"

printf "\e[092m当前密钥：\e[091m"
cat .sdickey
printf "\e[0m\\n"

printf "\e[092m修改密钥为：\e[0m"
read -r SDICK_SDICKEY

printf "\e[092m再次输入以确认：\e[0m"
read -r SDICK_SDICKEY_2

if [ "$SDICK_SDICKEY" != "$SDICK_SDICKEY_2" ]; then
	printf "\e[091m致命错误：\e[0m两次输入的密钥不同。\\n"
	exit 1
fi

mv -v "docs/$(cat .sdickey)" "docs/$SDICK_SDICKEY"

printf "$SDICK_SDICKEY" > .sdickey

echo "已成功修改密钥。"

git add .
git commit -a -m "修改密钥为$SDICK_SDICKEY"

echo "已成功提交本次修改。"