# vim:set ft=dockerfile:
FROM nginx:latest

# Add the entrypoint
COPY entrypoint.sh /entrypoint.sh

# Run entrypoint
ENTRYPOINT [ "/entrypoint.sh" ]
