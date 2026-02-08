# External Integrations

**Analysis Date:** 2026-02-08

## APIs & External Services

**GitHub Integration:**
- Service: GitHub
- What it's used for: Version control and SSH key management
- SSH Key: `~/.ssh/github-actions-deploy-vps` (production deployment)
- Git Configuration: Global user name, email, GPG signing configuration
- Worktree Management: Git worktree operations for feature branch isolation

**Kafka Integration:**
- Service: Apache Kafka (Confluent distribution)
- What it's used for: Distributed event streaming and message queue handling
- Configuration: `.planning/codebase/docker-compose.yml` (local development setup)
- Clusters Configured:
  - Local development cluster (`kafka:29092` internal, `localhost:9092` external)
  - Remote production cluster (`b-1.kafka-dev-prod.mzc4gg.c5.kafka.eu-central-1.amazonaws.com:9092` AWS MSK)

## Data Storage

**Databases:**
- Redis - In-memory data store
  - Connection: `localhost:6379` (Docker container)
  - Configuration: Persistence enabled with append-only file (`--appendonly yes`)
  - Volume: `./redis-data:/data` for persistence across container restarts

**Message Queue:**
- Kafka (Apache/Confluent)
  - Local Broker: `kafka:9092` (Docker service)
  - Bootstrap Servers: `kafka:29092` (internal), `localhost:9092` (external)
  - Zookeeper Coordination: `zookeeper:2181`

**Coordination Service:**
- Zookeeper
  - Connection: `zookeeper:2181`
  - Data Storage: `./zookeeper-data:/var/lib/zookeeper/data`
  - Logs: `./zookeeper-logs:/var/lib/zookeeper/log`

**File Storage:**
- Local filesystem only
- Git repository storage for dotfiles

**Caching:**
- Redis (in-memory caching available via Docker service)

## Authentication & Identity

**Auth Provider:**
- Custom/Manual - Git SSH key-based authentication
  - SSH Keys: Managed via `~/.ssh/` directory
  - Setup: GPG signing keys configured for signed commits
  - Environment Variables: `GIT_SIGNING_KEY`, `GIT_COMMIT_GPGSIGN`, `GIT_SIGNING_PROGRAM`

**Git Credentials:**
- GPG-signed commits: `commit.gpgsign=true`
- Signing Key: User-configured GPG key ID
- SSH Access: Private key at `~/.ssh/github-actions-deploy-vps` for VPS deployments

## Monitoring & Observability

**Cluster Monitoring:**
- Kafka UI - Web-based Kafka cluster visualization
  - Service: `provectuslabs/kafka-ui:latest`
  - Access: `http://localhost:8080`
  - Configured Clusters:
    - Local development cluster
    - AWS MSK production cluster (parkki)

**Error Tracking:**
- Not detected

**Logs:**
- Docker container logs: `docker logs -f` (aliased as `dl`)
- Kafka broker logs: Volume-mounted at `./kafka-data:/var/lib/kafka/data`
- Zookeeper logs: Volume-mounted at `./zookeeper-logs:/var/lib/zookeeper/log`
- System logs: Via standard shell logging

## CI/CD & Deployment

**Hosting:**
- AWS infrastructure (Kafka MSK referenced with EU Central region)
- VPS deployment: `51.178.138.125` (accessible via SSH alias `vps`)

**CI Pipeline:**
- Git hooks available but not explicitly configured
- Make-based workflow for dotfiles installation

**Deployment Method:**
- SSH-based: Private key authentication to VPS
- Docker Compose for local/containerized deployments
- Git worktrees for isolated feature development

## Environment Configuration

**Required Environment Variables (Inferred):**
- `PNPM_HOME` - pnpm package manager home directory
- `BUN_INSTALL` - Bun runtime installation directory
- `NVM_DIR` - Node Version Manager directory
- `ZSH` - Oh-my-zsh installation path
- `EDITOR` - Text editor (vim)
- `GIT_SIGNING_KEY` - GPG key ID for signed commits
- `GIT_COMMIT_GPGSIGN` - Enable GPG signing on commits
- `GIT_SIGNING_PROGRAM` - GPG executable path
- `CLICOLOR` - Enable CLI colorization

**Secrets Location:**
- SSH Keys: `~/.ssh/` (not committed to repository)
- `.env` files: Referenced in shell functions but not included in dotfiles repo
- Git credentials: Configured via `git config` (user-level or system-level)
- Private keys: `.ssh/github-actions-deploy-vps` for production access

## Webhooks & Callbacks

**Incoming:**
- Not detected

**Outgoing:**
- Git operations trigger SSH communications with GitHub
- Docker container health checks via Docker Compose (restart policies configured)

## Cloud Services Integration

**AWS Services:**
- AWS MSK (Managed Streaming for Kafka)
  - Production Kafka cluster in EU Central region
  - Endpoint: `kafka-dev-prod.mzc4gg.c5.kafka.eu-central-1.amazonaws.com`
  - Replicated cluster with 3 brokers for high availability

## Third-Party Tools & Services

**Terminal Emulator:**
- iTerm2 (macOS) - Custom theme profile and keybindings

**Development Tools:**
- Claude (AI assistant) - Aliased as `claudex` with permission bypass flag

**Docker Hub & Package Registries:**
- Confluent Registry - Kafka and Zookeeper Docker images
- Docker Hub - Generic images (Redis, Kafka UI)

**Plugin/Package Repositories:**
- Vim Plugin Manager (vim-plug) - Pulls plugins from GitHub
- Oh-my-zsh Repository - Shell framework and plugins
- NVM GitHub Repository - Node.js version management
- Bun GitHub Repository - JavaScript runtime installation

---

*Integration audit: 2026-02-08*
