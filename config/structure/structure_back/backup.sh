echo "Backup structure_db at $(date +"%Y_%m_%d_%I_%M_%p")"
sudo -u postgres pg_dump {{ db_name }} > $(pwd)/apps/structure/backups/{{ db_name }}_$(date +"%Y_%m_%d_%I_%M_%p").sql

sudo -u postgres pg_dump {{ db_name }} > $(pwd)/notes/structure_db_init.sql