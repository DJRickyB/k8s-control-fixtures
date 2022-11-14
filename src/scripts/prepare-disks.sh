#!/bin/bash

# SSDs should be trimmed prior to benchmarking to control results. see https://www.elastic.co/blog/is-your-elasticsearch-trimmed
command='/sbin/fstrim -v'
# TODO requires target(s)
for target in "TODO"; do
  echo "attempting [$command] on [$target]";
#  exec "$command $target";
done
echo 'done'

#
command='blockdev --setra 4096'
# TODO requires target(s)
for target in "TODO"; do
  echo "attempting [$command] on [$target]";
#  exec "$command $target";
done
echo 'done'
