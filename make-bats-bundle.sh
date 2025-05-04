#!/usr/bin/env bash


checkout_dir="checkout"
bundle_dir="bats-bundle"
mkdir -p "$checkout_dir" "$bundle_dir"
rm -rf "$checkout_dir/"*
rm -rf "$bundle_dir/"*

echo "Cloning"
git clone https://github.com/bats-core/bats-core.git "$checkout_dir/bats"
git clone https://github.com/bats-core/bats-assert.git "$checkout_dir/bats-assert"
git clone https://github.com/bats-core/bats-file.git "$checkout_dir/bats-file"
git clone https://github.com/bats-core/bats-support.git "$checkout_dir/bats-support"

echo "Copying"
cp -r "$checkout_dir/bats" "$bundle_dir"
cp -r "$checkout_dir/bats-assert" "$bundle_dir"
cp -r "$checkout_dir/bats-file" "$bundle_dir"
cp -r "$checkout_dir/bats-support" "$bundle_dir"


echo "Cleaning"
current_dir="$(pwd)"
cd "$bundle_dir/bats"
rm -rf .devcontainer .git .github contrib docs test \
    .codespellrc .editorconfig .gitattributes .gitignore .pre-commit-config.yaml .readthedocs.yml
cd ..
cd bats-assert
rm -rf .git .github test .gitignore
cd ..
cd bats-support
rm -rf .git .github test .gitignore
cd ..
cd bats-file
rm -rf .git .github test .gitignore
cd "$current_dir"

echo "Compressing"
tar -czf bats-bundle.tar.gz "$bundle_dir"
