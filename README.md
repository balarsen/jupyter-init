# jupyter-init
Initialization scripts for Jupyter notebooks

Just run the bash script and pass in a directory to setup for jupyter notebook project
```bash
~> jupyter-init.sh
Usage:
/Users/blarsen/git/jupyter-init/jupyter-init.sh name_to_initialize
```
Example usage:
```bash
~/notebooks> jupyter-init.sh demo_proj
Making directory: demo_proj
Making directory: demo_proj/develop
Making directory: demo_proj/deliver
Making directory: demo_proj/figures
Making directory: demo_proj/src
Making directory: demo_proj/data
Initialized empty Git repository in /Users/blarsen/notebooks/demo_proj/.git/
adding files in demo_proj/develop to git
adding files in demo_proj/deliver to git
adding files in demo_proj/figures to git
adding files in demo_proj/src to git
adding files in demo_proj/data to git
[master (root-commit) a9846db] initial commit, jupyter-init
 8 files changed, 306 insertions(+)
 create mode 100644 .gitignore
 create mode 100644 data/README
 create mode 100644 deliver/README
 create mode 100644 deliver/template.ipynb
 create mode 100644 develop/README
 create mode 100644 develop/template.ipynb
 create mode 100644 figures/README
 create mode 100644 src/README
Finished, project demo_proj is ready to begin
(python3)blarsen@gatito ~/notebooks> tree demo_proj/
demo_proj/
├── data
│   └── README
├── deliver
│   ├── README
│   └── template.ipynb
├── develop
│   ├── README
│   └── template.ipynb
├── figures
│   └── README
└── src
    └── README

5 directories, 7 files
```


Currently does:
- Template setting for notbook look and feel (this is pretty hacky, jupyter notebook is working on this)
- initialize a new directory structure for projects per https://svds.com/jupyter-notebook-best-practices-for-data-science/
    - develop # (Lab-notebook style)
    - deliver # (final analysis, code, presentations, etc)
    - figures
    - src # (modules and scripts)
    - data (backup-separate from version control)
- initialize a git repo
- add .gitignore

Could do in the future:

- Make settings in the jupyter_notebook_config.py for saving html and py each time
    - See: https://svds.com/jupyter-notebook-best-practices-for-data-science/
- get addon packages for jupyter notebook as well
    - conda install -c conda-forge jupyter_contrib_nbextensions
        - https://github.com/ipython-contrib/jupyter_contrib_nbextensions
        - jupyter contrib nbextension install --user
        - jupyter nbextension enable codefolding/main
    - conda install -c conda-forge jupyter_nbextensions_configurator
        - jupyter nbextensions_configurator enable --user
    - https://github.com/jrjohansson/version_information.git





