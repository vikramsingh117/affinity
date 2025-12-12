
MySQL [Rfam]> SELECT ncbi_id, species
    -> FROM taxonomy
    -> WHERE species LIKE '%tigris%';
+---------+----------------------------------------------+
| ncbi_id | species                                      |
+---------+----------------------------------------------+
|  886578 | Archaius tigris                              |
|   52180 | Aspidoscelis tigris                          |
|  171147 | Aspidoscelis tigris aethiops                 |
|  122585 | Aspidoscelis tigris maxima                   |
|  171148 | Aspidoscelis tigris punctilinealis           |
|  171150 | Aspidoscelis tigris septentrionalis          |
|  171151 | Aspidoscelis tigris tigris                   |
|  702749 | Calliostoma tigris                           |
|   88082 | Crotalus tigris                              |
|   75124 | Cypraea tigris                               |
|  993698 | Diastema sp. tigrisDHJ01                     |
|  993699 | Diastema sp. tigrisDHJ02                     |
| 1108890 | Diastema sp. tigrisDHJ03                     |
|  494932 | Leptopoma tigris                             |
|  290528 | Microlophus tigris                           |
|  327785 | Mycteroperca tigris                          |
|    9694 | Panthera tigris (tiger)                      |
|   74533 | Panthera tigris altaica (Amur tiger)         |
|  253258 | Panthera tigris amoyensis (Amoy tiger)       |
|   74534 | Panthera tigris corbetti (Indochinese tiger) |
|  419130 | Panthera tigris jacksoni (Malayan tiger)     |
|  644771 | Panthera tigris sondaica (Javan tiger)       |
|    9695 | Panthera tigris sumatrae (Sumatran tiger)    |
|   74535 | Panthera tigris tigris (Bengal tiger)        |
|  175849 | Pasteurella multocida subsp. tigris          |
|  351403 | Roboastra tigris                             |
|  101839 | Squalius lepidus (Tigris dace)               |
|  488314 | Tigrisoma fasciatum                          |
|  110694 | Tigrisoma lineatum                           |
+---------+----------------------------------------------+
29 rows in set (0.267 sec)



Task2:
using Describe, ER table given on the web page,
SELECT column_name
FROM information_schema.columns
WHERE table_schema='Rfam'
GROUP BY column_name
HAVING COUNT(*) > 1;

COLUMN_NAME
cm
rfam_acc
seed
author
closed
created
lsf_id
message
opened

Task c:

SELECT ncbi_id, species
FROM taxonomy
WHERE species LIKE 'Oryza%';

ncbi_id species
4527    Oryza
52545   Oryza alta
4532    Oryza australiensis
65489   Oryza barthii
4533    Oryza brachyantha
77588   Oryza coarctata
29689   Oryza eichingeri
188562  Oryza environmental sample
4538    Oryza glaberrima (African rice)

clan_member -> clan     clan_member.clan_acc = clan.clan_acc
rice_species    longest_sequence
Oryza granulata 

task d:

SHOW TABLES;
DESCRIBE family;
DESCRIBE full_region;
DESCRIBE rfamseq;