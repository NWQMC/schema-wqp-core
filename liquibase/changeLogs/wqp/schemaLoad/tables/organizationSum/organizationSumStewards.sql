create unlogged table if not exists ${schemaName}.organization_sum_stewards
partition of ${schemaName}.organization_sum
for values in (1)
with (fillfactor = 100)
;
