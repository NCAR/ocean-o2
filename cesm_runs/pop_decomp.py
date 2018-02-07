#! /usr/bin/env python

nx = 320
ny = 384

task_per_node = [12,32,36]

dlist = []
ntasks_list = []
for nxblock in range(10,50):
    for nyblock in range(10,50):
        if nx%nxblock == 0 and ny%nyblock == 0:
            ntasks_list.append(nxblock*nyblock)
            dlist.append(("'NTASKS_OCN' : {ntask:d},\n"
                          "'POP_BLCKX' : {bsize_x:d},\n"
                          "'POP_BLCKY' : {bsize_y:d},\n"
                          "'POP_NX_BLOCKS' : {nxblock:d},\n"
                          "'POP_NY_BLOCKS' : {nyblock:d},\n").format(ntask=nxblock*nyblock,
                                                                     bsize_x=nx/nxblock,
                                                                     bsize_y=ny/nyblock,
                                                                     nxblock=nxblock,
                                                                     nyblock=nyblock))

ntasks_list, dlist = zip(*sorted(zip(ntasks_list,dlist)))
for ntask,decomp in zip(ntasks_list,dlist):
    if any(ntask%tpn == 0 for tpn in task_per_node):
        print(decomp)
