FROM badouralix/curl-jq

COPY assets/check.sh /opt/resource/check
COPY assets/in.sh /opt/resource/in
COPY assets/out.sh /opt/resource/out
RUN chmod +x /opt/resource/*