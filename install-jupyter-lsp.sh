#!/bin/bash

if [ "${CONDA_DEFAULT_ENV}" == "base" -o -z "${CONDA_DEFAULT_ENV}" ]; then
	echo "Please activate a Python virtual environment in which you install Jupyter-LSP."
	exit 1
fi

# Install the Jupyter-LSP
conda install -c conda-forge ujson=1.35 jedi=0.15.2 parso=0.5.2
pip install jupyter-lsp
conda install -c conda-forge nodejs
jupyter labextension install @krassowski/jupyterlab-lsp
conda install -c conda-forge python-language-server r-languageserver

# 
ipython kernel install --user --name=${CONDA_DEFAULT_ENV} --display-name=${CONDA_DEFAULT_ENV}
