#!/bin/bash

# Function to display usage instructions
usage() {
    echo "Usage: $0 -d <domain>"
    exit 1
}

# Check if the user provided the domain
while getopts ":d:" opt; do
  case $opt in
    d)
      DOMAIN=$OPTARG
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      usage
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      usage
      ;;
  esac
done

# Ensure domain is provided
if [ -z "$DOMAIN" ]; then
    usage
fi

# Use gau to gather URLs and grep to filter and highlight based on file extensions
gau $DOMAIN | grep --color=always -E "\.(xls|xml|xlsx|json|pdf|sql|doc|docx|pptx|txt|zip|tar\.gz|tgz|bak|7z|rar|log|cache|secret|db|backup|yml|gz|config|csv|yaml|md|md5|tar|xz|7zip|p12|pem|key|crt|csr|sh|pl|py|java|class|jar|war|ear|sqlitedb|sqlite3|dbf|db3|accdb|mdb|sqlcipher|gitignore|env|ini|conf|properties|plist|cfg)$"

