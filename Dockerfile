######  Using Single Stage Build ##############
FROM python
WORKDIR /app
COPY . .

RUN pip install -r requirements.txt
ENTRYPOINT ["python3"]
CMD ["manage.py","runserver","0.0.0.0:8000"]


######################################################
  Using Multi Stage Build
#$#W###################################################

# FROM python AS builder
# WORKDIR /app
# COPY requirements.txt /app
# RUN pip install -r requirements.txt
# COPY . .


# FROM gcr.io/distroless/python3
# WORKDIR /app
# COPY --from=builder /app /app

# ENTRYPOINT ["python3"]
# CMD ["manage.py","runserver","0.0.0.0:3000"]

