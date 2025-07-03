FROM python:3.13-alpine3.22 AS builder

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN apk add --no-cache git build-base linux-headers

RUN pip install setuptools build
RUN git clone https://github.com/RPi-Distro/RTIMULib \
    && cd RTIMULib/Linux/python/ \
    && python3 -m build --wheel --no-isolation --outdir /app/wheels \
    && pip wheel --no-cache-dir --no-deps --wheel-dir /app/wheels sense-hat



FROM python:3.13-alpine3.22

RUN apk add --no-cache libstdc++

WORKDIR /app

COPY --from=builder /app/wheels /wheels
RUN ls -al /wheels
RUN pip install --no-cache /wheels/*

COPY test.py test.py
ENTRYPOINT [ "python3", "test.py" ]
