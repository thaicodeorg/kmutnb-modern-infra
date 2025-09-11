# Install vagrant

[]()

```
sudo dnf install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo dnf update -y
sudo dnf -y install vagrant
```

```
vagrant box add generic/stream9
```