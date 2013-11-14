README
-------

MEME roll build and maintenance guide
To download from git use: *git clone https://github.com/nbcrrolls/meme*
A roll directory *meme/* will the created . Building a roll requires one
to be on the rocks cluster. Current roll structure works on rocks 6.0 - 6.1
The instructions below refer to the files and direcotries in *meme/*

The roll includes 2 versions: a new released version, and a previuosly
released version.  MEME server installation is set to install a new version 
as a default and a previous version as a back version. Both will be using
the same databases.  A back version is kept for user convenience. 

When a roll is created the ISO name will reflect the rocks version and the 
meme new version, for example: meme-6.0-0_4.9.1.x86_64.disk1.iso
is for Rocks 6.0 and meme version 4.9.1.

# Run bootstrap.sh before making a roll.  The script compiles and installs
  perl dependencies (RPMS) These RPMS will also be included in the roll
  (needed for creating db csv files).

# When updating to a new version X from version X-1:

  1. Update src/version.mk to reflect new versions. 
  2. Create memeX/: 

     * Copy relevant files from previous version memeX-1/: Makefile, \*.in 
     *  Add new distro meme_X.tar.gz
     *  Update NAME in versino.mk.in to reflect new version X
     *  Update gomo_db.csv and motif_db.csv files: 
        extract them from src/meme-db/\*.tgz files and put in memeX/patch-files/memeX/etc/
        A target in Makefile puts them in a correct place and provides for creation of 
        index files during compile step.
  3. In memeX-1/:

       * Create last.mk and set versions according to new-old verison scheme for the version.
       * Update target version.mk in Makefile to use last.mk

# When updating meme DBs in src/meme-db/:

  * download from http://ebi.edu.au/ftp/software/MEME/index.html
    gomo_databases.tgz  - corresponds to gomo_databases.3.tgz  (updated Jun 18 2010) 
    motif_databases.10.3.tgz - updated Nov 2013  
  * *IMPORTANT:* update motif_db.csv and gomo_db.csv files in 
    memeX/patch-files/memeX/etc/ and memeX-1/patch-files/memeX-1/etc/

# File src/rocks-meme/meme-logs
  Don't make it a part of the distro, it is NBCR specific and is used to harvest meme logs
  for meme team.  Update when needed and drop in manually in /etc/cron.daily on the meme server frontend.

Specific versions notes
=======================
# meme 4.9.0  

::

  For patch fasta-get-markov.patch (added 2013-06-12)
  add  to meme/Makefile lines (before configure)
     aclocal;                      \
     autoreconf --force --install; \  

  since this patch changes Makefil.am files and new
  Makefile.in and autoconf-related tools have to be generated anew. 
