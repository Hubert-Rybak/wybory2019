FROM jupyter/scipy-notebook:1386e2046833

RUN pip install pydeck
RUN jupyter nbextension install --sys-prefix --symlink --overwrite --py pydeck
RUN jupyter nbextension enable --sys-prefix --py pydeck

RUN pip install keplergl
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager keplergl-jupyter

# Make sure the contents of our repo are in ${HOME}
COPY Gminy_Geo.json ${HOME}
COPY wyniki_gl_na_listy_po_gminach_sejm.csv ${HOME}
COPY Wybory2019.ipynb ${HOME}

USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}

USER jovyan
WORKDIR /home/jovyan/work