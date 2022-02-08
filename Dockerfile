FROM jupyter/scipy-notebook:lab-3.0.16

USER root
USER $NB_UID

COPY requirements.txt /tmp/
RUN conda install --quiet --yes --file /tmp/requirements.txt && \
    conda clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

EXPOSE 8888