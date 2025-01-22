#!/bin/sh -l

echo "##############################################"
echo "🤖 - Checking for LICENSE file existence..."

# Define possible license file patterns
possible_files=("LICENSE" "license" "LICENSE.md" "license.md" "LICENSE.txt" "license.txt")

# Variable to track if a valid license file is found
file_found=0

# Loop through possible file names
for file in "${possible_files[@]}"; do
    if [ -f "$file" ]; then
        echo "✔️ - Found license file: $file"
        file_found=1
        break
    fi
done

# Check if any license file was found
if [ "$file_found" -eq 1 ]; then
    echo "✔️ - LICENSE File Exists."
else
    echo "❌ - LICENSE file DOES NOT exist."
    echo "##############################################"
    exit 1
fi

echo "##############################################"
echo "🤖 - Checking if plugin.json contains a 'license' key with a value..."

# Check if plugin.json exists
if [ -f "plugin.json" ]; then
    # Check if the plugin.json contains a "license" key with a value
    license_value=$(jq -r '.license // empty' plugin.json 2>/dev/null)
    
    if [ -n "$license_value" ]; then
        echo "✔️ - Found 'license' key in plugin.json with value: $license_value"
    else
        echo "❌ - 'license' key is missing or empty in plugin.json."
        echo "##############################################"
        exit 1
    fi
else
    echo "❌ - plugin.json file does NOT exist."
    echo "##############################################"
    exit 1
fi

echo "##############################################"
echo "✔️ - All checks passed successfully!"
exit 0
