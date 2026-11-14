# NixOS Manual Installation Guide (Flakes & Multi-Host)

> Covers: live USB boot → partitioning → mounting → config deployment → binary cache setup → install with Flakes → reboot.
> Assumes UEFI system, GPT partition table, single disk. Adjust device paths to your hardware.

---

## Prerequisites

- NixOS ISO flashed to USB (`dd` or Ventoy)
- Your NixOS config in git (`https://github.com/<your-username>/nixconf`)
- Target disk identified via `lsblk`
- Secure Boot disabled in BIOS/UEFI

---

## Step 1 — Boot the Live ISO

1. Insert USB, boot into the boot menu (F12 / F2 / DEL depending on motherboard).
2. Select the NixOS installer entry.
3. Open a terminal and switch to root:

```bash
sudo -i
```

---

## Step 2 — Identify Your Disk

```bash
lsblk
```

Common device paths:

| Disk type | Example path |
|-----------|-------------|
| NVMe SSD | `/dev/nvme0n1` |
| SATA SSD / HDD | `/dev/sda` |

All commands below assume `/dev/nvme0n1`. **Replace with your target disk path.**

---

## Step 3 — Partition the Disk (UEFI / GPT)

> ⚠️ **Warning:** This wipes the target disk completely.

```bash
parted /dev/nvme0n1 -- mklabel gpt
parted /dev/nvme0n1 -- mkpart ESP fat32 1MiB 512MiB
parted /dev/nvme0n1 -- set 1 esp on
parted /dev/nvme0n1 -- mkpart primary 512MiB 100%
```

Partitions created:
- **Partition 1 (`/dev/nvme0n1p1`):** 512 MiB EFI System Partition (`ESP`)
- **Partition 2 (`/dev/nvme0n1p2`):** Root filesystem (`nixos`)

---

## Step 4 — Format Partitions

```bash
# EFI partition — FAT32 with label 'boot'
mkfs.fat -F 32 -n boot /dev/nvme0n1p1

# Root partition — ext4 with label 'nixos'
mkfs.ext4 -L nixos /dev/nvme0n1p2
```

---

## Step 5 — Mount Filesystems

```bash
mount /dev/disk/by-label/nixos /mnt
mkdir -p /mnt/boot
mount /dev/disk/by-label/boot /mnt/boot
```

---

## Step 6 — Generate Base Hardware Config

```bash
nixos-generate-config --root /mnt
```

This creates `/mnt/etc/nixos/hardware-configuration.nix` detecting the PC's actual drives, UUIDs, and CPU microcode.

---

## Step 7 — Deploy Your Flake Config

1. Enable `git`:
   ```bash
   nix-shell -p git
   ```

2. Backup the generated hardware configuration to `/tmp`:
   ```bash
   cp /mnt/etc/nixos/hardware-configuration.nix /tmp/hardware-configuration.nix
   ```

3. Clone your repository into `/mnt/etc/nixos`:
   ```bash
   # Remove the default skeleton directory
   rm -rf /mnt/etc/nixos

   # Clone your repository
   git clone https://github.com/Samandar-Komilov/nixconf.git /mnt/etc/nixos
   ```

4. Place the generated hardware configuration into the host folder:
   ```bash
   # For Work PC (constantinople):
   cp /tmp/hardware-configuration.nix /mnt/etc/nixos/hosts/constantinople/hardware-configuration.nix
   ```

---

## Step 8 — Enable Xinux Binary Cache (Official Way for Fast Downloads in Uzbekistan)

Your repo's `modules/core/default.nix` already has `cache.xinux.uz` configured for the installed system. 

To also speed up the live installer environment itself using the official Xinux setup:

```bash
mkdir -p /etc/nix
cat >> /etc/nix/nix.conf << 'EOF'
extra-substituters = https://cache.xinux.uz
extra-trusted-public-keys = cache.xinux.uz:BXCrtqejFjWzWEB9YuGB7X2MV4ttBur1N8BkwQRdH+0=
EOF

systemctl restart nix-daemon
```

*(Using `extra-substituters` and `extra-trusted-public-keys` is the official Xinux recommendation: it cleanly appends `cache.xinux.uz` while preserving default fallback caches without overwriting system defaults).*

---

## Step 9 — Run the Installation

Run `nixos-install` with the `--flake` flag pointing to your host profile:

```bash
# Installing the Work PC host:
nixos-install --flake /mnt/etc/nixos#constantinople
```

*(If prompted at the end for a root password, enter one).*

---

## Step 10 — Set User Password & Reboot

Before rebooting, set the password for your user `fatih`:

```bash
nixos-enter --root /mnt -c 'passwd fatih'
```

Then unmount and reboot:

```bash
reboot
```

Remove the installation USB drive. The system will boot into KDE Plasma 6 with user `fatih` ready.
