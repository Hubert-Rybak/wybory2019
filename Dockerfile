FROM jupyter/scipy-notebook:1386e2046833

RUN pip install pydeck
RUN jupyter nbextension install --sys-prefix --symlink --overwrite --py pydeck
RUN jupyter nbextension enable --sys-prefix --py pydeck

RUN pip install keplergl
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager keplergl-jupyter

# Make sure the contents of our repo are in ${HOME}
RUN echo ${HOME}
COPY . ${HOME}

RUN fix-permissions ${HOME}

USER jovyan
WORKDIR ${HOME}