# Setup WRF
if [ ! -d "WRF" ]; then
        git clone git@github.com:CROCUS-Urban/WRF.git --branch master WRF && cd WRF
        git submodule update --init --recursive
fi
