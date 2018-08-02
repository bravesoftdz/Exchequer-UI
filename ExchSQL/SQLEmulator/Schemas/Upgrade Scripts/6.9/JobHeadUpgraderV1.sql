--/////////////////////////////////////////////////////////////////////////////
--// Filename		: JOBHEADUpgraderV1.sql
--// Author			: Chris Sandow
--// Date				: 2011-09-30
--// Copyright Notice	: (c) Advanced Business Software & Solutions Ltd 2015. All rights reserved.
--// Description		: SQL Script to upgrade table for the 6.9 release
--//
--/////////////////////////////////////////////////////////////////////////////
--// Version History:
--//	1	2011-09-30:	File Creation - Chris Sandow
--//
--/////////////////////////////////////////////////////////////////////////////

SET NOCOUNT ON

-- First we check to see if the new column already exists in the table. This is
-- because all the upgrade scripts are run every time the system is upgraded,
-- so we must be careful not to try to make amendments which have already been
-- done.
IF EXISTS (
            SELECT *
            FROM   sysobjects tab
            WHERE  (tab.id = object_id('[!ActiveSchema!].JOBHEAD'))
          )
   AND
   NOT EXISTS (
                SELECT *
                FROM   sysobjects tab INNER JOIN
                       syscolumns col ON tab.id = col.id
                WHERE  (tab.id = object_id('[!ActiveSchema!].JOBHEAD'))
                 AND   (col.name = 'UserDef5')
              )
BEGIN
  ALTER TABLE [!ActiveSchema!].JOBHEAD
  ADD
    -- Fields which are in the <fixedfields> section of the XML schema MUST
    -- be specified as NOT NULL, with a DEFAULT.
    --
    -- Fields which are in the <recordtype> sections of the XML schema MUST be
    -- specified as NULL (to allow null values).
    UserDef5  varchar(30) NOT NULL DEFAULT CHAR(0),
    UserDef6  varchar(30) NOT NULL DEFAULT CHAR(0),
    UserDef7  varchar(30) NOT NULL DEFAULT CHAR(0),
    UserDef8  varchar(30) NOT NULL DEFAULT CHAR(0),
    UserDef9  varchar(30) NOT NULL DEFAULT CHAR(0),
    UserDef10 varchar(30) NOT NULL DEFAULT CHAR(0)
END

-- Now we update the Version number for the SchemaVersion table
UPDATE    [!ActiveSchema!].SchemaVersion
SET       Version = 1
WHERE     SchemaName = 'JOBHEAD_Final.xml' AND Version = 0

SET NOCOUNT OFF

