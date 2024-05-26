# cargamos python 
FROM python:3.8

# descargamos nano
RUN apt-get update && \
    apt-get install -y nano

# fijamos ansible como directorio de trabajo
WORKDIR /ansible

# copiamos todos los archivos de la carpeta playbooks y el ejecutable de python
COPY playbooks/ /ansible/playbooks/
COPY mensaje.py /ansible/


# instalamos ansible
RUN pip install ansible

# ejecutamos los playbooks
CMD ansible-playbook playbooks/nanopython.yaml && \
    ansible-playbook playbooks/entornovirtual.yml && \
    ansible-playbook playbooks/mensaje.yml
