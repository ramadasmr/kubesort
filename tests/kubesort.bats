setup() {
  DIR="$(dirname $( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd ))"
  PATH="$PATH:$DIR"
}

@test "[TEST] can run the script" {
    run kubesort
}

@test "[TEST] prints help message with -h" {
    run kubesort -h
    [ "$status" -eq 0 ]
    [[ "$output" == *"Usage:"* ]]
}

@test "[TEST] fails with invalid arg" {
    run kubesort --invalid
    [ "$status" -ne 0 ]
    [[ "$output" == *"Invalid option:"* ]]
}



#
# kubesort pods test cases
#

@test "[TEST] dry run with args pods without sorting" {
    run kubesort pods --dry
    [ "$status" -eq 0 ]
    [[ "$output" == *"WARNING: No sort option provided, Default is --byname"* ]]
}

@test "[TEST] dry run with args pods --byname" {
    run kubesort pods --byname --dry
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get pods  --sort-by=.metadata.name"* ]]
}

@test "[TEST] dry run with args pods --bytime" {
    run kubesort pods --bytime --dry
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get pods  --sort-by=.metadata.creationTimestamp"* ]]
}

@test "[TEST] dry run with args pods --byage" {
    run kubesort pods --byage --dry
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get pods  --sort-by=.metadata.creationTimestamp"* ]]
}

@test "[TEST] dry run with args pods --bymemory" {
    run kubesort pods --bymemory --dry
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get pods  --sort-by=.spec.containers[0].resources.limits.memory"* ]]
}

@test "[TEST] dry run with args pods --bycpu" {
    run kubesort pods --bycpu --dry
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get pods  --sort-by=.spec.containers[0].resources.limits.cpu"* ]]
}

@test "[TEST] dry run with args pods --bystatus" {
    run kubesort pods --bystatus --dry
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get pods  --sort-by=.status.phase"* ]]
}

@test "[TEST] dry run with args pods --byrestart" {
    run kubesort pods --byrestart --dry
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get pods  --sort-by=.status.containerStatuses[0].restartCount"* ]]
}

@test "[TEST] dry run with args pods --bysize" {
    run kubesort pods --bysize --dry
    [ "$status" -eq 2 ]
    [[ "$output" == *"ERROR: --bysize option is not supported for object pods"* ]]
}

#
# kubesort nodes test cases
#


@test "[TEST] dry run with args nodes without sorting" {
    run kubesort nodes --dry
    [ "$status" -eq 0 ]
    [[ "$output" == *"WARNING: No sort option provided, Default is --byname"* ]]
}

@test "[TEST] dry run with args nodes --byname" {
    run kubesort nodes --byname --dry
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get nodes  --sort-by=.metadata.name"* ]]
}

@test "[TEST] dry run with args nodes --bytime" {
    run kubesort nodes --bytime --dry
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get nodes  --sort-by=.metadata.creationTimestamp"* ]]
}

@test "[TEST] dry run with args nodes --byage" {
    run kubesort nodes --byage --dry
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get nodes  --sort-by=.metadata.creationTimestamp"* ]]
}

@test "[TEST] dry run with args nodes --bymemory" {
    run kubesort nodes --bymemory --dry
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get nodes  --sort-by=.status.capacity.memory"* ]]
}

@test "[TEST] dry run with args nodes --bycpu" {
    run kubesort nodes --bycpu --dry
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get nodes  --sort-by=.status.capacity.cpu"* ]]
}

@test "[TEST] dry run with args nodes --bysize" {
    run kubesort nodes --bysize --dry
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get nodes  --sort-by=.status.capacity.ephemeral-storage"* ]]
}

@test "[TEST] dry run with args nodes --bystatus" {
    run kubesort nodes --bystatus --dry
    [ "$status" -eq 2 ]
    [[ "$output" == *"ERROR: --bystatus option is not supported for object nodes"* ]]
}

@test "[TEST] dry run with args nodes --byrestart" {
    run kubesort nodes --byrestart --dry
    [ "$status" -eq 2 ]
    [[ "$output" == *"ERROR: --byrestart option is not supported for object nodes"* ]]
}


#
# kubesort services test cases
#


@test "[TEST] dry run with args services without sorting" {
    run kubesort services --dry
    [ "$status" -eq 0 ]
    [[ "$output" == *"WARNING: No sort option provided, Default is --byname"* ]]
}

@test "[TEST] dry run with args services --byname" {
    run kubesort services --byname --dry
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get services  --sort-by=.metadata.name"* ]]
}

@test "[TEST] dry run with args services --bytime" {
    run kubesort services --bytime --dry
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get services  --sort-by=.metadata.creationTimestamp"* ]]
}

@test "[TEST] dry run with args services --byage" {
    run kubesort services --byage --dry
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get services  --sort-by=.metadata.creationTimestamp"* ]]
}

@test "[TEST] dry run with args services --bysize" {
    run kubesort services --bysize --dry
    [ "$status" -eq 2 ]
    [[ "$output" == *"ERROR: --bysize option is not supported for object services"* ]]
}

@test "[TEST] dry run with args services --bystatus" {
    run kubesort services --bystatus --dry
    [ "$status" -eq 2 ]
    [[ "$output" == *"ERROR: --bystatus option is not supported for object services"* ]]
}

@test "[TEST] dry run with args services --bycpu" {
    run kubesort services --bycpu --dry
    [ "$status" -eq 2 ]
    [[ "$output" == *"ERROR: --bycpu option is not supported for object services"* ]]
}

@test "[TEST] dry run with args services --bymemory" {
    run kubesort services --bymemory --dry
    [ "$status" -eq 2 ]
    [[ "$output" == *"ERROR: --bymemory option is not supported for object services"* ]]
}

@test "[TEST] dry run with args services --byrestart" {
    run kubesort services --byrestart --dry
    [ "$status" -eq 2 ]
    [[ "$output" == *"ERROR: --byrestart option is not supported for object services"* ]]
}



#
# kubesort pv test cases
#


@test "[TEST] dry run with args pv without sorting" {
    run kubesort pv --dry
    [ "$status" -eq 0 ]
    [[ "$output" == *"WARNING: No sort option provided, Default is --byname"* ]]
}

@test "[TEST] dry run with args pv --byname" {
    run kubesort pv --byname --dry
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get pv  --sort-by=.metadata.name"* ]]
}

@test "[TEST] dry run with args pv --bytime" {
    run kubesort pv --bytime --dry
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get pv  --sort-by=.metadata.creationTimestamp"* ]]
}

@test "[TEST] dry run with args pv --byage" {
    run kubesort pv --byage --dry
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get pv  --sort-by=.metadata.creationTimestamp"* ]]
}

@test "[TEST] dry run with args pv --bysize" {
    run kubesort pv --bysize --dry
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get pv  --sort-by=.spec.capacity.storage"* ]]
}

@test "[TEST] dry run with args pv --bystatus" {
    run kubesort pv --bystatus --dry
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get pv  --sort-by=.status.phase"* ]]
}

@test "[TEST] dry run with args pv --bycpu" {
    run kubesort pv --bycpu --dry
    [ "$status" -eq 2 ]
    [[ "$output" == *"ERROR: --bycpu option is not supported for object pv"* ]]
}

@test "[TEST] dry run with args pv --bymemory" {
    run kubesort pv --bymemory --dry
    [ "$status" -eq 2 ]
    [[ "$output" == *"ERROR: --bymemory option is not supported for object pv"* ]]
}

@test "[TEST] dry run with args pv --byrestart" {
    run kubesort pv --byrestart --dry
    [ "$status" -eq 2 ]
    [[ "$output" == *"ERROR: --byrestart option is not supported for object pv"* ]]
}


#
# kubesort events test cases
#


@test "[TEST] dry run with args events without sorting" {
    run kubesort events --dry
    [ "$status" -eq 0 ]
    [[ "$output" == *"WARNING: No sort option provided, Default is --byname"* ]]
}

@test "[TEST] dry run with args events --byname" {
    run kubesort events --byname --dry
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get events  --sort-by=.metadata.name"* ]]
}

@test "[TEST] dry run with args events --bytime" {
    run kubesort events --bytime --dry
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get events  --sort-by=.metadata.creationTimestamp"* ]]
}

@test "[TEST] dry run with args events --byage" {
    run kubesort events --byage --dry
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get events  --sort-by=.metadata.creationTimestamp"* ]]
}

@test "[TEST] dry run with args events --bysize" {
    run kubesort events --bysize --dry
    [ "$status" -eq 2 ]
    [[ "$output" == *"ERROR: --bysize option is not supported for object events"* ]]
}

@test "[TEST] dry run with args events --bystatus" {
    run kubesort events --bystatus --dry
    [ "$status" -eq 2 ]
    [[ "$output" == *"ERROR: --bystatus option is not supported for object events"* ]]
}

@test "[TEST] dry run with args events --bycpu" {
    run kubesort events --bycpu --dry
    [ "$status" -eq 2 ]
    [[ "$output" == *"ERROR: --bycpu option is not supported for object events"* ]]
}

@test "[TEST] dry run with args events --bymemory" {
    run kubesort events --bymemory --dry
    [ "$status" -eq 2 ]
    [[ "$output" == *"ERROR: --bymemory option is not supported for object events"* ]]
}

@test "[TEST] dry run with args events --byrestart" {
    run kubesort events --byrestart --dry
    [ "$status" -eq 2 ]
    [[ "$output" == *"ERROR: --byrestart option is not supported for object events"* ]]
}
