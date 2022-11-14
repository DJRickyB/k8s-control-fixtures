#!/bin/bash

# Running sync is not likely to be productive here but we invoke it to
# maximize what gets flushed during the drop_caches step
echo 'running sync to minimize the number of dirty objects on the system...'
/bin/sync
echo 'done'
echo

# Dropping caches gets us to as unassumed a memory state as we can
# accomplish. Given we intend to run this in a benchmark environment,
# between benchmark experiments, there should be almost nothing of
# value in the page cache anyway
echo 'memory info:'
free
echo 'dropping page cache..'
echo 3 > /proc/sys/vm/drop_caches
echo 'done. memory info:'
free
echo

#
echo 'requesting memory compaction...'
echo 1 > /proc/sys/vm/compact_memory
echo 'done'

