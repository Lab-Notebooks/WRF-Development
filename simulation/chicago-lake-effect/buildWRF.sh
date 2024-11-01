# cache the value of current working directory
NodeDir=$(realpath .)

cd $WRF_HOME
./configure
./compile em_real #>& $NodeDir/log.wrfcompile

# Link customized inputs
ln -sf $NodeDir/em_real/* $WRF_HOME/test/em_real/.
