#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/ga38qoh/EDA_Munish/SDSlabWork/work_dir/GettingStartedHLS/fir_prj/solution1/.autopilot/db/a.g.bc ${1+"$@"}
