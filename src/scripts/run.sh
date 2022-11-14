#!/bin/bash
scripts_dir=/scripts

bash ${scripts_dir}/clear-caches.sh

bash ${scripts_dir}/prepare-disks.sh

bash ${scripts_dir}/sysctl.sh
