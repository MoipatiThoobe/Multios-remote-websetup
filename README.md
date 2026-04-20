# 🚀 Multi-OS Remote Web Setup (Automated Deployment)

## 📌 Overview

This project demonstrates an automated approach to deploying a web application across multiple Linux distributions using a single Bash script.

The script detects the underlying operating system and installs the required web server packages, deploys a website template, and ensures the service is running.

The goal of this project was to simulate real-world DevOps tasks such as:

* Cross-platform automation
* Service management
* Application deployment
* Infrastructure standardization

---

## 🏗️ Architecture

![Architecture Diagram](screenshots/architecture.png)

**Flow:**

User → SSH → Linux Server (Ubuntu / CentOS) → Web Server (Apache) → Deployed Website

---

## 🛠️ Tools & Technologies

* Bash Scripting
* Linux (Ubuntu & CentOS)
* Vagrant
* Apache Web Server
* Git & GitHub
---

## 🖥️ Environment

* OS: Ubuntu / CentOS
* Platform: Local VM (Vagrant)
* Access Method: SSH
* Web Root: `/var/www/html`

---

## ⚙️ Setup & Deployment

### 1. Clone the Repository

```bash
git clone https://github.com/MoipatiThoobe/Multios-remote-websetup.git
cd Multios-remote-websetup
```

### 2. Make Script Executable

```bash
chmod +x webdeploy.sh
```

### 3. Run the Script

```bash
./webdeploy.sh
```

## ⚙️ What the Script Does

The script performs the following steps:

1. Detects the operating system (YUM-based or APT-based)
2. Installs required packages:

   * Apache (httpd/apache2)
   * wget
   * unzip
3. Starts and enables the web server service
4. Downloads a website template
5. Extracts and deploys files to `/var/www/html`
6. Restarts the web server
7. Cleans up temporary files

---

## 🧪 Key Commands Used

```bash
systemctl start httpd
systemctl enable httpd
wget <url>
unzip <file>
cp -r * /var/www/html/
```

---

## 📸 Results

### ✅ Website Running

<img width="956" height="476" alt="app-running1" src="https://github.com/user-attachments/assets/8a2e1780-740b-4c43-9c49-6d121b17f968" />

<img width="959" height="473" alt="app-running2" src="https://github.com/user-attachments/assets/0c1c0a03-c7f0-4a91-9eed-b6b1acf51f19" />

*Website successfully deployed and accessible via browser*

### ✅ Service Status

<img width="917" height="245" alt="Verifying deployment" src="https://github.com/user-attachments/assets/e386fbdc-b24c-45e7-989c-f884d880e757" />

*Verification of a successful deployment*

---

## 🔍 Troubleshooting

### Issue: Script fails due to missing permissions

**Fix:**

```bash
sudo ./websetup.sh
```

---

### Issue: Web server not accessible

**Fix:**

* Ensure port 80 is open
* Check service status:

```bash
systemctl status httpd
```

---

## 📚 Key Learnings

* Automating deployments across multiple Linux distributions
* Using OS detection to create flexible scripts
* Managing services using `systemctl`
* Understanding differences between package managers (`yum` vs `apt`)
* Structuring scripts using functions and best practices

---

## 🌍 Real-World Relevance

This project reflects real DevOps and cloud engineering tasks such as:

* Automating server configuration
* Deploying applications consistently across environments
* Managing Linux services in production
* Preparing scripts for scalable cloud deployments

These skills are directly applicable when working with infrastructure on platforms like Amazon Web Services.

---

## 🚀 Improvements / Next Steps

* Add parameterization (custom URL input)
* Implement logging to file
* Add error handling and rollback mechanisms
* Convert script into an Ansible playbook
* Deploy on multiple Amazon EC2 instances
* Containerize the application using Docker

---

## 👤 Author

Moipati Thoobe

---
