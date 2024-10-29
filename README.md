# 🐳 Dockerized Django Application Deployment Guide

[![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)
[![Django](https://img.shields.io/badge/django-%23092E20.svg?style=for-the-badge&logo=django&logoColor=white)](https://www.djangoproject.com/)
[![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)](https://aws.amazon.com/)

## 📝 Description

This repository contains a containerized Django application ready for deployment on AWS EC2. Follow this step-by-step guide to get your application up and running in a Docker container.

## 🚀 Quick Start

### Prerequisites

- AWS Account
- Docker Hub Account
- Basic understanding of Docker and AWS
- SSH client installed on your local machine

## 📋 Deployment Steps

### 1. EC2 Instance Setup 🖥️

```bash
# Launch an Ubuntu EC2 instance on AWS
# Configure security groups for ports:
- SSH (22)
- HTTP (80)
- HTTPS (443)
```

### 2. Configure EC2 Security Group 🔒

1. Go to AWS Console → EC2 → Security Groups
2. Select your instance's security group
3. Add inbound rules:
   ```
   - Type: Custom TCP
   - Port: 8000
   - Source: Your IP address or 0.0.0.0/0 (for public access)
   - Description: Django application port
   ```
4. Click "Save rules"

> ⚠️ **Security Note**: Using 0.0.0.0/0 opens access to everyone. For production, always restrict to specific IP ranges.

### 3. System Updates 🔄

```bash
# Update package lists
sudo apt update
```

### 4. Docker Installation 🐋

```bash
# Install Docker
sudo apt install docker.io
```

### 5. Docker Permission Setup ⚙️

```bash
# Add user to docker group to avoid permission issues
sudo usermod -aG docker ubuntu

# Verify Docker installation
docker run hello-world
```

> 💡 **Note**: If you encounter permission denied errors, log out and log back in for group changes to take effect.

### 6. Application Setup 📦

```bash
# Clone your repository
git clone <your-repository-url>

# Navigate to project directory
cd <project-directory>
```

### 7. Docker Image Build 🏗️

```bash
# Build Docker image
docker build -t <image-name>:<tag> .

# Verify image creation
docker images
```

### 8. Container Launch 🚢

```bash
# Run Docker container
docker run -p 8000:8000 <image-name>:<tag>
```

### 9. Docker Hub Deployment 🌐

```bash
# Login to Docker Hub
docker login

# Tag your image
docker tag <local-image-name>:<tag> <dockerhub-username>/<repository-name>:<tag>

# Push to Docker Hub
docker push <dockerhub-username>/<repository-name>:<tag>
```

## 🔍 Verification Steps

1. Check running containers:
   ```bash
   docker ps
   ```

2. View application logs:
   ```bash
   docker logs <container-id>
   ```

3. Access your application:
   ```
   http://<ec2-public-ip>:8000
   ```

## 🛠️ Troubleshooting

### Common Issues and Solutions

1. **Permission Denied**
   - Solution: Run `sudo usermod -aG docker ubuntu` and restart your session

2. **Port Already in Use**
   - Solution: Change the port mapping or stop the conflicting service

3. **Container Exits Immediately**
   - Solution: Check logs using `docker logs <container-id>`

4. **Cannot Access Application**
   - Solution: Verify security group inbound rules allow traffic on port 8000
   - Check if container is running using `docker ps`
   - Ensure EC2 instance public IP is correct

## 🔐 Security Best Practices

1. Keep your Docker images updated
2. Use specific tags instead of `latest`
3. Implement proper security groups in AWS:
   - Only open necessary ports
   - Restrict IP ranges when possible
   - Regularly review and update security rules
4. Never commit sensitive data to your repository

## 📝 Contributing

Feel free to submit issues and pull requests to improve this deployment guide.

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Support

If you have any questions or need help, please:
1. Open an issue in this repository
2. Contact the development team
3. Check our documentation

---
⭐ Don't forget to star this repository if you found it helpful!

