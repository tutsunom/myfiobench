#!/bin/bash

./rr.sh nvme0n1 none 32KB
./rw.sh nvme0n1 none 32KB
./rrw.sh nvme0n1 none 32KB

./rr.sh sdf deadline 4KB
./rw.sh sdf deadline 4KB
./rr.sh sdf deadline 32KB
./rw.sh sdf deadline 32KB
./rrw.sh sdf deadline 32KB
./rr.sh sdf noop 32KB
./rw.sh sdf noop 32KB
./rrw.sh sdf noop 32KB

./rr.sh sdb deadline 32KB
./rw.sh sdb deadline 32KB
./rrw.sh sdb deadline 32KB

