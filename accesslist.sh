#!/bin/bash

#################
# Author: Tapabrata Dutta
# Date: 05.08.2025
# Version: V1.2

API_URL="https://api.github.com"
USERNAME="your_github_username"
TOKEN="your_github_token"

REPO_OWNER=$1
REPO_NAME=$2

function github_apiGet {
    local endpoint="$1"
    local url="${API_URL}/${endpoint}"
    curl -s -u "${USERNAME}:${TOKEN}" "$url"
}

function listUser {
    local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"
    local response=$(github_apiGet "$endpoint")

    # Check if it's a valid array (list of collaborators)
    if echo "$response" | jq -e 'type == "array"' >/dev/null; then
        collaborators=$(echo "$response" | jq -r '.[] | select(.permissions.pull == true) | .login')
        
        if [[ -z "$collaborators" ]]; then
            echo "No users with read access found for ${REPO_OWNER}/${REPO_NAME}."
        else
            echo "Users with read access to ${REPO_OWNER}/${REPO_NAME}:"
            echo "$collaborators"
        fi
    else
        # Print the error message from GitHub API
        message=$(echo "$response" | jq -r '.message')
        echo "❌ GitHub API Error: $message"
    fi
}

listUser

