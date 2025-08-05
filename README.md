# GitHub Collaborators Read Access Checker

This is a Bash script to list all users who have **read access** (pull permission) to a specific GitHub repository.

## 📌 Features

- Authenticates using your **GitHub personal access token**.
- Fetches collaborators of a given repo.
- Filters and displays only those with **read (pull)** access.
- Simple and lightweight, no dependencies other than `curl` and `jq`.

---

## 🛠️ Requirements

- Bash
- `curl`
- `jq` (for JSON parsing)
- A valid GitHub Personal Access Token (PAT)

---

## 🧑‍💻 Author

- **Name**: Tapabrata Dutta  
- **Date**: 05-Aug-2025  
- **Version**: V1.1

---

## 🚀 How to Use

### 1. Clone or download this repo.

```bash
git clone https://github.com/<your-username>/repo-access-checker.git
cd repo-access-checker
