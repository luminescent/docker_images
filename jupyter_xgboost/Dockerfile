FROM jupyter/notebook

RUN apt-get update && apt-get install -y wget git 
RUN apt-get install -y libatlas-base-dev
RUN apt-get install -y gfortran

RUN pip3 install xgboost
RUN pip3 install sklearn




