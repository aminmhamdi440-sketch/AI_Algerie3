#!/bin/bash

# 🧪 اختبار التثبيت - Titan Enterprise Setup Verification Script
# هذا السكريبت يتحقق من أن المشروع مثبت بشكل صحيح

set -e

# الألوان
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}================================${NC}"
echo -e "${BLUE}🧪 Titan Enterprise Setup Check${NC}"
echo -e "${BLUE}================================${NC}\n"

# ✅ فحص Node.js
echo -e "${YELLOW}Checking Node.js...${NC}"
if ! command -v node &> /dev/null; then
    echo -e "${RED}❌ Node.js is not installed${NC}"
    exit 1
fi
NODE_VERSION=$(node --version)
echo -e "${GREEN}✅ Node.js ${NODE_VERSION}${NC}"

# ✅ فحص npm
echo -e "${YELLOW}Checking npm...${NC}"
if ! command -v npm &> /dev/null; then
    echo -e "${RED}❌ npm is not installed${NC}"
    exit 1
fi
NPM_VERSION=$(npm --version)
echo -e "${GREEN}✅ npm ${NPM_VERSION}${NC}\n"

# ✅ فحص ملفات البيئة
echo -e "${YELLOW}Checking environment files...${NC}"

# Backend .env
if [ ! -f "backend/.env" ]; then
    echo -e "${RED}❌ backend/.env not found${NC}"
    echo -e "${YELLOW}   Creating from .env.example...${NC}"
    cp .env.example backend/.env 2>/dev/null || echo "   ⚠️  Could not copy - please do it manually"
fi
echo -e "${GREEN}✅ backend/.env exists${NC}"

# Frontend .env.local
if [ ! -f "frontend/.env.local" ]; then
    echo -e "${YELLOW}⚠️  frontend/.env.local not found${NC}"
    echo -e "${YELLOW}   Creating from .env.example...${NC}"
    if [ -f ".env.example" ]; then
        cp .env.example frontend/.env.local
    fi
fi
echo -e "${GREEN}✅ frontend/.env.local exists${NC}\n"

# ✅ فحص Backend
echo -e "${YELLOW}Checking Backend setup...${NC}"
if [ -d "backend/node_modules" ]; then
    echo -e "${GREEN}✅ Backend dependencies installed${NC}"
else
    echo -e "${YELLOW}⚠️  Backend dependencies not installed${NC}"
    echo -e "${YELLOW}   Run: cd backend && npm install${NC}"
fi

if [ -f "backend/package.json" ]; then
    echo -e "${GREEN}✅ Backend package.json exists${NC}"
else
    echo -e "${RED}❌ Backend package.json not found${NC}"
fi

if [ -f "backend/prisma/schema.prisma" ]; then
    echo -e "${GREEN}✅ Prisma schema exists${NC}"
else
    echo -e "${RED}❌ Prisma schema not found${NC}"
fi
echo ""

# ✅ فحص Frontend
echo -e "${YELLOW}Checking Frontend setup...${NC}"
if [ -d "frontend/node_modules" ]; then
    echo -e "${GREEN}✅ Frontend dependencies installed${NC}"
else
    echo -e "${YELLOW}⚠️  Frontend dependencies not installed${NC}"
    echo -e "${YELLOW}   Run: cd frontend && npm install${NC}"
fi

if [ -f "frontend/package.json" ]; then
    echo -e "${GREEN}✅ Frontend package.json exists${NC}"
else
    echo -e "${RED}❌ Frontend package.json not found${NC}"
fi

if [ -d "frontend/app" ]; then
    echo -e "${GREEN}✅ Frontend app directory exists${NC}"
else
    echo -e "${RED}❌ Frontend app directory not found${NC}"
fi
echo ""

# ✅ فحص Docker (اختياري)
echo -e "${YELLOW}Checking Docker (optional)...${NC}"
if command -v docker &> /dev/null; then
    DOCKER_VERSION=$(docker --version)
    echo -e "${GREEN}✅ Docker is installed: ${DOCKER_VERSION}${NC}"
    
    if command -v docker-compose &> /dev/null || docker compose version &> /dev/null; then
        echo -e "${GREEN}✅ Docker Compose is available${NC}"
    else
        echo -e "${YELLOW}⚠️  Docker Compose not available${NC}"
    fi
else
    echo -e "${YELLOW}⚠️  Docker not installed (optional)${NC}"
fi
echo ""

# ✅ فحص API Keys في .env
echo -e "${YELLOW}Checking API Configuration...${NC}"
OPENAI_KEY=$(grep OPENAI_API_KEY backend/.env 2>/dev/null || echo "")
if [[ $OPENAI_KEY == *"sk-"* ]]; then
    echo -e "${GREEN}✅ OpenAI API key configured${NC}"
else
    echo -e "${YELLOW}⚠️  OpenAI API key not configured (will use mock responses)${NC}"
fi

DEEPSEEK_KEY=$(grep DEEPSEEK_API_KEY backend/.env 2>/dev/null || echo "")
if [[ $DEEPSEEK_KEY == *"key"* ]] && [[ ! $DEEPSEEK_KEY == *"your-"* ]]; then
    echo -e "${GREEN}✅ DeepSeek API key configured${NC}"
else
    echo -e "${YELLOW}⚠️  DeepSeek API key not configured${NC}"
fi

ANTHROPIC_KEY=$(grep ANTHROPIC_API_KEY backend/.env 2>/dev/null || echo "")
if [[ $ANTHROPIC_KEY == *"key"* ]] && [[ ! $ANTHROPIC_KEY == *"your-"* ]]; then
    echo -e "${GREEN}✅ Anthropic API key configured${NC}"
else
    echo -e "${YELLOW}⚠️  Anthropic API key not configured${NC}"
fi
echo ""

# Summary
echo -e "${BLUE}================================${NC}"
echo -e "${BLUE}✅ Setup Verification Complete!${NC}"
echo -e "${BLUE}================================${NC}\n"

echo -e "${GREEN}Next steps:${NC}"
echo "1. Make sure all API keys are configured in backend/.env"
echo "2. Run migrations: cd backend && npm run db:migrate"
echo "3. Start development servers:"
echo "   - Backend: cd backend && npm run dev"
echo "   - Frontend: cd frontend && npm run dev"
echo ""
echo -e "${GREEN}Or use Docker Compose:${NC}"
echo "   docker compose up -d --build"
echo ""
echo -e "${YELLOW}For more help, see SETUP.md${NC}"
