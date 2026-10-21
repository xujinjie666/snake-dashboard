#!/bin/bash

# 快速部署脚本 - GitHub Pages
# 使用方法：./deploy.sh "提交信息"

# 颜色定义
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}开始部署到GitHub Pages...${NC}"

# 检查是否有未提交的更改
if [[ -n $(git status -s) ]]; then
    echo -e "${GREEN}✓ 发现文件更改${NC}"

    # 添加所有更改
    git add .
    echo -e "${GREEN}✓ 已添加文件${NC}"

    # 提交更改
    COMMIT_MSG="${1:-更新于 $(date +'%Y-%m-%d %H:%M:%S')}"
    git commit -m "$COMMIT_MSG"
    echo -e "${GREEN}✓ 已提交更改: $COMMIT_MSG${NC}"

    # 推送到远程仓库
    git push
    echo -e "${GREEN}✓ 已推送到GitHub${NC}"

    echo ""
    echo -e "${BLUE}=====================================${NC}"
    echo -e "${GREEN}🎉 部署成功！${NC}"
    echo -e "${BLUE}等待1-2分钟后访问网站${NC}"
    echo -e "${BLUE}=====================================${NC}"
else
    echo -e "${RED}✗ 没有文件更改，无需部署${NC}"
fi
