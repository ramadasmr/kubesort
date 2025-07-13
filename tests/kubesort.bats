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

@test "[TEST] run with args pods without sorting" {
    run kubesort pods
    [ "$status" -eq 0 ]
    [[ "$output" == *"WARNING: No sort option provided, Default is --byname"* ]]
}

@test "[TEST] run with args pods --byname" {
    run kubesort pods --byname
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get pods  --sort-by=.metadata.name"* ]]
}

@test "[TEST] run with args pods --bytime" {
    run kubesort pods --bytime
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get pods  --sort-by=.metadata.creationTimestamp"* ]]
}

@test "[TEST] run with args pods --byage" {
    run kubesort pods --byage
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get pods  --sort-by=.metadata.creationTimestamp"* ]]
}

@test "[TEST] run with args pods --bymemory" {
    run kubesort pods --bymemory
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get pods  --sort-by=.spec.containers[0].resources.limits.memory"* ]]
}

@test "[TEST] run with args pods --bycpu" {
    run kubesort pods --bycpu
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get pods  --sort-by=.spec.containers[0].resources.limits.cpu"* ]]
}

@test "[TEST] run with args pods --bystatus" {
    run kubesort pods --bystatus
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get pods  --sort-by=.status.phase"* ]]
}

@test "[TEST] run with args pods --byrestart" {
    run kubesort pods --byrestart
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get pods  --sort-by=.status.containerStatuses[0].restartCount"* ]]
}

@test "[TEST] run with args pods --bysize" {
    run kubesort pods --bysize
    [ "$status" -eq 2 ]
    [[ "$output" == *"ERROR: --bysize option is not supported for object pods"* ]]
}

#
# kubesort nodes test cases
#


@test "[TEST] run with args nodes without sorting" {
    run kubesort nodes
    [ "$status" -eq 0 ]
    [[ "$output" == *"WARNING: No sort option provided, Default is --byname"* ]]
}

@test "[TEST] run with args nodes --byname" {
    run kubesort nodes --byname
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get nodes  --sort-by=.metadata.name"* ]]
}

@test "[TEST] run with args nodes --bytime" {
    run kubesort nodes --bytime
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get nodes  --sort-by=.metadata.creationTimestamp"* ]]
}

@test "[TEST] run with args nodes --byage" {
    run kubesort nodes --byage
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get nodes  --sort-by=.metadata.creationTimestamp"* ]]
}

@test "[TEST] run with args nodes --bymemory" {
    run kubesort nodes --bymemory
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get nodes  --sort-by=.status.capacity.memory"* ]]
}

@test "[TEST] run with args nodes --bycpu" {
    run kubesort nodes --bycpu
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get nodes  --sort-by=.status.capacity.cpu"* ]]
}

@test "[TEST] run with args nodes --bysize" {
    run kubesort nodes --bysize
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get nodes  --sort-by=.status.capacity.ephemeral-storage"* ]]
}

@test "[TEST] run with args nodes --bystatus" {
    run kubesort nodes --bystatus
    [ "$status" -eq 2 ]
    [[ "$output" == *"ERROR: --bystatus option is not supported for object nodes"* ]]
}

@test "[TEST] run with args nodes --byrestart" {
    run kubesort nodes --byrestart
    [ "$status" -eq 2 ]
    [[ "$output" == *"ERROR: --byrestart option is not supported for object nodes"* ]]
}


#
# kubesort services test cases
#


@test "[TEST] run with args services without sorting" {
    run kubesort services
    [ "$status" -eq 0 ]
    [[ "$output" == *"WARNING: No sort option provided, Default is --byname"* ]]
}

@test "[TEST] run with args services --byname" {
    run kubesort services --byname
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get services  --sort-by=.metadata.name"* ]]
}

@test "[TEST] run with args services --bytime" {
    run kubesort services --bytime
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get services  --sort-by=.metadata.creationTimestamp"* ]]
}

@test "[TEST] run with args services --byage" {
    run kubesort services --byage
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get services  --sort-by=.metadata.creationTimestamp"* ]]
}

@test "[TEST] run with args services --bysize" {
    run kubesort services --bysize
    [ "$status" -eq 2 ]
    [[ "$output" == *"ERROR: --bysize option is not supported for object services"* ]]
}

@test "[TEST] run with args services --bystatus" {
    run kubesort services --bystatus
    [ "$status" -eq 2 ]
    [[ "$output" == *"ERROR: --bystatus option is not supported for object services"* ]]
}

@test "[TEST] run with args services --bycpu" {
    run kubesort services --bycpu
    [ "$status" -eq 2 ]
    [[ "$output" == *"ERROR: --bycpu option is not supported for object services"* ]]
}

@test "[TEST] run with args services --bymemory" {
    run kubesort services --bymemory
    [ "$status" -eq 2 ]
    [[ "$output" == *"ERROR: --bymemory option is not supported for object services"* ]]
}

@test "[TEST] run with args services --byrestart" {
    run kubesort services --byrestart
    [ "$status" -eq 2 ]
    [[ "$output" == *"ERROR: --byrestart option is not supported for object services"* ]]
}



#
# kubesort pv test cases
#


@test "[TEST] run with args pv without sorting" {
    run kubesort pv
    [ "$status" -eq 0 ]
    [[ "$output" == *"WARNING: No sort option provided, Default is --byname"* ]]
}

@test "[TEST] run with args pv --byname" {
    run kubesort pv --byname
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get pv  --sort-by=.metadata.name"* ]]
}

@test "[TEST] run with args pv --bytime" {
    run kubesort pv --bytime
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get pv  --sort-by=.metadata.creationTimestamp"* ]]
}

@test "[TEST] run with args pv --byage" {
    run kubesort pv --byage
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get pv  --sort-by=.metadata.creationTimestamp"* ]]
}

@test "[TEST] run with args pv --bysize" {
    run kubesort pv --bysize
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get pv  --sort-by=.spec.capacity.storage"* ]]
}

@test "[TEST] run with args pv --bystatus" {
    run kubesort pv --bystatus
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get pv  --sort-by=.status.phase"* ]]
}

@test "[TEST] run with args pv --bycpu" {
    run kubesort pv --bycpu
    [ "$status" -eq 2 ]
    [[ "$output" == *"ERROR: --bycpu option is not supported for object pv"* ]]
}

@test "[TEST] run with args pv --bymemory" {
    run kubesort pv --bymemory
    [ "$status" -eq 2 ]
    [[ "$output" == *"ERROR: --bymemory option is not supported for object pv"* ]]
}

@test "[TEST] run with args pv --byrestart" {
    run kubesort pv --byrestart
    [ "$status" -eq 2 ]
    [[ "$output" == *"ERROR: --byrestart option is not supported for object pv"* ]]
}


#
# kubesort events test cases
#


@test "[TEST] run with args events without sorting" {
    run kubesort events
    [ "$status" -eq 0 ]
    [[ "$output" == *"WARNING: No sort option provided, Default is --byname"* ]]
}

@test "[TEST] run with args events --byname" {
    run kubesort events --byname
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get events  --sort-by=.metadata.name"* ]]
}

@test "[TEST] run with args events --bytime" {
    run kubesort events --bytime
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get events  --sort-by=.metadata.creationTimestamp"* ]]
}

@test "[TEST] run with args events --byage" {
    run kubesort events --byage
    [ "$status" -eq 0 ]
    [[ "$output" == *"Executing: kubectl  get events  --sort-by=.metadata.creationTimestamp"* ]]
}

@test "[TEST] run with args events --bysize" {
    run kubesort events --bysize
    [ "$status" -eq 2 ]
    [[ "$output" == *"ERROR: --bysize option is not supported for object events"* ]]
}

@test "[TEST] run with args events --bystatus" {
    run kubesort events --bystatus
    [ "$status" -eq 2 ]
    [[ "$output" == *"ERROR: --bystatus option is not supported for object events"* ]]
}

@test "[TEST] run with args events --bycpu" {
    run kubesort events --bycpu
    [ "$status" -eq 2 ]
    [[ "$output" == *"ERROR: --bycpu option is not supported for object events"* ]]
}

@test "[TEST] run with args events --bymemory" {
    run kubesort events --bymemory
    [ "$status" -eq 2 ]
    [[ "$output" == *"ERROR: --bymemory option is not supported for object events"* ]]
}

@test "[TEST] run with args events --byrestart" {
    run kubesort events --byrestart
    [ "$status" -eq 2 ]
    [[ "$output" == *"ERROR: --byrestart option is not supported for object events"* ]]
}
