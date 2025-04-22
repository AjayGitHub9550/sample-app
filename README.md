# sample-app

## 📌 Project Purpose

This project demonstrates a complete CI/CD pipeline using Jenkins to:

- Build a Docker image for the application.
- Push the image to Docker Hub.
- Update the Kubernetes manifest file with the new image tag.
- Deploy the application to an EKS cluster using ArgoCD.

---

## 🚀 Technologies Used

- Jenkins
- Docker
- AWS EKS
- ArgoCD
- GitHub
- Docker Hub

---

## 🛠️ Prerequisites

- Jenkins (installed on AWS EC2)
- Docker installed on the Jenkins server
- Jenkins plugins:
  - Docker Pipeline
  - Git
  - Credentials Binding
- GitHub access token (saved as a Jenkins credential)
- Docker Hub credentials (saved as a Jenkins credential)
- EKS cluster set up on AWS
- ArgoCD installed on the EKS cluster

---
1. **Create a Jenkins instance on AWS EC2.**
2. **Add credentials** in Jenkins:
   - Docker Hub credentials ID: `docker-cred`
   - GitHub token credentials ID: `github`
3. **Create a Jenkins Pipeline Job**:
   - Use **Pipeline script from SCM**.
   - SCM: Git
   - Repository URL: `https://github.com/AjayGitHub9550/sample-app.git`
   - Branch: `main`

☸️ Kubernetes Deployment with ArgoCD
-> Create an EKS cluster on AWS.

-> Install ArgoCD on the EKS cluster.

-> Connect your GitHub repo to ArgoCD as the GitOps source.

-> Apply the updated manifest file from the k8s/deployment.yaml path using ArgoCD.

👤 Author
Ajay Yerukula
ajay.yerukula@outlook.com


