Use a command ike the following in the subdirectory for the desired distro to make the cloud-init ISO:

```bash
sudo genisoimage -output $(pwd)/cidata-opensuse.iso -V cidata -r -J ./user-data ./meta-data
```
