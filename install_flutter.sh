#!/bin/bash

# Download and install Flutter
wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_2.2.3-stable.tar.xz
tar xf flutter_linux_2.2.3-stable.tar.xz

# Export Flutter to PATH
export PATH="$PATH:`pwd`/flutter/bin"
