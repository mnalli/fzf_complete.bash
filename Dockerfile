# Dockerized development environment
# Build and run with: docker run --rm -it $(docker build -q .)

FROM debian:forky

# Install apt packages
RUN apt-get update && apt-get install -y \
    python3 python3-pexpect \
    fzf \
    bash-completion && \
    apt-get clean

# Add non-root user
RUN useradd -m dev

COPY --chown=dev:dev . /home/dev/.fzf_complete.bash/

USER dev

RUN echo '. ~/.fzf_complete.bash/fzf_complete.bash' >> "$HOME/.bashrc" && \
    echo bind -x \'\"\\e\\t\": fzf_complete\' >> "$HOME/.bashrc"

WORKDIR /home/dev/.fzf_complete.bash

ENTRYPOINT ["/bin/bash"]
