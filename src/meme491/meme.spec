Summary: meme
Name: meme
Version: 4.9.1
Release: 0
License: University of California
Vendor: Rocks Clusters
Group: System Environment/Base
Source: meme-4.9.1.tar.gz
Buildroot: /home/nadya/git/meme/src/meme491/meme.buildroot



AutoReq: no
%description
meme
%prep
%setup
%build
printf "\n\n\n### build ###\n\n\n"
BUILDROOT=/home/nadya/git/meme/src/meme491/meme.buildroot make -f /home/nadya/git/meme/src/meme491/meme.spec.mk build
%install
printf "\n\n\n### install ###\n\n\n"
BUILDROOT=/home/nadya/git/meme/src/meme491/meme.buildroot make -f /home/nadya/git/meme/src/meme491/meme.spec.mk install
%files 
/

