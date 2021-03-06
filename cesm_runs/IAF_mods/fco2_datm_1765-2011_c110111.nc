CDF   �   
      time       lat       lon       nv              comment      2 September 2010: Prepared by B. Eaton using data provided by Andrew Gettelman      
All variables except f11 are directly from PRE2009_MIDYR_CONC_ag.DAT                   
The f11 gaseous constituent used by CAM is CFC-11 adjusted to account for a         
collection of radiatively active species.  The following list gives the name        
of each specie along with its column in the file PRE2009_MIDYR_CONC_ag.DAT, and        
the radiative efficiency factors used to compute the cfc-11 equivalent concentration
which is summed over the collection to get the F11 adjusted value.                  

Col Name        Radiative efficiency 
  8 CF4            0.1               
  9 C2F6           0.26              
 10 C6F14          0.49              
 11 HFC23          0.19              
 12 HFC32          0.11              
 13 HFC43_10       0.4               
 14 HFC125         0.23              
 15 HFC134a        0.16              
 16 HFC143a        0.13              
 17 HFC227ea       0.26              
 18 HFC245fa       0.28              
 19 SF6            0.52              
 20 CFC_11         0.25              
 22 CFC_113        0.3               
 23 CFC_114        0.31              
 24 CFC_115        0.18              
 25 CARB_TET       0.13              
 26 MCF            0.06              
 27 HCFC_22        0.2               
 28 HCFC_141B      0.14              
 29 HCFC_142B      0.2               
 30 HALON1211      0.3               
 32 HALON1301      0.32              
 33 HALON2402      0.33              
 34 CH3BR          0.01              
 35 CH3CL          0.01              

The cfc-11 equivalent of species X is computed as follows:                         
cfc-11 equiv of X(ppt) = X(ppt) * (rad efficiency of X)/(rad efficiency of CFC_11) 

The data are annual mean values.  The date assigned to each value is July 01 of    
the year.  There are also two extension points added to allow the model to run     
through the end of 2009.  The data for 2010 and 2011 are duplicates of the data for 2009.    history       >Tue Jan 11 14:00:45 MST 2011: Convert by getco2_historical.ncl     source        SConvert from:/fis/cgd/cseg/csm/inputdata/atm/cam/ggas/ghg_hist_1765-2009_c100902.nc    Version       �$HeadURL: https://svn-ccsm-models.cgd.ucar.edu/clm2/trunk_tags/clm4_0_09/models/lnd/clm/tools/ncl_scripts/getco2_historical.ncl $      Revision      <$Id: getco2_historical.ncl 23741 2010-06-12 19:27:09Z erik $      
   lonc                  units         degrees_east   lname         Longitude of grid cell center      bounds        lonv        �   latc                  units         degrees_north      lname         Latitude of grid cell center   bounds        latv        �   lonv                     units         degree_east    lname         Longitudesof grid cell vertices          �   latv                     units         degrees_north      lname         Latitudes of grid cell vertices             mask                  units         unitless   lname         Mask of active cells: 1=active     
coordinate        	latc lonc           (   frac                  units         unitless   lname         $Fraction of grid cell that is active   
coordinate        	latc lonc           0   area                  units         	radians^2      lname         Area of grid cell      
coordinate        	latc lonc           8   CO2                       
coordinate        latc lonc time     units         ppmv   lname         CO2 concentration           @   time                units         days since 1765-01-01      	long_name         Time   calendar      noleap          D   date                	long_name         current date as yyyymmdd   comment       HThis variable is NOT used when read by datm, the time coordinate is used        L@f�                     @v�     @v�             @V�     @V�     �V�     �V�     ?�      ?�      @)!�TD-C��@f�     TC��@�     {C�6@�x     �-C�+�@��     �=C�<<@��     �MC�L�@�X     ]C�]�@��     >mC�o5@�`     e}C��)@�:     ��C���@�     ��C���@��     ڭC��x@�d     �C��@��     (�C��@�>     O�C���@��     v�C�x@�     ��C�@��     �C�0�@��     �C�BX@�_     -C�T@��     :=C�f�@�9     aMC�zx@��     �]C��@�	�    �mC��@��     �}C���@�v�    ��C�̒@�-     $�C�ߘ@��    K�C��
@Ú     r�C��@�P�    ��C�h@�     ��C�&F@Ž�    ��C�6�@�t     �C�F�@�*�    6C�U�@��     ]C�d�@ȗ�    �-C�s@�N     �=C���@��    �MC��3@ʻ     �]C��@�q�     mC��X@�(     G}C��'@�ހ    n�C���@͕     ��C���@�K�    ��C�ԡ@�     �C��@ϸ�    
�C���@�7�    1�C��`@В�    X�C��@��     �C���@�I@    �C��9@Ѥ�    �C� #@���    �-C�v@�[     =C�@Ҷ@    CMC�t@��    j]C�U@�l�    �mC�_@��     �}C��@�#@    ߍC�D@�~�    �C�!�@���    -�C�$@�5     T�C�&o@Ր@    {�C�(�@��    ��C�+�@�F�    ��C�.@֢     ��C�0�@��@    C�33@�X�    ?C�1H@׳�    f-C�#�@�     �=C� @�j@    �MC���@�ŀ    �]C��@� �    mC��f@�|     )}C��3@��@    P�C��f@�2�    w�C��3@ڍ�    ��C��3@��     ŽC��f@�D@    ��C�� @۟�    �C���@���    :�C���@�V     a�C��3@ܱ@    �C�	�@��    �C��@�g�    �-C�33@��     �=C�I�@�@    %MC�\�@�y�    L]C�p @���    smC�� @�0     �}C�� @ߋ@    ��C��3@��    �C��f@� �    �C�ɚ@�N�    6�C���@�|     ]�C��3@��    ��C�	�@��`    ��C��@�     ��C�0 @�2�    �C�@ @�`@    !C�P @��    H-C�c3@Ề    o=C�s3@��     �MC�� @��    �]C���@�D`    �mC���@�r     }C�� @⟠    2�C��3@��@    Y�C�ٚ@���    ��C��3@�(�    ��C� @�V     ��C�33@��    ��C�Y�@�`    �C��3@��     C�C��3@��    kC��f@�:@    �C��@�g�    �-C�Y�@䕀    �=C���@��     MC��f@���    .]C� @�`    UmC�I�@�L     |}C�|�@�y�    ��C��f@�@    ʝC�ɚ@���    �C��f@��     �C�  @�0      ?�C�f@�]�     f�C�)�@�`     ��C�<�@�      ��C�L�@��     �C�Y�@�@    !C�ff@�A�    !*-C�s3@�o�    !Q=C��3@�     !xMC���@���    !�]C�� @��`    !�mC��f@�&     !�}C� @�S�    "�C�<�@�@    ";�C�i�@��    "b�C���@�܀    "��C�� @�
     "��C�	�@�7�    "��C�@ @�e`    "��C�s3@�     #%�C��f@���    #MC�ٚ@��@    #tC�	�@��    #�-C�6f@�I�    #�=C�c3@�w     #�MC���@��    $]C��3@��`    $7mC���@�      $^}C�	�@�-�    $��C�33@�[@    $��C�Y�@��    $ӭC��3@부    $��C��3@��     %!�C��3@��    %H�C� @�?`    %o�C�C3@�m     %��C�|�@욠    %�C��3@��@    %�C��@���    &-C�&f@�#�    &3=C�c3@�Q     &ZMC���@�~�    &�]C�ٚ@��`    &�mC�f@��     &�}C�L�@��    &��C�� @�5@    '�C��3@�b�    'D�C�� @    'k�C�  @�     '��C�f@���    '��C�&f@�`    '��C�0 @�G     (�C�0 @�t�    (/C�&f@�@    (VC��@���    (}-C� @���    (�=C��@��    (�MC� @�,`    (�]C��@�C0    )mC�)�@�Z     )@}C�@ @�p�    )g�C�` @���    )��C���@�p    )��C�� @�@    )ܽC��f@��    *�C�6f@���    **�C�� @���    *Q�C���@��    *x�C��@�'P    *�C�l{@�>     *�C�� @�T�    *�-C�"�@�k�    +=C���@�    +<MC���@�`    +c]C�2�@�0    +�mC�vf@��     +�}C���@���    +؍C�R�@���    +��C��q@�p    ,&�C�QH@�"@    ,M�C��@�9    ,t�C�~@�O�    ,��C��q@�f�    ,��C���@�}�    ,��C�V�@�P    -C��
@�     -8C�J�@���    -_-C�߮@���    -�=C���@��    -�MC�l{@�`    -�]C�C3@�0    -�mC�.@�4     ."}C��@�J�    .I�C�eq@�a�    .p�C�H@�xp    .��C��)@�@    .��C��)@�    .��C�f@��    /�C�R�@�Ӱ    /3�C�^f@��    /Z�C�>f@�P    /�C��q@�     /�C��=@�.�    /�-C��H@�E�    /�=C�c�@�\�    0MC�R@�s`    0E]C��3@�0    0lmC��3@��     0�}C���@���    0��C��H@�Π    0�C��{@��p    1�C�n�@��@    1/�C�;�@�    1V�C�B�@�)�    1}�C�aH@�@�    1��C�h @�W�    1��C�h @�nP    1�C�s3@��     2C�Y�@���    2A-C�ff@���    2h=C�"�@�ɐ    2�MC�"�@��`    2�]C�"�@��0    2�m