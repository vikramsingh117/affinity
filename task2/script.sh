#!/bin/bash

mysql --user=rfamro \
      --host=mysql-rfam-public.ebi.ac.uk \
      --port=4497 \
      --database=Rfam \
<<'EOF'
-- (a) Tigers

SELECT COUNT(*) AS tiger_types
FROM taxonomy
WHERE species LIKE '%Panthera tigris%';

SELECT ncbi_id AS sumatran_tiger_ncbi_id
FROM taxonomy
WHERE species LIKE '%Panthera tigris sumatrae%';

# -- (b) Joinable columns in Rfam

# SELECT column_name
# FROM information_schema.columns
# WHERE table_schema='Rfam'
# GROUP BY column_name
# HAVING COUNT(*) > 1;

SELECT
    'taxonomy -> rfamseq' AS relationship,
    'taxonomy.ncbi_id = rfamseq.ncbi_id' AS join_condition
UNION ALL
SELECT
    'rfamseq -> full_region',
    'rfamseq.rfamseq_acc = full_region.rfamseq_acc'
UNION ALL
SELECT
    'full_region -> rfam_family',
    'full_region.rfam_acc = rfam_family.rfam_acc'
UNION ALL
SELECT
    'rfam_family -> clan_member',
    'rfam_family.rfam_acc = clan_member.rfam_acc'
UNION ALL
SELECT
    'clan_member -> clan',
    'clan_member.clan_acc = clan.clan_acc';

# SELECT ncbi_id, species
# FROM taxonomy
# WHERE species LIKE 'Oryza%';

SELECT 
    t.species AS rice_species,
    MAX(r.length) AS longest_sequence
FROM taxonomy t
JOIN rfamseq r ON r.ncbi_id = t.ncbi_id
WHERE t.species LIKE 'Oryza%'
GROUP BY t.species
ORDER BY longest_sequence DESC
LIMIT 1;


EOF
