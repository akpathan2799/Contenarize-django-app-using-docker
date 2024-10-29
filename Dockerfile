FROM python
WORKDIR /app
COPY . .

RUN pip install -r requirements.txt
ENTRYPOINT ["python3"]
CMD ["manage.py","runserver","0.0.0.0:8000"]


