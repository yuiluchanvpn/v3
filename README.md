### INSTALL SCRIPT 
```
apt update && apt install -y tmux
tmux new-session -s v3
```
```
apt update -y && apt upgrade -y && apt install -y dos2unix wget && \
wget -q https://raw.githubusercontent.com/yuiluchanvpn/v3/main/ubu20-deb10-stable.sh && \
dos2unix ubu20-deb10-stable.sh && chmod +x ubu20-deb10-stable.sh && \
./ubu20-deb10-stable.sh

```

```
tmux attach -t v3
```

## UPDATE SCRIPT
```
wget -q https://raw.githubusercontent.com/king-vpn/v3/main/update.sh && chmod +x update.sh && ./update.sh
```

### WORK DI OS
- UBUNTU 20.04.05
- DEBIAN 10 ( Disarankan )
