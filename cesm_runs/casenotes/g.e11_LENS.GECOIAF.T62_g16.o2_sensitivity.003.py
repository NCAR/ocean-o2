#! /usr/bin/env python
import os
from subprocess import call
from glob import glob

from cesm_case_tools import defcase,xmlchange,user_nl_append,make_chem_mech_20C

#----------------------------------------------------------------------
#--- paths
#----------------------------------------------------------------------

account = 'UGIT0016'
tag = 'cesm1_1_2_LENS_n08'
coderoot = os.path.join('/glade/p/cgd/oce/people/mclong/cesm/svn_co',tag)

scriptroot = os.getcwd()
inputdata='/glade/p/cesmdata/cseg/inputdata'

caserootroot = os.path.join('/glade/p/work',os.environ['USER'],
                            'cesm/cases/',tag)
if not os.path.exists(caserootroot):
    call(['mkdir','-p',caserootroot])

#----------------------------------------------------------------------
#---- source
#----------------------------------------------------------------------

mach = 'cheyenne'
compref = 'g.e11_LENS'
compset = 'GECOIAF'
res = 'T62_g16'
ens = 3

#-- dust perturbation?
note = 'o2_sensitivity'

run_refdate = '0281-01-01'
run_refcase = 'g.e11_LENS.GECOIAF.T62_g16.009'
refcase_root= os.path.join('/glade/p/cesm/bgcwg_dev/hpss-mirror',
                           run_refcase,'rest',run_refdate+'-00000')

#----------------------------------------------------------------------
#--- make the case name
#----------------------------------------------------------------------

case = defcase(compref=compref,compset=compset,res=res,note=note,ens=ens,
               croot=caserootroot)

#----------------------------------------------------------------------
#--- record the state of this script
#----------------------------------------------------------------------

casenotes = os.path.join(scriptroot,'casenotes',case.name+'.py')
if not os.path.exists(os.path.join(scriptroot,'casenotes')):
    call(['mkdir','-p',os.path.join(scriptroot,'casenotes')])

if os.path.exists(casenotes):
    raise Exception('Case exists: {}'.format(casenotes))

call(['cp','-v',__file__,casenotes])

#----------------------------------------------------------------------
#--- create case
#----------------------------------------------------------------------

for key,pth in case.path.items():
    call(['rm','-fvr',pth])

cmd = ['/'.join([coderoot,'scripts','create_newcase']),
       '-res',     res,
       '-mach',    mach,
       '-compset', 'GIAF',
       '-case',    case.path['root']]

stat = call(cmd)
if stat != 0: exit(1)

os.chdir(case.path['root'])

xmlchange({'RUN_TYPE' : 'branch',
           'RUN_STARTDATE' : run_refdate,
           'RUN_REFCASE' : run_refcase,
           'RUN_REFDATE' : run_refdate})

#----------------------------------------------------------------------
#--- copy restarts
#----------------------------------------------------------------------

rundir = os.path.join(case.path['exe'],'run')

call(['mkdir','-p',rundir])
call(' '.join(['cp','-v',refcase_root+'/*',rundir]),shell=True)

xmlchange({'PIO_TYPENAME':'pnetcdf'})

xmlchange({'CICE_NAMELIST_OPTS' : '"cam5=.true."'},
          file_name = 'env_run.xml')

xmlchange({'OCN_TRACER_MODULES' : 'iage ecosys cfc'})

xmlchange({
        'NTASKS_LND' :   1,'NTHRDS_LND' : 2,'ROOTPE_LND' : 0,
        'NTASKS_GLC' :   1,'NTHRDS_GLC' : 2,'ROOTPE_GLC' : 0,
        'NTASKS_ATM' :  15,'NTHRDS_ATM' : 2,'ROOTPE_ATM' : 0,
        'NTASKS_ROF' :  15,'NTHRDS_ROF' : 2,'ROOTPE_ROF' : 0,
        'NTASKS_ICE' :  90,'NTHRDS_ICE' : 2,'ROOTPE_ICE' : 15,
        'NTASKS_CPL' :  90,'NTHRDS_CPL' : 2,'ROOTPE_CPL' : 15,
        'NTASKS_OCN' : 480,'NTHRDS_OCN' : 1,'ROOTPE_OCN' : 105})

#------------------------------------------------------------------
#--- configure
#----------------------------------------------------------------------

call(['cesm_setup'])

#------------------------------------------------------------------
#--- data streams
#----------------------------------------------------------------------

for f in ['datm.streams.txt.noaa20CRv2.U_10',
          'datm.streams.txt.noaa20CRv2.V_10',
          'datm.streams.txt.noaa20CRv2.WS10']:
    call(['cp','-pv',os.path.join(scriptroot,'yeager_20CR_mods/user_stream_files',f),'.'])
    call(['cp','-pv',os.path.join(scriptroot,'yeager_20CR_mods/user_stream_files',f),'CaseDocs'])
    call(['cp','-pv',os.path.join(scriptroot,'yeager_20CR_mods/user_stream_files',f),rundir])

for f in ['user_datm.streams.txt.CORE2_IAF.GCGCS.PREC',
          'user_datm.streams.txt.CORE2_IAF.GISS.LWDN',
          'user_datm.streams.txt.CORE2_IAF.GISS.SWDN',
          'user_datm.streams.txt.CORE2_IAF.GISS.SWUP',
          'user_datm.streams.txt.CORE2_IAF.NCEP.DN10',
          'user_datm.streams.txt.CORE2_IAF.NCEP.Q_10',
          'user_datm.streams.txt.CORE2_IAF.NCEP.SLP_',
          'user_datm.streams.txt.CORE2_IAF.NCEP.T_10']:
    call(['cp','-pv',os.path.join(scriptroot,'yeager_20CR_mods/user_stream_files',f),'.'])

call(['ln','-s','datm.streams.txt.noaa20CRv2.U_10','user_datm.streams.txt.CORE2_IAF.NCEP.U_10'])
call(['ln','-s','datm.streams.txt.noaa20CRv2.V_10','user_datm.streams.txt.CORE2_IAF.NCEP.V_10'])

co2_start_year = 151
co2_start_yyyy = '%04d'%co2_start_year
co2_start_year_m1 = co2_start_year - 1

user_nl_append(
    {'datm':
         ['dtlimit = 1.5,1.5,1.5,1.5,1.5,1.5,1.5,1.5,1.5,1.5,1.5,1.e30,1.5,1.5',
          'streams = '+
          '"datm.streams.txt.CORE2_IAF.GCGCS.PREC 1 1948 2009",' +
          '"datm.streams.txt.CORE2_IAF.GISS.LWDN 1 1948 2009",' +
          '"datm.streams.txt.CORE2_IAF.GISS.SWDN 1 1948 2009",' +
          '"datm.streams.txt.CORE2_IAF.GISS.SWUP 1 1948 2009",' +
          '"datm.streams.txt.CORE2_IAF.NCEP.DN10 1 1948 2009",' +
          '"datm.streams.txt.CORE2_IAF.NCEP.Q_10 1 1948 2009",' +
          '"datm.streams.txt.CORE2_IAF.NCEP.SLP_ 1 1948 2009",' +
          '"datm.streams.txt.CORE2_IAF.NCEP.T_10 1 1948 2009",' +
          '"datm.streams.txt.CORE2_IAF.NCEP.U_10 1 1948 2009",' +
          '"datm.streams.txt.CORE2_IAF.NCEP.V_10 1 1948 2009",' +
          '"datm.streams.txt.noaa20CRv2.WS10    1 1948 2009", ' +
          '"datm.streams.txt.CORE2_IAF.CORE2.ArcFactor 1 1948 2009",' +
          '"datm.streams.txt.presaero.clim_2000 1 1 1,"' +
          '"co2_streams_cam_compat.txt '+str(co2_start_year_m1)+' 1849 2010"',
          "tintalgo = "+
          "'linear','linear','coszen', 'linear', 'linear','linear','linear'," +
          "'linear','linear','linear','linear','linear','linear','linear'",
          "mapmask = "+
          "'nomask','nomask','nomask','nomask','nomask','nomask','nomask',"+
          "'nomask', 'nomask', 'nomask', 'nomask','nomask', 'nomask','nomask'",
          "mapalgo = "+
          "'bilinear','bilinear','bilinear','bilinear','bilinear','bilinear','bilinear',"+
          "'bilinear','bilinear','bilinear','bilinear','bilinear','bilinear','nn'"],
     'cpl':
         ["cplflds_custom = 'Sa_co2diag->a2x', 'Sa_co2diag->x2o'"],
     'pop2':["ndep_shr_stream_year_align = "+str(co2_start_year_m1),
             "ndep_shr_stream_year_first = 1849"]})

xmlchange({'OCN_TRANSIENT':'1850-2000',
           'CCSM_CO2_PPMV':284.7,
           'OCN_CO2_TYPE':'diagnostic'})

call(['cp','-v',os.path.join(scriptroot,'IAF_mods','co2_streams_cam_compat.txt'),'CaseDocs'])
call(['cp','-v',os.path.join(scriptroot,'IAF_mods','co2_streams_cam_compat.txt'),rundir])

for comp in ['datm','pop2','cice','share','drv']:
    call(' '.join(['cp','-v',os.path.join(scriptroot,'yeager_20CR_mods/SourceMods/src.'+comp+'/*'),
                   'SourceMods/src.'+comp]),shell=True)


call(['cp','-v',
      os.path.join(scriptroot,'graze_rate_mods','%03d.ecosys_parms.F90'%ens),
      'SourceMods/src.pop2/ecosys_parms.F90'])


#----------------------------------------------------------------------
#--- build
#----------------------------------------------------------------------

stat = call(['preview_namelists'])
if stat != 0: exit()
exit()
for rep in ['s/BSUB -W.*/BSUB -W 12:00/',
            's/BSUB -q.*/BSUB -q regular/',
            's/BSUB -P.*/BSUB -P '+account+'/']:
    call(['sed','-i',rep,case.name+'.run'])

xmlchange({'STOP_N' : 5,
           'STOP_OPTION' : 'nyear',
           'RESUBMIT' : 0})

call([case.name+'.build'])

call([case.name+'.submit'])
