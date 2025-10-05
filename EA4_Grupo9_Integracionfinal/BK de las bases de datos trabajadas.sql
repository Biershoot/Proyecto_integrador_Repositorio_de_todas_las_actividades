BACKUP DATABASE JardineriaStaging 
TO DISK = 'C:\Backups\JardineriaStaging.bak';

BACKUP DATABASE JardineriaDataMart 
TO DISK = 'C:\Backups\JardineriaDataMart.bak';

mysqldump -u root -p JardineriaStaging > JardineriaStaging.sql
mysqldump -u root -p JardineriaDataMart > JardineriaDataMart.sql
