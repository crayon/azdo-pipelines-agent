FROM ubuntu:20.04 as azp

ENV DEBIAN_FRONTEND=noninteractive
RUN \
  echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes \
  && apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    jq \
    git \
    iputils-ping \
    libcurl4 \
    libicu66 \
    libunwind8 \
    netcat \
    libssl1.0 \
    wget

ARG TARGETARCH=amd64
ARG AGENT_VERSION=2.185.1

WORKDIR /azp
RUN if [ "$TARGETARCH" = "amd64" ]; then \
      AZP_AGENTPACKAGE_URL=https://vstsagentpackage.azureedge.net/agent/${AGENT_VERSION}/vsts-agent-linux-x64-${AGENT_VERSION}.tar.gz; \
    else \
      AZP_AGENTPACKAGE_URL=https://vstsagentpackage.azureedge.net/agent/${AGENT_VERSION}/vsts-agent-linux-${TARGETARCH}-${AGENT_VERSION}.tar.gz; \
    fi; \
    curl -LsS "$AZP_AGENTPACKAGE_URL" | tar -xz

COPY --chmod=555 *.sh .

FROM ubuntu:20.04

COPY --from=azp /azp /azp

ARG KUBERNETES
ENV KUBERNETES=$KUBERNETES
ARG DOCKER
ENV DOCKER=$DOCKER

WORKDIR /azp
RUN ./dependencies.sh
ENTRYPOINT [ "./start.sh" ]