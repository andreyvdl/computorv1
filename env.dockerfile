FROM alpine:3.22.0

ENV LANG=C.UTF-8 \
	LC_ALL=C.UTF-8

RUN apk update && apk add --no-cache \
	bash \
	ruby \
	&& rm -rf /var/cache/apk/*

COPY ./ /app

# EXPOSE 8080

CMD ["bash"]
