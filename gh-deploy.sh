#!/bin/bash

GIT_REPO=git@github.com:fwindpeak/vite-tetris.git

# 确保脚本在执行过程中有任何错误时停止
set -e

# 拉取最新的依赖
pnpm install

rm -rf dist
# 构建项目
pnpm run build

# 进入构建好的 dist 目录
cd dist

# 初始化 git 仓库（如果尚未初始化）
git init
git add .
git commit -m "Deploy to GitHub Pages"

# 链接到远程 GitHub 仓库
git remote add origin $GIT_REPO

# 切换到 gh-pages 分支
git checkout --orphan gh-pages

# 移除所有文件，保留 dist 目录的内容
# git rm -rf .

# 添加所有文件到 gh-pages 分支
git add .

# 提交更改
git commit -m "Update GitHub Pages"

# 强制推送到远程 gh-pages 分支
git push --set-upstream -f origin gh-pages

# 完成提示
echo "Deployment completed successfully!"
