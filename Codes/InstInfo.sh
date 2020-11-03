#!/bin/bash
echo "The instance id is:"
wget -q -O - http://169.254.169.254/latest/meta-data/instance-id
echo "\n The availability zone is:"
wget -q -O - http://169.254.169.254/latest/meta-data/placement/availability-zone
