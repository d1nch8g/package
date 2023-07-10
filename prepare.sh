# Local gitea instance should be running and have dancheg97 user for gitea tests.

cd testpkg
makepkg -sfri --sign --noconfirm
echo -n dancheg97package$(date --rfc-3339=seconds | tr " " T) >> md
gpg --detach-sign md
pack -d . -Pw localhost:3000/dancheg97/testpkg
wget http://localhost:3000/api/packages/dancheg97/arch/archlinux/x86_64/dancheg97.localhost.db
cd ..

cd testpkg2
makepkg -sfri --sign --noconfirm
echo -n dancheg97package$(date --rfc-3339=seconds | tr " " T) >> md
gpg --detach-sign md
pack -d . -Pw localhost:3000/dancheg97/testpkg
wget http://localhost:3000/api/packages/dancheg97/arch/archlinux/any/dancheg97.localhost.db.tar.gz
cd ..

sudo rm -rf testpkg/pkg
sudo rm -rf testpkg/src
sudo rm -rf testpkg2/pkg
sudo rm -rf testpkg2/src
