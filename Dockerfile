FROM python:2
COPY entrypoint.sh /app/entrypoint.sh
RUN ["chmod", "+x", "/app/entrypoint.sh"]
ENTRYPOINT ["sh", "/app/entrypoint.sh"]
