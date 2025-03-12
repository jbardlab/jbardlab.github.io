# list all the files in the directory:
curl -l ftp://ftp.bvbrc.org/viruses/

# download specific file:
wget "ftp://ftp.bvbrc.org/viruses/Poxviridae.PATRIC.faa"

# download multiple files:
for i in `cat virus_list`; do wget "ftp://ftp.bvbrc.org/viruses/$i.PATRIC.faa"; done
