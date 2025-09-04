# Linux KVM 

KVM consists of a loadable kernel module, kvm.ko, that provides the core virtualization infrastructure and a processor specific module, kvm-intel.ko or kvm-amd.ko. Below diagram illustrates how the KVM hypervisor virtualizes the compute resources for Linux on KVM.

**Installation**
- Step1:  Verification
  ```
  cat /proc/cpuinfo | egrep --color "vmx|svm"
  lscpu | grep Virtualization
  ```

- Step2: Install
  ```
  sudo dnf install @virt


  sudo dnf install epel-release yum-utils -y

  sudo dnf install -y qemu-kvm libvirt ibvirt-devel libvirt-client virt-install virt-viewer
  
  sudo dnf install -y libguestfs-tools libguestfs-xfs virt-top
  
  sudo dnf install -y bridge-utils   

  ```

- Step3: Check if kernel modules are loaded
  ```
  $ lsmod | grep kvm
  ```

- Start KVM daemon ``libvirtd``
  ```
  sudo systemctl start libvirtd
  sudo systemctl enable libvirtd
  ```

## Linux Bridge
The Linux bridge ``virbr0`` is created at the time of installation and can be used to create Virtual Machines that doesn’t need external IP connectivity. It uses NAT to give VMs internet access.

```
$ ip a
$ brctl show
```