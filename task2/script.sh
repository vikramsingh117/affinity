#!/bin/bash

mysql --user=rfamro \
      --host=mysql-rfam-public.ebi.ac.uk \
      --port=4497 \
      --database=Rfam \
<<'EOF'
-- (a) Tiger queries

SELECT COUNT(*) AS tiger_types
FROM taxonomy
WHERE species LIKE '%Panthera tigris%';

SELECT ncbi_id AS sumatran_tiger_ncbi_id
FROM taxonomy
WHERE species LIKE '%Panthera tigris sumatrae%';
EOF
