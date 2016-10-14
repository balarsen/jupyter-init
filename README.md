# jupyter-init
Initialization scripts for Jupyter notebooks

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
- Template setting for notbook look and feel
- initialize a new directory structure for projects per https://svds.com/jupyter-notebook-best-practices-for-data-science/
    - develop # (Lab-notebook style)
    - deliver # (final analysis, code, presentations, etc)
    - figures
    - src # (modules and scripts)
    - data (backup-separate from version control)
- Make a way to start new notebooks with content
- initialize a git repo
- add .gitignore



