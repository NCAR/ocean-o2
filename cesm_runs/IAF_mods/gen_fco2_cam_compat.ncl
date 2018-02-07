; gen_fco2_cam_compat.ncl

begin

  fname_datm = "fco2_datm_1765-2011_c110111.nc"
  fname_datm_cam_compat = "fco2_datm_cam_compat_1765-2011_c150506.nc"

  system("ncks -O "+fname_datm+" "+fname_datm_cam_compat)
  f = addfile(fname_datm_cam_compat, "w")

  time = f->time
  time = time - 181.0
  f->time = (/ time /)

  date = f->date
  date = date - 600
  f->date = date
end
