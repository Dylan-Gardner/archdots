#!/bin/bash

# open and add key file
sudo cryptsetup open /dev/sde1 external
sudo cryptsetup luksAddKey /dev/sde1 /root/secrets/crypto_keyfile.bin

# open and add key file
sudo cryptsetup open /dev/sda ssd
sudo cryptsetup luksAddKey /dev/sda /root/secrets/crypto_keyfile.bin

# open and add key file
sudo cryptsetup open /dev/mapper/storage-hdd hdd
sudo cryptsetup luksAddKey /dev/mapper/storage-hdd /root/secrets/crypto_keyfile.bin

# dump ket slots
sudo cryptsetup luksDump /dev/sde1
sudo cryptsetup luksDump /dev/sda
sudo cryptsetup luksDump /dev/mapper/storage-hdd
