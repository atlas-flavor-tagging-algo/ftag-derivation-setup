pushd .

cd run/
mkdir -p data
cd data/
mkdir -p FTAG2
cd FTAG2/

Reco_tf.py --preExec 'rec.doApplyAODFix.set_Value_and_Lock(True);from BTagging.BTaggingFlags import BTaggingFlags;BTaggingFlags.CalibrationTag = "BTagCalibRUN12Onl-08-40" ' --inputAODFile /afs/cern.ch/user/d/dguest/afswork/data/data16_13TeV/AOD.11063380._000004.pool.root.1 --outputDAODFile data16.pool.root --reductionConf FTAG2

popd
