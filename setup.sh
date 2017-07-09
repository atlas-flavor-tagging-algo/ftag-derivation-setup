# setup ATLAS
export ATLAS_LOCAL_ROOT_BASE=/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase
alias setupATLAS='source ${ATLAS_LOCAL_ROOT_BASE}/user/atlasLocalSetup.sh'

# make directories
mkdir -p sources build run

# check out the release and tags
pushd .
cd sources/
echo -n "setting up local ATLAS environment..."
setupATLAS -q
lsetup asetup -q
asetup AtlasDerivation,rel_2,21.0.X.Y-VAL,here
echo "done"
if [[ ! -d PhysicsAnalysis ]] ; then
    svnco DerivationFrameworkFlavourTag-99-02-17-branch
else
    echo "already checked out tags"
fi
popd

# build
pushd .
if [[ ! -d build ]]; then
    cd build/
    cmake ../sources/
    make
else
    echo "already built, remove build dir to rebuild"
fi
popd

# go to run dir and set up
source build/x86_64-slc6-gcc49-opt/setup.sh

