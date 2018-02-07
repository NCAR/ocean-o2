#! /usr/bin/env python
import os
from subprocess import call

SCRATCH = '/glade/scratch/'+os.environ['USER']

#--------------------------------------------------------
#--- class
#--------------------------------------------------------
class defcase(object):
    def __init__(self,compref,compset,res,note,ens,
                 croot):
        self.name = '.'.join([compref,compset,res,note,'%03d'%ens])
        self.path = {'root'    : '/'.join([croot,self.name]),
                     'exe'     : '/'.join([SCRATCH,self.name]),
                     'dout_s'  : '/'.join([SCRATCH,'archive',self.name]),
                     'dout_sl' : '/'.join([SCRATCH,'archive.locked',self.name])}


#--------------------------------------------------------
#--- function
#--------------------------------------------------------
def xmlchange(xmlsetting,file_name=''):
    print
    for var,val in xmlsetting.items():
        if type(val) == bool:
            val = str(val).upper()
        elif any([type(val) == tp for tp in [float,int]]):
            val = str(val)

        if file_name:
            cmd = ['./xmlchange','-file',file_name,'-id',var,'-val',val]
        else:
            cmd = ['./xmlchange',var+'='+val]

        print ' '.join(cmd)
        stat = call(cmd)
        if stat != 0: exit(1)
    print

#--------------------------------------------------------
#--- function
#--------------------------------------------------------
def user_nl_append(user_nl):
    for mdl,nml in user_nl.items():
        print 'writing to: '+'user_nl_'+mdl
        fid = open('user_nl_'+mdl,'a')
        for l in nml:
            print l
            fid.write('%s\n'%l)
        fid.close()
        print


if __name__ == '__main__':
    make_chem_mech_20C(flbc = {'IDL_S000':'O2','IDL_S001':'O2'},
                       flbc_ext = {'IDL_T000':'O2'},
                       srf_emis = {'CO2_TAK':'CO2',
                                   'CO2_LGB':'CO2'})
