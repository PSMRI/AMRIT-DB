ALTER TABLE t_cbacdetails
ADD COLUMN IF NOT EXISTS Cbac_OccupationalExposure VARCHAR(100);

ALTER TABLE t_cbacdetails
ADD COLUMN IF NOT EXISTS Cbac_BotheredProblem_last2weeks VARCHAR(100);

ALTER TABLE t_cbacdetails
ADD COLUMN IF NOT EXISTS Cbac_LittleInterest_Pleasure VARCHAR(100);

ALTER TABLE t_cbacdetails
ADD COLUMN IF NOT EXISTS Cbac_Depressed_hopeless VARCHAR(100);

ALTER TABLE t_cbacdetails
ADD COLUMN IF NOT EXISTS Cbac_DiscolorationSkin VARCHAR(100);
