#!/bin/bash

# This script is used to create a new git tag and push it to the origin.
# The version number for the tag is provided by the user when running the script.
# The script checks if the version number is in the format of major.minor.patch.
# If the version number is valid, a new git tag is created and pushed to the origin.
# If the version number is not valid, an error message is printed and the script exits.

# Ask for the version
echo "Enter the version:"
# shellcheck disable=SC2162
read version  # Read the version number from the user input

# Check if the version follows the format of major.minor.patch
if [[ $version =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  # If the version number is valid, create a git tag and push it to the origin
  git tag -a v"$version" -m "Release version $version"
  git push origin v"$version"
else
  # If the version number is not valid, print an error message
  echo "Invalid version format. Please enter a version in the format of major.minor.patch"
fi
