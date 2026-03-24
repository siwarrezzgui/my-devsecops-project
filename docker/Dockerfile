FROM lscr.io/linuxserver/webtop:ubuntu-kde

LABEL maintainer="admin@societe.com"
LABEL description="Business Central Browser + VS Code"
LABEL version="1.0"

ENV TITLE="Business Central"
ENV TZ="Africa/Tunis"
ENV PUID=1000
ENV PGID=1000
ENV BC_URL="https://businesscentral.dynamics.com/"

RUN apt-get update && \
    apt-get install -y wget gpg --no-install-recommends && \
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | \
    gpg --dearmor > /usr/share/keyrings/microsoft-archive-keyring.gpg && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/vscode stable main" \
    > /etc/apt/sources.list.d/vscode.list && \
    apt-get update && \
    apt-get install -y code --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

RUN code --no-sandbox --user-data-dir=/tmp/vscode-setup --install-extension ms-dynamics-smb.al || true
RUN code --no-sandbox --user-data-dir=/tmp/vscode-setup --install-extension ms-vscode.powershell || true
RUN code --no-sandbox --user-data-dir=/tmp/vscode-setup --install-extension github.copilot || true
RUN code --no-sandbox --user-data-dir=/tmp/vscode-setup --install-extension mhutchie.git-graph || true
RUN code --no-sandbox --user-data-dir=/tmp/vscode-setup --install-extension eamodio.gitlens || true

COPY startup.sh /custom-cont-init.d/50-startup.sh
RUN chmod +x /custom-cont-init.d/50-startup.sh

EXPOSE 3000
