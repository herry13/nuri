#!/bin/bash

yum update -y
yum install python-pip git -y

pip install tornado pyyaml

cd /opt
git clone https://github.com/herry13/nuri-agent-python
cd nuri-agent-python
./bin/nuri-agent -s
