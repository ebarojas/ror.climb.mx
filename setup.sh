#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 Setting up 90s Style Rails Blog${NC}"
echo "=================================="

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo -e "${RED}❌ Docker is not installed. Please install Docker first.${NC}"
    exit 1
fi

# Check for docker compose (newer) or docker-compose (older)
if docker compose version &> /dev/null; then
    DOCKER_COMPOSE="docker compose"
    echo -e "${GREEN}✅ Docker and Docker Compose are installed${NC}"
elif command -v docker-compose &> /dev/null; then
    DOCKER_COMPOSE="docker-compose"
    echo -e "${GREEN}✅ Docker and Docker Compose are installed${NC}"
else
    echo -e "${RED}❌ Docker Compose is not available. Please install Docker Compose first.${NC}"
    exit 1
fi

# Create Rails application if it doesn't exist
if [ ! -f "Gemfile" ]; then
    echo -e "${YELLOW}📦 Creating new Rails application...${NC}"
    
    # Create Rails app with PostgreSQL
    docker run --rm -v $(pwd):/app -w /app ruby:3.2.2-alpine sh -c "
        apk add --no-cache build-base postgresql-dev git bash &&
        gem install rails &&
        rails new . --database=postgresql --skip-test --skip-bundle --force
    "
    
    echo -e "${GREEN}✅ Rails application created${NC}"
else
    echo -e "${GREEN}✅ Rails application already exists${NC}"
fi

# Copy environment file if it doesn't exist
if [ ! -f ".env" ]; then
    echo -e "${YELLOW}📝 Creating environment file...${NC}"
    cp env.example .env
    echo -e "${GREEN}✅ Environment file created${NC}"
else
    echo -e "${GREEN}✅ Environment file already exists${NC}"
fi

# Make entrypoint script executable
chmod +x entrypoint.sh

echo -e "${YELLOW}🔧 Building Docker containers...${NC}"
$DOCKER_COMPOSE build

echo -e "${YELLOW}🚀 Starting services...${NC}"
$DOCKER_COMPOSE up -d

echo -e "${YELLOW}⏳ Waiting for database to be ready...${NC}"
sleep 10

echo -e "${YELLOW}🗄 Setting up database...${NC}"
$DOCKER_COMPOSE exec web rails db:create db:migrate db:seed

echo -e "${GREEN}🎉 Setup complete!${NC}"
echo ""
echo -e "${BLUE}📱 Your blog is now running at:${NC}"
echo -e "${GREEN}   http://localhost:3000${NC}"
echo ""
echo -e "${BLUE}🔧 Useful commands:${NC}"
echo -e "${YELLOW}   View logs:${NC} $DOCKER_COMPOSE logs -f"
echo -e "${YELLOW}   Stop services:${NC} $DOCKER_COMPOSE down"
echo -e "${YELLOW}   Restart services:${NC} $DOCKER_COMPOSE restart"
echo -e "${YELLOW}   Rails console:${NC} $DOCKER_COMPOSE exec web rails console"
echo ""
echo -e "${BLUE}📚 Next steps:${NC}"
echo "   1. Visit http://localhost:3000 to see your blog"
echo "   2. Check the README.md for detailed documentation"
echo "   3. Customize the 90s design in app/assets/stylesheets/"
echo "   4. Add your first blog post through the admin interface" 