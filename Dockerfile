FROM badouralix/curl-jq

LABEL org.opencontainers.image.source="https://github.com/dschanoeh/concourse-file-download-resource"
LABEL org.opencontainers.image.description="A concourse resource to download arbitrary files"

COPY assets/check.sh /opt/resource/check
COPY assets/in.sh /opt/resource/in
COPY assets/out.sh /opt/resource/out
RUN chmod +x /opt/resource/*