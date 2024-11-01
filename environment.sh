# Bash file to load modules and set environment
# variables for compilers and external libraries

# Set project home using realpath
# of current directory
export PROJECT_HOME=$(realpath .)

# Set SiteHome to realpath of SiteName
SiteHome="$PROJECT_HOME/sites/$SiteName"

# Load modules from the site directory
source $SiteHome/environment.sh

export WRF_HOME="$PROJECT_HOME/software/wrf/WRF"
export NETCDF_HOME="$PROJECT_HOME/software/netcdf/netcdf-install-$SiteName"
export NETCDF=$NETCDF_HOME

export LD_LIBRARY_PATH="$NETCDF_HOME/lib:$LD_LIBRARY_PATH"
export PATH="$NETCDF_HOME/bin:$PATH"
export PKG_CONFIG_PATH="$NETCDF_HOME/lib/pkgconfig:$PKG_CONFIG_PATH"

# Path to parallel HDF5 installtion with fortran support
if [ $HDF5_HOME ]; then
	BuildHDF5=false
else
	BuildHDF5=true
	export HDF5_HOME="$PROJECT_HOME/software/hdf5/HDF5/install-$SiteName"
	export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$HDF5_HOME/lib"
	export LIBRARY_PATH="$LD_LIBRARY_PATH"
fi

# Output information to stdout
echo "---------------------------------------------------------------------------------------"
echo "Execution Environment:"
echo "---------------------------------------------------------------------------------------"
echo "PROJECT_HOME=$PROJECT_HOME"
echo "SITE_HOME=$SiteHome"
echo "MPI_HOME=$MPI_HOME"
echo "HDF5_HOME=$HDF5_HOME"
echo "WRF_HOME=$WRF_HOME"
echo "LD_LIBRARY_PATH=$LD_LIBRARY_PATH"
echo "NETCDF_HOME=$NETCDF_HOME"
echo "PATH=$PATH"
echo "---------------------------------------------------------------------------------------"
