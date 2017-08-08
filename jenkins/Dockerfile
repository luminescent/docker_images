FROM jenkins

USER root 

# make sure the wizard is not running as we set up the default plugins and the admin user manually 
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

# This will get executed of first startup and will create an administrator 
COPY security.groovy /usr/share/jenkins/ref/init.groovy.d/security.groovy

# Now install default plugins in Jenkins 
RUN mkdir -p /usr/share/jenkins/ref/plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins/plugins.txt
RUN /usr/local/bin/install-plugins.sh $(cat /usr/share/jenkins/ref/plugins/plugins.txt | tr '\n' ' ')


# Install .NET Core SDK 
RUN apt-get update 
RUN apt-get install -y libunwind8

RUN curl -o dotnet-sdk-2.0.0-preview2-006497-linux-x64.tar.gz https://download.microsoft.com/download/F/A/A/FAAE9280-F410-458E-8819-279C5A68EDCF/dotnet-sdk-2.0.0-preview2-006497-linux-x64.tar.gz

RUN mkdir -p /opt/dotnet
RUN tar zxf dotnet-sdk-2.0.0-preview2-006497-linux-x64.tar.gz -C /opt/dotnet
RUN ln -s /opt/dotnet/dotnet /usr/local/bin

RUN rm dotnet-sdk-2.0.0-preview2-006497-linux-x64.tar.gz


# Install Azure CLI 
RUN apt-get install -y python-dev  \
     build-essential libssl-dev libffi-dev \
     libxml2-dev libxslt1-dev zlib1g-dev \
     python-dev python-pip

# We need to run the python script directly so we can automate it; otherwise it expects user prompt 	 
RUN curl -o install.py -L https://azurecliprod.blob.core.windows.net/install.py

# build the list of default parameters
RUN echo $'/root/lib/azure-cli\n\
/root/bin\n\
Y\n\
/root/.bashrc' > default_install_params.txt

RUN printf '%b\n' "$(cat default_install_params.txt)" | python install.py

 
USER jenkins
