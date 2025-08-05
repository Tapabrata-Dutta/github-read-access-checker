#!/bin/bash

#################
# Author: Tapabrata Dutta
# Date: 05.08.2025
# Version: V1.1

# GitHub API URL
API_URL="https://api.github.com"

# --- Set your GitHub username and personal access token here ---
USERNAME="your_github_username"
TOKEN="your_github_token"

# Get repository owner and name from command-line arguments
REPO_OWNER=$1
REPO_NAME=$2

# Function to make GET requests to GitHub API
function github_apiGet {
    local endpoint="$1"
    local url="${API_URL}/${endpoint}"
    curl -s -u "${USERNAME}:${TOKEN}" "$url"
}

# Function to list users with read access to the repo
function listUser {
    local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"

    # Fetch collaborators who have pull access
    collaborators=$(github_apiGet "$endpoint" | jq -r '.[] | select(.permissions.pull == true) | .login')

    # Display result
    if [[ -z "$collaborators" ]]; then
        echo "No users with read access found for ${REPO_OWNER}/${REPO_NAME}."
    else
        echo "Users with read access to ${REPO_OWNER}/${REPO_NAME}:"
        echo "$collaborators"
    fi
}

# Call the function
listUser

