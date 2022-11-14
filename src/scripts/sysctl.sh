swappiness=1
thp_enabled=madvise
thp_defrag=madvise

# We can have a higher tolerance for lower swappiness (thus reducing risk
# of slow major page faults) if any of the following are true:
# - processes lock their own memory region
# - each host has essentially a single workhorse process
# - processes release unused memory back to the system in reasonable time
# Otherwise, it may be wise to leave swappiness alone so that you may avoid
# oom-killer invocations
current_swappiness=$(cat /proc/sys/vm/swappiness)
echo "setting swappiness to [${swappiness}]. current value is [${current_swappiness}]."
sysctl vm.swappiness=$swappiness
echo "swappiness set to [$(cat /proc/sys/vm/swappiness)]."

# There is some ambiguity here.
# 1. https://discuss.elastic.co/t/elasticsearch-and-hugespages/82590/2
# 2. https://github.com/elastic/elasticsearch/issues/26551
current_thp_setting=$(cat /sys/kernel/mm/transparent_hugepage/enabled)
echo "setting transparent_hugepage/enabled. current value: $current_thp_setting"
echo -n "${thp_enabled}" > /sys/kernel/mm/transparent_hugepage/enabled
echo "done. transparent_hugepage/enabled now set to: $(cat /sys/kernel/mm/transparent_hugepage/enabled)"
echo "setting transparent_hugepage/defrag. current value: $(cat /sys/kernel/mm/transparent_hugepage/defrag)"
echo -n "${thp_defrag}" > /sys/kernel/mm/transparent_hugepage/defrag
echo "done. transparent_hugepage/defrag now set to: $(cat /sys/kernel/mm/transparent_hugepage/defrag)"
