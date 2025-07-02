# Arch Installation

## Initial
1. Press F2 to go into BIOS setting
2. Set USB Flash Drive as primary
3. Clear all secure boot keys
4. Restart and select Arch install medium
5. Increase font size by `setfont ter-132n`

## Set keyboard layout (might not be required)
1. `loadkeys us` or any other country required (`localectl list-keymaps`)

## Connecting to wifi
1. Enter **iwd** by `iwctl`
2. `device list`
3. `station wlan0 get-networks`
4. `station wlan0 connect network_name`
5. Enter passphrase
6. `exit` **iwd**
7. Check if its working by `ping archlinux.org` or any other
8. Use `timedatectl` to sync system clock

## Partitioning disk
1. `lsblk` and check the free space disk
2. `fdisk -l` and confirm the bootable disk
3. `cfdisk nvme0n1` or whichever disk
4. If a pickers appears, select `gpt`
4. Click the *free space*
5. Create the partitions
    - 1G EFI System
    - 4G - 8G Linux swap (I will do 6G)
    - Remaining free space (or whatever) Linux filesystem
6. Select `Write`, confirm and `Quit`
7. Confirm with `lsblk`

## Formatting partitions
1. Root partition (eg.: `nvme0n1p6`)
```
mkfs.ext4 /dev/nvme0n1p6
```
2. Boot partition (eg.: `nvme0n1p4`)
```
mkfs.fat -F32 /dev/nvme0n1p4
```
3. Swap partition (eg.: `nvme0n1p5`)
```
mkswap /dev/nvme0n1p5
```

## Mounting partitions
1. Root partition
```
mount /dev/nvme0n1p6 /mnt
```
2. Create directory for boot partition
```
mkdir -p /mnt/boot
```
3. Boot partition
```
mount /dev/nvme0n1p4 /mnt/boot
```

## Activate swap
```
swapon /dev/nvme0n1p5
```

## Installing the base system
Also install [essential packages](https://wiki.archlinux.org/title/Installation_guide#Install_essential_packages) as listed on the ArchWiki
```
pacstrap -K /mnt base linux linux-firmware sof-firmware base-devel grub efibootmgr vim networkmanager intel-ucode
```

## Configuring the system
1. Generating **fstab**
```
genfstab -U /mnt >> /mnt/etc/fstab
```
2. Chroot into system
```
arch-chroot /mnt
```
3. Set timezone
```
ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
hwclock --systohc
```
4. Localization
`vim /etc/locale.gen` and uncomment `en_US.UTF-8 UTF-8`
```
locale-gen
```
`vim /etc/locale.conf` and set LANG as
```
LANG=en_US.UTF-8
```
5. Creating the Hostname
`vim /etc/hostname` and write your hostname
6. Create root password with `passwd`

## Adding a user
1. Create the user
```
useradd -m -G wheel -s /bin/bash username
passwd username
```
2. Edit the sudoers file
```
EDITOR=vim visudo
```
3. Uncomment this line
```
%wheel ALL=(ALL) ALL
```
4. su username and do any *sudo command* to confirm

## Enabling services
```
systemctl enable NetworkManager
```

## Setting up GRUB
1. Install some required stuff `pacman -Sy dosfstools mtools`
2. Install grub into the boot partition
```
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
```
3. Update grub config file
```
grub-mkconfig -o /boot/grub/grub.cfg
```

## Finish up
1. `exit` chroot
2. Unmount all the drives `umount -a`
3. `shutdown now` and remove the pendrive

## Adding Windows entry
1. `sudo -s` and `vim /etc/default/grub`
2. Set `GRUB_TIMEOUT=30`
3. Uncomment `GRUB_DISABLE_OS_PROBER=false`
4. `pacman -Sy os-prober`
5. Update grub config
```
grub-mkconfig -o /boot/grub/grub.cfg
```

## Disabling DGPU
1. Blacklist the nouveau drivers by creating
```
/etc/modprobe.d/blacklist-nouveau.conf
--------------------------------------
blacklist nouveau
options nouveau modeset=0
```
2. Then create
```
/etc/udev/rules.d/00-remove-nvidia.rules
========================================
# Remove NVIDIA USB xHCI Host Controller devices, if present
ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x0c0330", ATTR{power/control}="auto", ATTR{remove}="1"

# Remove NVIDIA USB Type-C UCSI devices, if present
ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x0c8000", ATTR{power/control}="auto", ATTR{remove}="1"

# Remove NVIDIA Audio devices, if present
ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x040300", ATTR{power/control}="auto", ATTR{remove}="1"

# Remove NVIDIA VGA/3D controller devices
ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x03[0-9]*", ATTR{power/control}="auto", ATTR{remove}="1"
```

## Other stuff
- Power management: thermald and power-profiles-daemon
- Audio: pipewire


## Sources
[ArchWiki](https://wiki.archlinux.org/title/Installation_guide)

[Denshi's *Comfy* Guide](https://www.youtube.com/watch?v=68z11VAYMS8)
