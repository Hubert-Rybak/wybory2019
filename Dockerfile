FROM jupyter/scipy-notebook:1386e2046833

# USER root

RUN pip install pydeck
RUN jupyter nbextension install --sys-prefix --symlink --overwrite --py pydeck
RUN jupyter nbextension enable --sys-prefix --py pydeck

RUN pip install keplergl
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager keplergl-jupyter

# USER jovyan
WORKDIR /home/jovyan/work