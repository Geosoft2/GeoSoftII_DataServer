#Python Version
FROM python:3.9.1

#Kopiere requirements
COPY req.txt .

#Installiere Abhänhigkeiten  für GDAL
RUN apt update && apt install -y --no-install-recommends \
        libgdal-dev \
        gcc && \
rm -rf /var/lib/apt/lists/*


#Installiere Abhängigkeiten
RUN pip install -r req.txt

#Port Oeffnen Empfehlung, beim starten noch mit -80:80 ausführen
EXPOSE 80

#Kopiere Code
COPY src/ .

#Ausführen beim Starten
CMD ["python3", "./Server.py"]