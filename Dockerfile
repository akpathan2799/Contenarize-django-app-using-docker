# ######  Using Single Stage Build ##############
# FROM python
# WORKDIR /app
# COPY . .

# RUN pip install -r requirements.txt
# ENTRYPOINT ["python3"]
# CMD ["manage.py","runserver","0.0.0.0:8000"]


######################################################
  #Using Multi Stage Build
#$#W###################################################

FROM python AS builder
WORKDIR /app
COPY requirements.txt /app
RUN pip install -r requirements.txt
COPY . .

FROM python:3.9-slim

WORKDIR /app
COPY --from=backend-builder /usr/local/lib/python3.9/site-packages/ /usr/local/lib/python3.9/site-packages/

COPY --from=builder /app /app

ENTRYPOINT ["python3"]
CMD ["manage.py","runserver","0.0.0.0:3000"]

