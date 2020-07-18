yum -y install epel-release libevdev.x86_64 nfs-utils.x86_64 kmod-libs.x86_64 kernel.x86_64 kernel-headers.x86_64 kernel-devel.x86_64
yum update -y
yum -y install subversion binutils bzip2 gcc gcc-c++ gawk gettext flex ncurses-devel zlib-devel zlib-static make patch unzip perl-ExtUtils-MakeMaker glibc glibc-devel glibc-static quilt ncurses-libs sed sdcc intltool sharutils bison wget git-core openssl-devel xz
yum -y install libssh2-devel.x86_64 libssh2.x86_64 jansson.x86_64 jansson-devel.x86_64 xz-devel.x86_64 pyliblzma.x86_64

git clone --depth 1 https://github.com/openwrt/openwrt -b v19.07.3