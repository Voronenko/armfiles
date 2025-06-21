swiss-knife: swiss-fzf swiss-console swiss-ops swiss-zsh fonts-swiss-knife
	@echo OK

swiss-fzf: zsh-fzf-repo install-console-fzf zsh-fzf
	@echo FZF OK

swiss-docker: install-docker-dry install-docker-machine
	@echo docker ok

swiss-console: install-console-bat install-console-prettytyping install-console-diffsofancy install-console-fd install-console-ripgrep install-console-ncdu install-console-yq install-ngrok install-direnv
	@echo console ok

swiss-console-python: install-console-glances
	@echo python based console tools ok

swiss-ops: install-hashicorp-terraform install-terraform-docs install-hashicorp-vault install-hashicorp-packer
	@echo ops tools ok
	@echo if you need reverse engineering consider make install-terraformer

swiss-k8s: install-k8s-ksonnet install-k8s-stern install-k8s-helm3-fixed install-k8s-deepmind-kapitan install-k8s-kubectl-ubuntu install-k8s-kubefwd install-k8s-kubeval install-k8s-kubeval install-k8s-rakkess install-k8s-popeye install-k8s-polaris install-k8s-kubespy install-k8s-vmware-octant
	@echo k8s tools ok

swiss-zsh: zsh-alias-tips fonts-awesome-terminal-fonts fonts-source-code-pro fonts-source-code-pro-patched
	@echo zsh extras ok

swiss-aws:  install-aws-key-importer install-aws-myaws
	@echo aws tools added

fix:    install-aws-myaws fix-locale swiss-fzf
	@echo install complete

# ZSH
zsh-fzf-repo:
	rm -rf ~/.fzf
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
# /ZSH


# CD CI local runners

install-cdci-gitlab-runner:
	sudo curl -sLo /usr/local/bin/gitlab-runner https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-arm64
	sudo chmod +x /usr/local/bin/gitlab-runner

install-cdci-gitlab-runner-service:
	sudo curl -sLo /usr/local/bin/gitlab-runner https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-arm64
	sudo chmod +x /usr/local/bin/gitlab-runner
	sudo useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash
	sudo gitlab-runner start

# /CD CI local runners


# CONSOLE TOOLS

install-tmuxinator:
	gem install tmuxinator

install-mysql-dbmate:
	curl -sLo ~/dotfiles/bin/dbmate https://github.com/amacneil/dbmate/releases/download/v1.11.0/dbmate-linux-arm64
	chmod +x ~/dotfiles/bin/dbmate

# cat with syntax highlight https://github.com/sharkdp/bat
install-console-bat:
	curl -sLo /tmp/bat.deb https://github.com/sharkdp/bat/releases/download/v0.18.0/bat_0.18.0_arm64.deb
	sudo dpkg -i /tmp/bat.deb

# https://github.com/jesseduffield/lazygit
install-console-lazygit:
	curl -sLo /tmp/lazygit.tar.gz https://github.com/jesseduffield/lazygit/releases/download/v0.28.1/lazygit_0.28.1_Linux_arm64.tar.gz
	tar -xvzf /tmp/lazygit.tar.gz -C /tmp
	mv /tmp/lazygit ~/dotfiles/bin

# https://github.com/junegunn/fzf
install-console-fzf:
	curl -sLo /tmp/fzf.tar.gz https://github.com/junegunn/fzf/releases/download/0.27.0/fzf-0.27.0-linux_armv7.tar.gz
	tar -xvzf /tmp/fzf.tar.gz -C /tmp
	cp /tmp/fzf ~/dotfiles/bin
	echo "Consider running make zsh-fzf to install zsh shell integration"

# WTF is a personal information dashboard for your terminal, developed for those who spend most of their day in the command line.
install-console-wtfutil:
	curl -sLo /tmp/wtf.tar.gz https://github.com/wtfutil/wtf/releases/download/v0.36.0/wtf_0.36.0_linux_arm64.tar.gz
	tar -xvzf /tmp/wtf.tar.gz -C /tmp
	cp /tmp/wtf_0.36.0_linux_arm64/wtfutil ~/dotfiles/bin/wtfutil
	chmod +x ~/dotfiles/bin/wtfutil

# https://github.com/so-fancy/diff-so-fancy
install-console-diffsofancy:
	curl -sLo ~/dotfiles/bin/diff-so-fancy https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy
	chmod +x ~/dotfiles/bin/diff-so-fancy

# fd is a simple, fast and user-friendly alternative to find. https://github.com/sharkdp/fd
# fd service
install-console-fd:
	curl -sLo /tmp/fd.deb https://github.com/sharkdp/fd/releases/download/v10.2.0/fd-musl_10.2.0_arm64.deb
	sudo dpkg -i /tmp/fd.deb

# ripgrep recursively searches directories for a regex pattern https://github.com/BurntSushi/ripgrep
# rg -n -w '[A-Z]+_SUSPEND'
install-console-ripgrep:
	curl -sLo /tmp/ripgrep.tar.gz https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep-12.1.1-arm-unknown-linux-gnueabihf.tar.gz
	tar -xvzf /tmp/ripgrep.tar.gz -C /tmp
	cp /tmp/ripgrep ~/dotfiles/bin
	chmod +x ~/dotfiles/bin/ripgrep


# Glances is a cross-platform monitoring tool which aims
# to present a large amount of monitoring information
install-console-glances:
	sudo pip install -U glances

# https://tldr.sh/
install-console-tldr:
	npm install -g tldr

# disk usage analyzer with an ncurses interface
install-console-ncdu:
	sudo apt-get install ncdu

# jql for yml
install-console-yq:
	curl -sLo ~/dotfiles/bin/yq https://github.com/mikefarah/yq/releases/download/v4.7.0/yq_linux_arm64
	chmod +x ~/dotfiles/bin/yq

install-console-jiq:
	curl -sLo ~/dotfiles/bin/jiq https://github.com/fiatjaf/jiq/releases/download/0.7.1/jiq_linux_arm
	chmod +x ~/dotfiles/bin/jiq

# /CONSOLE TOOLS

# WORKSPACE TOOLS

install-workspace-toggle-cli:
	sudo pip install togglCli

install-direnv:
	curl -sLo ~/dotfiles/bin/direnv https://github.com/direnv/direnv/releases/download/v2.28.0/direnv.linux-arm64
	chmod +x ~/dotfiles/bin/direnv

# https://github.com/VirtusLab/git-machete
# https://plugins.jetbrains.com/plugin/14221-git-machete
install-git-machete:
	curl -L https://raw.githubusercontent.com/VirtusLab/git-machete/master/completion/git-machete.completion.zsh -o ~/dotfiles/completions/git-machete.completion.zsh
	sudo snap install --classic git-machete

install-git-changelog:
	curl -sLo ~/dotfiles/bin/git-chglog https://github.com/git-chglog/git-chglog/releases/download/v0.14.2/git-chglog_0.14.2_darwin_arm64.tar.gz
#	chmod +x ~/dotfiles/bin/git-chglog

# https://pre-commit.com/
install-git-precommit:
	pip3 install pre-commit
	#conda install -c conda-forge pre-commit
	git config --global init.templateDir ~/.git-template
	pre-commit init-templatedir ~/.git-template

# /WORKSPACE TOOLS


# DOCKER TOOLS


install-docker-machine:
	curl -sLo ~/dotfiles/bin/docker-machine https://github.com/docker/machine/releases/download/v0.16.2/docker-machine-Linux-armhf
	chmod +x ~/dotfiles/bin/docker-machine

install-docker-credential-ecr-login:
	curl -sLo ~/dotfiles/bin/docker-credential-ecr-login https://amazon-ecr-credential-helper-releases.s3.us-east-2.amazonaws.com/0.4.0/linux-arm64/docker-credential-ecr-login
	chmod +x ~/dotfiles/bin/docker-credential-ecr-login

# docker console manager
install-docker-dry:
	curl -sLo ~/dotfiles/bin/dry https://github.com/moncho/dry/releases/download/v0.10-beta.1/dry-linux-arm64
	chmod +x ~/dotfiles/bin/dry

# https://dockersl.im
install-docker-slim:
	curl -sLo /tmp/docker-slim.tar.gz https://downloads.dockerslim.com/releases/1.35.0/dist_linux_arm64.tar.gz
	tar -xvzf /tmp/docker-slim.tar.gz -C /tmp
	mv /tmp/dist_linux/* ~/dotfiles/bin
# /DOCKER TOOLS


# KUBERNETES
# includes upgrade, disables k3s by default as you don't need it up on dev notebook
install-k3s-local:
	curl -sfL https://get.k3s.io | sh -
	sudo systemctl disable k3s
# https://github.com/alexellis/k3sup/
install-k3s-up:
	curl -sLo ~/dotfiles/bin/k3sup https://github.com/alexellis/k3sup/releases/download/0.10.2/k3sup-arm64
	chmod +x ~/dotfiles/bin/k3sup

# helm version considered stable
install-k8s-helm3-fixed:
	mkdir -p /tmp/helm
	curl -sLo /tmp/helm/helm.tar.gz "https://get.helm.sh/helm-v3.1.0-linux-arm64.tar.gz"
	cd /tmp/helm && tar -xzf helm.tar.gz && mv /tmp/helm/linux-arm64/helm ~/dotfiles/bin/helm
	rm -rf /tmp/helm

install-k8s-istio:
	mkdir -p /tmp/istio
	curl -sLo /tmp/istio/istio.tar.gz "https://github.com/istio/istio/releases/download/1.9.3/istioctl-1.9.3-linux-arm64.tar.gz"
	cd /tmp/istio && tar -xzf istio.tar.gz && mv /tmp/istio/istioctl ~/dotfiles/bin/istioctl
	rm -rf /tmp/istio

install-k8s-helm-plugin-s3:
	helm plugin install https://github.com/hypnoglow/helm-s3.git

# latest released helm
install-k8s-helm-latest:
	mkdir -p /tmp/helm
	curl -sLo /tmp/helm/helm.tar.gz "https://get.helm.sh/helm-$(shell curl -s https://api.github.com/repos/helm/helm/releases/latest | grep tag_name | cut -d '"' -f 4)-linux-arm64.tar.gz"
	cd /tmp/helm && tar -xzf helm.tar.gz && mv /tmp/helm/linux-arm64/helm ~/dotfiles/bin/helm
	rm -rf /tmp/helm

install-k8s-aws-iam-authenticator:
	curl -sLo ~/dotfiles/bin/aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.18.8/2020-09-18/bin/linux/arm64/aws-iam-authenticator
	chmod +x ~/dotfiles/bin/aws-iam-authenticator

install-k8s-weaveworks-eksctl:
	curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/0.46.0/eksctl_Linux_arm64.tar.gz" | tar xz -C /tmp
	mv /tmp/eksctl ~/dotfiles/bin

install-k8s-kubectl-ubuntu:
	sudo apt-get update && sudo apt-get install -y apt-transport-https
	curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
	sudo touch /etc/apt/sources.list.d/kubernetes.list
	echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
	sudo apt-get update
	sudo apt-get install -y kubectl

# install-k8s-kubectl-color:
# 	mkdir -p /tmp/kubecolor
# 	curl -sLo /tmp/kubecolor/kubecolor.tar.gz https://github.com/dty1er/kubecolor/releases/download/v0.0.9/kubecolor_0.0.9_Linux_x86_64.tar.gz
# 	cd /tmp/kubecolor && tar -xzf kubecolor.tar.gz && mv /tmp/kubecolor/kubecolor ~/dotfiles/bin/
# 	ln -s ~/dotfiles/bin/kubecolor  ~/dotfiles/bin/kc
# terminal UI to interact with your Kubernetes
install-k8s-k9s:
	mkdir -p /tmp/k9s
	curl -sLo /tmp/k9s/k9s.tar.gz https://github.com/derailed/k9s/releases/download/$(shell curl -s https://api.github.com/repos/derailed/k9s/releases/latest | grep tag_name | cut -d '"' -f 4)/k9s_Linux_arm64.tar.gz
	cd /tmp/k9s && tar -xzf k9s.tar.gz && mv /tmp/k9s/k9s ~/dotfiles/bin/
	chmod +x ~/dotfiles/bin/k9s
	rm -rf /tmp/k9s

# https://github.com/txn2/kubefwd/
# Bulk port forwarding Kubernetes services for local development.
# https://imti.co/kubernetes-port-forwarding/
install-k8s-kubefwd:
	curl -sLo /tmp/kubefwd.deb https://github.com/txn2/kubefwd/releases/download/1.18.1/kubefwd_arm64.deb
	sudo apt install /tmp/kubefwd.deb

# https://github.com/vmware-tanzu/octant/
# Kubernetes dashboard by VMWare
install-k8s-vmware-octant:
	curl -sLo /tmp/octant.deb https://github.com/vmware-tanzu/octant/releases/download/v0.19.0/octant_0.19.0_Linux-ARM64.deb
	sudo apt install /tmp/octant.deb
	echo use octant --listener-addr 0.0.0.0:7777 to listen remotely

# https://github.com/derailed/popeye
# A Kubernetes cluster resource sanitizer
install-k8s-popeye:
	curl -sLo /tmp/popeye.tar.gz https://github.com/derailed/popeye/releases/download/$(shell curl -s https://api.github.com/repos/derailed/popeye/releases/latest | grep tag_name | cut -d '"' -f 4)/popeye_Linux_arm64.tar.gz
	tar -xvzf /tmp/popeye.tar.gz -C /tmp
	cp /tmp/popeye ~/dotfiles/bin
	chmod +x ~/dotfiles/bin/popeye

#  https://github.com/FairwindsOps/polaris
#  Validation of best practices in your Kubernetes clusters https://www.fairwinds.com/polaris
install-k8s-polaris:
	curl -sLo /tmp/polaris.tar.gz https://github.com/FairwindsOps/polaris/releases/download/3.2.1/polaris_3.2.1_linux_arm64.tar.gz
	tar -xvzf /tmp/polaris.tar.gz -C /tmp
	cp /tmp/polaris ~/dotfiles/bin
	chmod +x ~/dotfiles/bin/polaris
	echo with KUBECONFIG set, polaris --dashboard --dashboard-port 8080
	echo you can also install inside cluster:
	echo kubectl apply -f https://github.com/fairwindsops/polaris/releases/latest/download/dashboard.yaml
	echo kubectl port-forward --namespace polaris svc/polaris-dashboard 8080:80

# https://skaffold.dev/
install-k8s-skaffold:
	curl -Lo ~/dotfiles/bin/skaffold https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-arm64
	chmod +x ~/dotfiles/bin/skaffold

install-k8s-kubebox:
	curl -Lo ~/dotfiles/bin/kubebox https://github.com/astefanutti/kubebox/releases/download/v0.9.0/kubebox-linux-arm
	chmod +x ~/dotfiles/bin/kubebox
	echo Do not forget to install cadvisor, for example kubectl apply -f https://raw.github.com/astefanutti/kubebox/master/cadvisor.yaml

install-k8s-kubectl-krew:
	~/dotfiles/bin/get_kubectl_krew.sh

install-k8s-critctl:
	curl --output /tmp/crictl.tar.gz -L https://github.com/kubernetes-sigs/cri-tools/releases/download/$(shell curl -s https://api.github.com/repos/kubernetes-sigs/cri-tools/releases/latest | grep tag_name | cut -d '"' -f 4)/crictl-$(shell curl -s https://api.github.com/repos/kubernetes-sigs/cri-tools/releases/latest | grep tag_name | cut -d '"' -f 4)-linux-arm64.tar.gz
	tar zxvf /tmp/crictl.tar.gz -C ~/dotfiles/bin/

install-k8s-kubectl-krew-plugins:
	# https://github.com/rajatjindal/kubectl-whoami
	kubectl krew install whoami
	# https://github.com/alecjacobs5401/kubectl-sick-pods
	kubectl krew install sick-pods
	# https://github.com/Ladicle/kubectl-rolesum
	kubectl krew install rolesum
	# https://github.com/Trendyol/kubectl-view-webhook#kubectl-view-webhook
	kubectl krew install view-webhook
	# installed separately via Makefile install-k8s-popeye
#	kubectl krew install popeye
	# installed separately via Makefile install-k8s-rakkess
#	kubectl krew install access-matrix

kube-dashboard-normal-install:
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml

kube-dashboard-insecure-install:
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/alternative/kubernetes-dashboard.yaml
	echo possible to grant admin via  kubectl create -f ~/dotfiles/bin/k8s/dashboard-admin.yaml
	echo run kubectl proxy followed with http://localhost:8001/api/v1/namespaces/kube-system/services/http:kubernetes-dashboard:/proxy/#!/overview?namespace=default

install-openshift-oc:
	curl -sLo /tmp/openshift.tar.gz https://github.com/openshift/origin/releases/download/v3.11.0/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz
	tar -xvzf /tmp/openshift.tar.gz -C /tmp
	mv /tmp/openshift-origin-client-tools-*  /tmp/openshift-origin-client-tools
	cp /tmp/openshift-origin-client-tools/oc ~/dotfiles/bin
	type kubectl >/dev/null || /tmp/openshift-origin-client-tools/oc ~/dotfiles/bin
	echo "If there were no kubectl in path, one was installed from oc distro."
	echo "In other case global is used. Please check carefully"

install-helm-common-repos:
	helm repo add incubator http://storage.googleapis.com/kubernetes-charts-incubator || true
	helm repo add gitlab https://charts.gitlab.io || true
	helm repo add eks https://aws.github.io/eks-charts
	helm repo add bitnami https://charts.bitnami.com/bitnami
	helm repo add loki https://grafana.github.io/loki/charts
	helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
	helm repo add stakater https://stakater.github.io/stakater-charts
	helm repo add grafana https://grafana.github.io/helm-charts

zsh-kubetail:
	rm -rf ~/.oh-my-zsh/custom/plugins/kubetail || true
	git clone https://github.com/johanhaleby/kubetail.git ~/.oh-my-zsh/custom/plugins/kubetail

# /KUBERNETES

# IGNITE
install-weaveworks-ignite:
	curl -fLo ~/dotfiles/bin/ignite https://github.com/weaveworks/ignite/releases/download/v0.9.0/ignite-arm64
	chmod +x ~/dotfiles/bin/ignite
	# eliminate when ignite adds support for sudoer
	sudo cp /home/$(USER)/dotfiles/bin/ignite /usr/local/bin

remove-weaveworks-ignite:
	# Force-remove all running VMs
	sudo ignite ps -q | xargs sudo ignite rm -f
	# Remove the data directory
	sudo rm -r /var/lib/firecracker
	# Remove the Ignite binary
	rm ~/dotfiles/bin/ignite
# /IGNITE

workplace-init:
	./workplace_init.sh

workplace-init-mongo:
	./workplace_mongo_init.sh

workplace-sourcecodepro:
	./workplace_source_code_pro.sh

init:
	./init.sh

init_simple:
	./init_simple.sh


# GNOME specific extensions

gnome-dropdown-terminal:
	rm -rf /tmp/gnome-dropdown-terminal
	git clone https://github.com/zzrough/gs-extensions-drop-down-terminal /tmp/gnome-dropdown-terminal
	mv /tmp/gnome-dropdown-terminal/drop-down-terminal@gs-extensions.zzrough.org ~/.local/share/gnome-shell/extensions/drop-down-terminal@gs-extensions.zzrough.org

gnome-dash-to-dock:
	rm -rf /tmp/dash-to-dock
	git clone https://github.com/micheleg/dash-to-dock.git /tmp/dash-to-dock
	cd /tmp/dash-to-dock && make && make install

gnome-unite-shell:
	rm -rf /tmp/gnome-unite-shell
	git clone https://github.com/hardpixel/unite-shell.git /tmp/gnome-unite-shell
	mv /tmp/gnome-unite-shell/unite@hardpixel.eu ~/.local/share/gnome-shell/extensions/unite@hardpixel.eu

# apt-cache show gnome-shell | grep Version
gnome-status-area-horizontal-spacing:
	rm -rf /tmp/status-area-horizontal-spacing-gnome-shell-extension
	git clone git@gitlab.com:p91paul/status-area-horizontal-spacing-gnome-shell-extension.git /tmp/status-area-horizontal-spacing-gnome-shell-extension
	cd /tmp/status-area-horizontal-spacing-gnome-shell-extension && git checkout gnome3.2
	rm -rf ~/.local/share/gnome-shell/extensions/status-area-horizontal-spacing@mathematical.coffee.gmail.com
	mv /tmp/status-area-horizontal-spacing-gnome-shell-extension/status-area-horizontal-spacing@mathematical.coffee.gmail.com   ~/.local/share/gnome-shell/extensions/status-area-horizontal-spacing@mathematical.coffee.gmail.com

gnome-shell-system-monitor:
	sudo apt-get install gir1.2-gtop-2.0 gir1.2-networkmanager-1.0  gir1.2-clutter-1.0
	rm -rf /tmp/gnome-shell-system-monitor-applet
	git clone https://github.com/paradoxxxzero/gnome-shell-system-monitor-applet.git /tmp/gnome-shell-system-monitor-applet
	mv /tmp/gnome-shell-system-monitor-applet/system-monitor@paradoxxx.zero.gmail.com ~/.local/share/gnome-shell/extensions/system-monitor@paradoxxx.zero.gmail.com

# Check issue  https://github.com/jwendell/gnome-shell-extension-timezone/issues/41
gnome-shell-extension-timezone:
	git clone https://github.com/jwendell/gnome-shell-extension-timezone.git ~/.local/share/gnome-shell/extensions/timezone@jwendell
	gnome-shell-extension-tool -e timezone@jwendell

gnome-shell-window-corner-preview:
	rm -rf /tmp/window-corner-preview
	git clone https://github.com/medenagan/window-corner-preview.git /tmp/window-corner-preview
	mv /tmp/window-corner-preview/window-corner-preview@fabiomereu.it ~/.local/share/gnome-shell/extensions/window-corner-preview@fabiomereu.it

gnome-shell-gnome-extension-quicktoggler:
	rm -rf /tmp/gnome-extension-quicktoggler
	git clone https://github.com/Shihira/gnome-extension-quicktoggler.git /tmp/gnome-extension-quicktoggler
	mv /tmp/gnome-extension-quicktoggler ~/.local/share/gnome-shell/extensions/quicktoggler@shihira.github.com
# /GNOME specific extensions

zsh-fzf:
	rm -rf ~/.oh-my-zsh/custom/plugins/fzf || true
	git clone https://github.com/junegunn/fzf.git ~/.oh-my-zsh/custom/plugins/fzf
	~/.oh-my-zsh/custom/plugins/fzf/install --bin
	mkdir -p ~/.oh-my-zsh/custom/plugins/fzf-zsh
	cp ~/dotfiles/helpers/fzf-zsh.plugin.zsh ~/.oh-my-zsh/custom/plugins/fzf-zsh

# +plugins=(... alias-tips)
zsh-alias-tips:
	git clone https://github.com/djui/alias-tips.git ~/.oh-my-zsh/custom/plugins/alias-tips

# +plugins=( ... git-extra-commands )
# https://github.com/unixorn/git-extra-commands
zsh-git-extra-commands:
	rm -rf ~/.oh-my-zsh/custom/plugins/git-extra-command || true
	git clone https://github.com/unixorn/git-extra-commands.git ~/.oh-my-zsh/custom/plugins/git-extra-command

# TERRAFORM

install-terraform-ing:
	gem install terraforming

install-terraform-terraspace:
	gem install terraspace

install-terraform-docs:
	curl -sLo ~/dotfiles/bin/terraform-docs https://github.com/terraform-docs/terraform-docs/releases/download/$(shell curl -s https://api.github.com/repos/terraform-docs/terraform-docs/releases/latest | grep tag_name | cut -d '"' -f 4)/terraform-docs-$(shell curl -s https://api.github.com/repos/terraform-docs/terraform-docs/releases/latest | grep tag_name | cut -d '"' -f 4)-linux-arm64
	chmod +x ~/dotfiles/bin/terraform-docs

# interactive d3js-graphviz visualization for terraform graph (beta)
install-terraform-blast:
	pip install blastradius

install-tflint:
	curl -sLo /tmp/tflint.zip https://github.com/terraform-linters/tflint/releases/download/$(shell curl -s https://api.github.com/repos/terraform-linters/tflint/releases/latest | grep tag_name | cut -d '"' -f 4)/tflint_linux_arm64.zip
	cd /tmp && unzip tflint.zip
	mv /tmp/tflint ~/dotfiles/bin
	chmod +x ~/dotfiles/bin/tflint
# /TERRAFORM


# HASHICORP
install-hashicorp-vault:
	curl -sLo ~/dotfiles/bin/vault.zip "https://releases.hashicorp.com/vault/1.0.1/vault_1.0.1_linux_arm64.zip"
	cd ~/dotfiles/bin/ && unzip vault.zip && chmod +x vault && rm vault.zip

install-hashicorp-terraform:
	curl -sLo ~/tmp/terraform.zip "https://releases.hashicorp.com/terraform/0.14.5/terraform_0.14.5_linux_arm64.zip"
	cd ~/tmp/ && unzip terraform.zip && chmod +x terraform && rm terraform.zip && mv terraform ~/dotfiles/bin/

install-hashicorp-packer:
	curl -sLo ~/dotfiles/bin/packer.zip "https://releases.hashicorp.com/packer/1.6.6/packer_1.6.6_linux_arm64.zip"
	cd ~/dotfiles/bin/ && unzip packer.zip && chmod +x packer && rm packer.zip


#/HASHICORP

# GO

install-go-gimme:
	curl -sL -o ~/dotfiles/bin/gimme https://raw.githubusercontent.com/travis-ci/gimme/master/gimme
	chmod +x ~/dotfiles/bin/gimme

go-rename:
	go get golang.org/x/tools/cmd/gorename

go-eg:
	go get golang.org/x/tools/cmd/eg

# /GO

# JAVA

install-jenv:
	git clone https://github.com/gcuisinier/jenv.git ~/.jenv
	echo "================================================="
	echo "Restart session, than once you have jenv"
	echo "jenv enable-plugins maven"
	echo "jenv enable-plugins export"
	echo "======== then discover java versions:"
	echo "update-alternatives --config java"
	echo "======== Add java versions as"
	echo "/usr/lib/jvm/java-11-openjdk-arm64/"
	echo "Validate install and checking both java -version and javac -version"
	echo "That should match"
	echo "run 'jenv doctor' in case of issues"

# /JAVA

# CLOUDS

# https://github.com/peak/s5cmd/
install-aws-s5cmd:
	curl -sLo /tmp/s5cmd.tar.gz https://github.com/peak/s5cmd/releases/download/v1.2.1/s5cmd_1.2.1_Linux-arm64.tar.gz
	tar -xvzf /tmp/s5cmd.tar.gz -C /tmp
	cp /tmp/s5cmd ~/dotfiles/bin
	chmod +x ~/dotfiles/bin/s5cmd

# https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html
install-aws-cli:
	curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip"
	cd /tmp && unzip awscliv2.zip
	cd /tmp && sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update

install-ovh-nova:
	sudo pip install python-openstackclient

# https://console.aws.amazon.com/cloudformation/designer
# https://github.com/awslabs/aws-cfn-template-flip
install-aws-cfn-template-flip:
	sudo pip3 install cfn-flip

# / CLOUDS

fonts-swiss-knife: fonts-init fonts-awesome-terminal-fonts fonts-source-code-pro-patched
	mkdir -p ~/.fonts

fonts-init:
	sudo apt install fontconfig

fonts-awesome-terminal-fonts:
	mkdir -p ~/.fonts
	curl -sLo ~/.fonts/devicons-regular.sh "https://raw.githubusercontent.com/gabrielelana/awesome-terminal-fonts/master/build/devicons-regular.sh"
	curl -sLo ~/.fonts/devicons-regular.ttf "https://raw.githubusercontent.com/gabrielelana/awesome-terminal-fonts/master/build/devicons-regular.ttf"
	curl -sLo ~/.fonts/fontawesome-regular.sh "https://raw.githubusercontent.com/gabrielelana/awesome-terminal-fonts/master/build/fontawesome-regular.sh"
	curl -sLo ~/.fonts/fontawesome-regular.ttf "https://raw.githubusercontent.com/gabrielelana/awesome-terminal-fonts/master/build/fontawesome-regular.ttf"
	curl -sLo ~/.fonts/octicons-regular.sh "https://raw.githubusercontent.com/gabrielelana/awesome-terminal-fonts/master/build/octicons-regular.sh"
	curl -sLo ~/.fonts/octicons-regular.ttf "https://raw.githubusercontent.com/gabrielelana/awesome-terminal-fonts/master/build/octicons-regular.ttf"
	curl -sLo ~/.fonts/pomicons-regular.sh "https://raw.githubusercontent.com/gabrielelana/awesome-terminal-fonts/master/build/pomicons-regular.sh"
	curl -sLo ~/.fonts/pomicons-regular.ttf "https://raw.githubusercontent.com/gabrielelana/awesome-terminal-fonts/master/build/pomicons-regular.ttf"
	fc-cache -fv ~/.fonts
	fc-list | grep "FontAwesome"

fonts-source-code-pro:
	mkdir -p ~/.fonts
	curl -sLo ~/.fonts/SourceCodeVariable-Italic.otf "https://github.com/adobe-fonts/source-code-pro/releases/download/variable-fonts/SourceCodeVariable-Italic.otf"
	curl -sLo ~/.fonts/SourceCodeVariable-Italic.ttf "https://github.com/adobe-fonts/source-code-pro/releases/download/variable-fonts/SourceCodeVariable-Italic.ttf"
	curl -sLo ~/.fonts/SourceCodeVariable-Roman.otf "https://github.com/adobe-fonts/source-code-pro/releases/download/variable-fonts/SourceCodeVariable-Roman.otf"
	curl -sLo ~/.fonts/SourceCodeVariable-Roman.ttf "https://github.com/adobe-fonts/source-code-pro/releases/download/variable-fonts/SourceCodeVariable-Roman.ttf"
	fc-cache -fv ~/.fonts
	fc-list | grep "Source Code Pro"
fonts-source-code-pro-patched:
	mkdir -p ~/.fonts
	curl -sLo ~/.fonts/Sauce_Code_Pro_Nerd_Font_Complete_Mono_Windows_Compatible.ttf "https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete%20Mono%20Windows%20Compatible.ttf"
	curl -sLo ~/.fonts/Sauce_Code_Pro_Nerd_Font_Complete_Mono.ttf "https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete%20Mono.ttf"
	curl -sLo ~/.fonts/Sauce_Code_Pro_Nerd_Font_Complete_Windows_Compatible.ttf "https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete%20Windows%20Compatible.ttf"
	curl -sLo ~/.fonts/Sauce_Code_Pro_Nerd_Font_Complete.ttf "https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete.ttf"
	fc-cache -fv ~/.fonts
	fc-list | grep "Source Code"

z-clean-downloads:
	rm ~/Downloads/*.rdp

# AWS

#https://aws.amazon.com/serverless/sam/
install-aws-sam-cli:
	pip install --user aws-sam-cli

#https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html#install-plugin-linux
install-aws-session-manager-plugin:
	curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_arm64/session-manager-plugin.deb" -o "/tmp/session-manager-plugin.deb"
	sudo cd /tmp && dpkg -i session-manager-plugin.deb
	rm /tmp/session-manager-plugin.deb

# /AWS

# SECURITY

sec-nmap-sandmap:
	sudo apt-get install proxychains
	rm -rf /tmp/sandmap && cd /tmp && git clone --recursive https://github.com/trimstray/sandmap
	cd /tmp/sandmap && sudo ./setup.sh install
	echo use sandmap
# /SECURITY


# DOCUMENTATION

# https://www.mkdocs.org/
install-mkdocs:
	pip install mkdocs

# Small markdown to confluence
install-confluence-mark:
	curl -sLo /tmp/confluencemark.tar.gz https://github.com/kovetskiy/mark/releases/download/5.7/mark_5.7_Linux_arm64.tar.gz
	tar -xvzf /tmp/confluencemark.tar.gz -C /tmp
	cp /tmp/mark ~/dotfiles/bin
	chmod +x ~/dotfiles/bin/mark

#/ DOCUMENTATION

# GARBAGE

install-traefik:
	curl -sLo /tmp/traefik2.tar.gz https://github.com/traefik/traefik/releases/download/v1.7.30/traefik_linux-arm64
	tar -xvzf /tmp/traefik2.tar.gz -C /tmp
	mv /tmp/traefik ~/dotfiles/bin/traefik
	chmod +x ~/dotfiles/bin/traefik

# / GARBAGE

# PHP

install-phpmd:
	curl -sLo ~/dotfiles/bin/phpmd https://phpmd.org/static/latest/phpmd.phar
	chmod +x ~/dotfiles/bin/phpmd

install-php-symphony-cli:
	curl -sLo /tmp/symfony.gz https://github.com/symfony/cli/releases/download/v4.23.5/symfony_linux_arm64.gz
	gunzip /tmp/symfony.gz
	mv /tmp/symfony ~/dotfiles/bin
	chmod +x ~/dotfiles/bin/symfony
# /PHP


# RUNS

run-octant-remote:
	octant --listener-addr 0.0.0.0:7777

# Database modelling tools

install-dbtools-terra-er:
	curl -sLo ~/dotfiles/bin/terra.jar https://github.com/rterrabh/TerraER/releases/download/TerraER3.11/TerraER3.11.jar

install-dbtools-schemaspy:
	curl -sLo ~/dotfiles/bin/schemaspy.jar https://github.com/schemaspy/schemaspy/releases/download/v6.1.0/schemaspy-6.1.0.jar

install-dbtools-dbml-cli-npm:
	which npm
	npm install -g @dbml/cli
	@echo dbml2sql schema.dbml
	@echo dbml2sql schema.dbml --mysql
	@echo "dbml2sql <path-to-dbml-file> [--mysql|--postgres] [-o|--out-file <output-filepath>]"
	@echo sql2dbml dump.sql --postgres
	@echo sql2dbml --mysql dump.sql -o mydatabase.dbml
	@echo "sql2dbml <path-to-sql-file> [--mysql|--postgres] [-o|--out-file <output-filepath>]"

# security

install-rengine:
	mkdir -p ~/apps
	git clone git@github.com:yogeshojha/rengine.git ~/apps/rengine
	cd ~/apps/rengine && make build

# https://ostechnix.com/debian-goodies-a-set-of-useful-utilities-for-debian-and-ubuntu-users/
# https://blog.sleeplessbeastie.eu/2015/03/02/how-to-verify-installed-packages/
# https://www.tecmint.com/install-rootkit-hunter-scan-for-rootkits-backdoors-in-linux/
install-base-security:
	sudo apt-get install lynis debian-goodies needrestart debsums debsecan rkhunter

# /security

# swagger

install-misc-swagen:
	rm -rf /tmp/swagen || true
	mkdir -p /tmp/swagen
	git clone git@github.com:minitauros/swagen.git /tmp/swagen
	cd /tmp/swagen && go build -o ~/dotfiles/bin/swagen main.go

install-misc-albert-source:
	rm -rf $(HOME)/albert
	cd $(HOME) && git clone --recursive https://github.com/albertlauncher/albert.git
	cd $(HOME)/albert
	mkdir -p albert-build
	cd albert-build
	cmake ../albert -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Debug
	make
	echo "Consider installing plugins from  https://github.com/bergercookie/awesome-albert-plugins"

install-misc-albert-plugins:
	git clone https://github.com/bergercookie/awesome-albert-plugins.git ~/.local/share/albert/org.albert.extension.python/modules

# https://software.opensuse.org/download.html?project=home:manuelschneid3r&package=albert
install-misc-albert-deb:
	echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_18.04/ /' | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list
	curl -fsSL https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_18.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_manuelschneid3r.gpg > /dev/null
	sudo apt update
	sudo apt install albert
	echo "Consider installing plugins from  https://github.com/bergercookie/awesome-albert-plugins"

install-misc-cadvisor:
	curl -sLo ~/dotfiles/bin/cadvisor https://github.com/google/cadvisor/releases/download/v0.38.7/cadvisor
	chmod +x ~/dotfiles/bin/cadvisor

fix-locale:
	sudo apt-get install -y locales
	locale-gen en_US.UTF-8
	localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

# replace system python with custom
#add-apt-repository ppa:deadsnakes/ppa
#apt install python3.8
# update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1

# sftp go standalone
#https://github.com/drakkan/sftpgo
install-aws-myaws:
	curl -sLo /tmp/myaws.tar.gz https://github.com/minamijoyo/myaws/releases/download/v0.4.8/myaws_v0.4.8_linux_arm64.tar.gz
	tar -xvzf /tmp/myaws.tar.gz -C ~/dotfiles/bin
	rm /tmp/myaws.tar.gz
