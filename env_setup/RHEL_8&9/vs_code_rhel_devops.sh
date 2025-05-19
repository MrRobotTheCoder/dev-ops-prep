#!/bin/bash

# Install Visual Studio Code via rpm:
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
dnf check-update
sudo dnf install -y code # or code-insiders

# Wait for VS code installation to complete:
echo "Visual Studio Code has been installed successfully!"

# Install the required extensions:
code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
code --install-extension ms-azuretools.vscode-docker
code --install-extension eamodio.gitlens
code --install-extension redhat.vscode-yaml
code --install-extension ms-vscode-remote.remote-ssh
code --install-extension hashicorp.terraform
code --install-extension jenkinsxio.vscode-jx-tools
# code --install-extension cschleiden.vscode-github-actions
code --install-extension redhat.ansible
code --install-extension amazonwebservices.aws-toolkit-vscode
code --install-extension googlecloudtools.cloudcode
# code --install-extension julianhr.prometheus
code --install-extension grafana.grafana-vscode
code --install-extension ms-python.python
code --install-extension timonwong.shellcheck
# code --install-extension aquasecurity.vscode-trivy
# code --install-extension timoschwarzer.vscode-helm
code --install-extension humao.rest-client

# Final comment:
echo ""
echo "You are ready to use VS Code, loaded with all the required plugins!! "
echo ""
echo "Happy Learning!!"
