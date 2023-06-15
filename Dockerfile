FROM amazonlinux as build
RUN yum install -y unzip \
        && cd /tmp/ \
        && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"  \
        && unzip awscliv2.zip \
        && ./aws/install \
        && rm -rf /tmp/aws* \
        && yum remove -y unzip \
        && yum clean all \
        && cd /usr/local/bin/  \
        && curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
        && chmod +x kubectl \
        && mkdir -p ~/.aws ~/.kube 