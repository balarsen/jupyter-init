#!/bin/bash 

file=extremely/long/file/name
file+=/that/i/would/like/to/be/able/to/break
file+=/up/if/possible

developRM="This directory stores the working versions of notebooks\n"
developRM+="This of this as a lab notebook\n"

deliverRM="This directory stores the final as delivered versions of notebooks\n"
deliverRM+="This of this as a deliverable/presentation\n"

figuresRM="This directory stores saved figures\n"
figuresRM+="One stop location for all figures\n"

srcRM="This directory stores scripts that are written and imported into notebooks\n"
srcRM+="Saves one from having to type way too much into a notebook\n"
srcRM+="oten best to import these with %import\n"

dataRM="Store any data files in here"

read -r -d '' template_notebook <<"EOF"
{
 "cells": [
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "# Heading\n"
   ]
  },
  {
   "cell_type": "raw",
   "metadata": {},
   "source": [
    "Los Alamos National Laboratory\n",
    "ISR-1 Space Science and Applications\n",
    "Brian Larsen, Ph.D.\n",
    "balarsen@lanl.gov\n",
    "505-665-7691"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {
    "collapsed": false
   },
   "outputs": [],
   "source": [
    "%matplotlib inline\n",
    "#%matplotlib notebook\n",
    "%load_ext version_information\n",
    "%load_ext autoreload\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {
    "collapsed": false
   },
   "outputs": [],
   "source": [
    "import datetime\n",
    "import os\n",
    "import sys\n",
    "import warnings\n",
    "\n",
    "warnings.simplefilter(\"ignore\")\n",
    "import matplotlib.pyplot as plt\n",
    "import numpy as np\n",
    "import spacepy.datamodel as dm\n",
    "import spacepy.plot as spp\n",
    "import spacepy.toolbox as tb\n",
    "\n",
    "%version_information matplotlib, numpy"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {
    "collapsed": false
   },
   "outputs": [],
   "source": [
    "FIGDIR = os.path.join('..', 'figures')\n",
    "SRCDIR = os.path.join('..', 'src')\n",
    "DEVDIR = os.path.join('..', 'develop')\n",
    "DELDIR = os.path.join('..', 'deliver')\n",
    "DATDIR = os.path.join('..', 'data')\n",
    "sys.path.append(SRCDIR)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {
    "collapsed": false
   },
   "outputs": [],
   "source": [
    "plt.rcParams['figure.figsize'] = [10, 6]\n",
    "plt.rcParams['savefig.dpi'] = plt.rcParams['figure.dpi'] # 72\n",
    "%config InlineBackend.figure_format = 'retina'"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {
    "collapsed": true
   },
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "anaconda-cloud": {},
  "kernelspec": {
   "display_name": "Python [conda env:python3]",
   "language": "python",
   "name": "conda-env-python3-py"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.5.2"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 1
}
EOF

display_usage() { 
	echo -e "\nUsage:\n$0 name_to_initialize \n" 
	} 
# if less than two arguments supplied, display usage 
if [  $# -ne 1 ] 
then
    display_usage
    exit 1
fi 

# check whether user had supplied -h or --help . If yes display usage 
if [[ ( $# == "--help") ||  $# == "-h" ]] 
then 
    display_usage
    exit 0
fi 

DIRECTORIES=("$1/develop" "$1/deliver" "$1/figures" "$1/src" "$1/data")


# does the name supplied exist? If so we are done
if [ -d "$1" ]; then
    echo "Directory: $1 exists, can only initialize in an empty space"
    exit 3
fi

for i in "${DIRECTORIES[@]}"; do   # The quotes are necessary here
    # do the directiries exist that we will create? If so don't run
    if [ -d "$i" ]; then
	echo "Directory: $i exists, can only initialize in an empty space"
	exit 2
    fi
done

# directories do not exist, make them
# do the directiries exist that we will create? If so don't run
echo "Making directory: $1"
mkdir $1

for i in "${DIRECTORIES[@]}"; do   # The quotes are necessary here
    echo "Making directory: $i"
    mkdir $i
done

# copy the files into the directories
echo $developRM > "$1/develop/README"
echo $deliverRM > "$1/deliver/README"
echo $figuresRM > "$1/figures/README"
echo $srcRM > "$1/src/README"
echo $dataRM > "$1/data/README"

# and the template notebook
echo "${template_notebook}" > $1/develop/template.ipynb
echo "${template_notebook}" > $1/deliver/template.ipynb


# initialize git
cd $1
git init
for i in "${DIRECTORIES[@]}"; do   # The quotes are necessary here
    echo "adding files in $i to git"
    git add `basename $i`
done

git commit -a -m "initial commit, jupyter-init"

cd ..





echo "Finished, project $1 is ready to begin"

