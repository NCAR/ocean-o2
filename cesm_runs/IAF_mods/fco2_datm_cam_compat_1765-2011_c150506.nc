CDF   �   
      time       lat       lon       nv              comment      2 September 2010: Prepared by B. Eaton using data provided by Andrew Gettelman      
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
through the end of 2009.  The data for 2010 and 2011 are duplicates of the data for 2009.    history       �Wed May  6 13:23:40 2015: ncks -O fco2_datm_1765-2011_c110111.nc fco2_datm_cam_compat_1765-2011_c150506.nc
Tue Jan 11 14:00:45 MST 2011: Convert by getco2_historical.ncl      source        SConvert from:/fis/cgd/cseg/csm/inputdata/atm/cam/ggas/ghg_hist_1765-2009_c100902.nc    Version       �$HeadURL: https://svn-ccsm-models.cgd.ucar.edu/clm2/trunk_tags/clm4_0_09/models/lnd/clm/tools/ncl_scripts/getco2_historical.ncl $      Revision      <$Id: getco2_historical.ncl 23741 2010-06-12 19:27:09Z erik $   NCO       4.4.2         
   CO2                       
coordinate        latc lonc time     units         ppmv   lname         CO2 concentration           �   area                  units         	radians^2      lname         Area of grid cell      
coordinate        	latc lonc           \   date                	long_name         current date as yyyymmdd   comment       HThis variable is NOT used when read by datm, the time coordinate is used        �   frac                  units         unitless   lname         $Fraction of grid cell that is active   
coordinate        	latc lonc           d   latc                  units         degrees_north      lname         Latitude of grid cell center   bounds        latv        l   latv                     units         degrees_north      lname         Latitudes of grid cell vertices          t   lonc                  units         degrees_east   lname         Longitude of grid cell center      bounds        lonv        �   lonv                     units         degree_east    lname         Longitudesof grid cell vertices          �   mask                  units         unitless   lname         Mask of active cells: 1=active     
coordinate        	latc lonc           �   time                units         days since 1765-01-01      	long_name         Time   calendar      noleap          �@)!�TD-?�              @V�     @V�     �V�     �V�     @f�             @v�     @v�             ?�      C��Q�        C��x�@v�     C�6��@��     C�+���@�     C�<<��@��     C�L�@��     C�]�<@�     C�o5c%@��     C��)�5@��     C����E@��     C����U@��     C��x�e@�^     C��&u@�     C��M�@��     C���t�@��     C�x��@�c     C�µ@��     C�0���@�=     C�BX�@��     C�T7�@�     C�f�^�@��     C�zx�@��     C���@�^     C���%@�e�    C����5@�     C�̒"E@�Ҁ    C�ߘIU@     C��
pe@�?�    C���u@��     C�h��@Ĭ�    C�&F�@�c     C�6��@��    C�F�3�@��     C�U�Z�@ǆ�    C�d���@�=     C�s��@��    C�����@ɪ     C��3�@�`�    C��@�     C��XE%@�̀    C��'l5@̄     C����E@�:�    C����U@��     C�ԡ�e@Χ�    C��u@�^     C���/�@�
@    C��`V�@�e�    C��}�@���    C�����@�     C��9��@�w@    C� #��@�Ҁ    C�v�@�-�    C�@�@҉     C�th@��@    C�U�@�?�    C�_�%@Ӛ�    C���5@��     C�DE@�Q@    C�!�+U@Ԭ�    C�$Re@��    C�&oyu@�c     C�(���@վ@    C�+�Ǖ@��    C�.�@�t�    C�0��@��     C�33<�@�+@    C�1Hc�@׆�    C�#���@���    C� ��@�=     C����@ؘ@    C�� @��    C��f'%@�N�    C��3N5@٪     C��fuE@�@    C��3�U@�`�    C��3�e@ڻ�    C��f�u@�     C�� �@�r@    C���8�@�̀    C���_�@�(�    C��3��@܄     C�	���@��@    C����@�:�    C�33��@ݕ�    C�I�"�@��     C�\�J@�L@    C�p q@ާ�    C�� �%@��    C�� �5@�^     C��3�E@߹@    C��fU@�
@    C�ɚ4e@�7�    C���[u@�e�    C��3��@��     C�	���@���    C��Х@��`    C�0 ��@�     C�@ �@�I�    C�P E�@�w@    C�c3l�@��    C�s3��@�Ҁ    C�� �@�      C����@�-�    C���	%@�[`    C�� 05@�     C��3WE@ⶠ    C�ٚ~U@��@    C��3�e@��    C� �u@�?�    C�33�@�m     C�Y��@��    C��3A�@��`    C��3h�@��     C��f��@�#�    C����@�Q@    C�Y���@�~�    C����@䬀    C��f,@��     C� S@��    C�I�z%@�5`    C�|��5@�c     C��f�E@吠    C�ɚ�U@�@    C��f e@���    C�   =u@��    C�f d�@�G     C�)� ��@�t�    C�<� ��@�`    C�L� ٵ@��     C�Y�! �@���    C�ff!'�@�+@    C�s3!N�@�X�    C��3!u�@熀    C���!�@�     C�� !�@���    C��f!�%@�`    C� "5@�=     C�<�"9E@�j�    C�i�"`U@�@    C���"�e@���    C�� "�u@��    C�	�"Յ@�!     C�@ "��@�N�    C�s3##�@�|`    C��f#J�@�     C�ٚ#q�@�נ    C�	�#��@�@    C�6f#��@�2�    C�c3#��@�`�    C���$@�     C��3$5@��    C���$\%@��`    C�	�$�5@�     C�33$�E@�D�    C�Y�$�U@�r@    C��3$�e@��    C��3%u@�̀    C��3%F�@��     C� %m�@�(�    C�C3%��@�V`    C�|�%��@�     C��3%��@챠    C��&	�@��@    C�&f&0�@��    C�c3&W�@�:�    C���&@�h     C�ٚ&�@��    C�f&�%@��`    C�L�&�5@��     C�� 'E@��    C��3'BU@�L@    C�� 'ie@�y�    C�  '�u@    C�f'��@��     C�&f'ޕ@��    C�0 (�@�0`    C�0 (,�@�^     C�&f(S�@    C��(z�@�@    C� (��@���    C��(��@�
@    C� (�@�!    C��)@�7�    C�)�)>%@�N�    C�@ )e5@�e�    C�` )�E@�|P    C���)�U@�     C�� )�e@��    C��f*u@���    C�6f*(�@�א    C�� *O�@��`    C���*v�@�0    C��*��@�     C�l{*��@�2�    C�� *��@�I�    C�"�+�@�`p    C���+9�@�w@    C���+a@�    C�2�+�@��    C�vf+�%@�    C���+�5@�Ҁ    C�R�+�E@��P    C��q,$U@�      C�QH,Ke@��    C��,ru@�-�    C�~,��@�D�    C��q,��@�[`    C���,�@�r0    C�V�-�@�     C��
-5�@��    C�J�-\�@�    C�߮-��@��p    C���-��@��@    C�l{-�@��    C�C3-�@��    C�.. %@�(�    C��.G5@�?�    C�eq.nE@�VP    C�H.�U@�m     C��).�e@��    C��).�u@��    C�f/
�@�    C�R�/1�@��`    C�^f/X�@��0    C�>f/�@��     C��q/��@��    C��=/��@�#�    C��H/��@�:p    C�c�0�@�Q@    C�R0C@�h    C��30j@�~�    C��30�%@���    C���0�5@���    C��H0�E@��P    C��{1U@��     C�n�1-e@���    C�;�1Tu@��    C�B�1{�@��    C�aH1��@�5`    C�h 1ɥ@�L0    C�h 1�@�c     C�s32�@�y�    C�Y�2>�@���    C�ff2e�@��p    C�"�2��@��@    C�"�2�@��    C�"�2�@���    