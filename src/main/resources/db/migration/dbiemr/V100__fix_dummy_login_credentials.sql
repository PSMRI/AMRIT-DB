-- Update passwords for dummy users to 'password'

UPDATE m_user 
SET Password = '$2a$10$8.UnVuG9HHgffUDAlk8qfOuVGkqRzgVymGe07xd00DMxs.TVuHOnu' 
WHERE UserName IN ('SuperAdmin', 'GOKAHWC', 'Hwc', 'Nurse');