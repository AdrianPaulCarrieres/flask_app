FROM python:latest

# Créer un user pour ne pas run en root
RUN useradd flask

WORKDIR /home/flask

#Ajouter tout le contexte sauf le contenu de .dockerignore
ADD . .

# Installer les déps python, pas besoin de venv car docker
RUN pip install -r requirements.txt
RUN chmod a+x app.py test.py && \
    chown -R flask:flask ./

# Déclarer la config de l'app
ENV FLASK_APP app.py

EXPOSE 3000
# Changer d'user pour lancer l'app
USER flask

CMD ["python","./app.py"]