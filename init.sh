# sudo chmod +x ./init.sh && ./init.sh
Run () {
   sudo chmod +x $1 && $1
}

Run ./config/git/setup.sh
Run ./ngnix/setup.sh
Run ./config/docker/setup.sh
Run ./config/db/setup.sh