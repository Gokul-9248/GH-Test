
# Use a minimal Ubuntu base image
FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Update and install required dependencies for Posit Workbench
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    gdebi-core \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Download and install Posit Workbench
RUN wget --no-check-certificate https://download2.rstudio.org/server/rhel8/x86_64/rstudio-server-rhel-2024.09.0-375-x86_64.rpm  

# Create a working directory
WORKDIR /home/rstudio

# Expose Posit Workbench port
EXPOSE 8787

# Set the entrypoint for Posit Workbench
CMD ["/usr/lib/rstudio-server/bin/rserver"]
