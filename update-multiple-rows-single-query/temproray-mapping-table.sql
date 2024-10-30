-- Create a temporary table or CTE for mapping car names/brands to owner IDs
WITH car_owner_mapping AS (
  SELECT 'Model S' AS name, 'Tesla' AS brand, 1 AS owner_id
  UNION ALL
  SELECT 'Mustang', 'Ford', 2
  UNION ALL
  SELECT 'Civic', 'Honda', 3
  UNION ALL
  SELECT 'Corolla', 'Toyota', 4
  UNION ALL
  SELECT 'Challenger', 'Dodge', 5
  UNION ALL
  SELECT 'Accord', 'Honda', 6
  UNION ALL
  SELECT 'F-150', 'Ford', 1
  UNION ALL
  SELECT 'Wrangler', 'Jeep', 6
  UNION ALL
  SELECT 'Escalade', 'Cadillac', 7
)

-- Perform the update using a join with the mapping
UPDATE car
SET owner_id = mapping.owner_id
FROM car_owner_mapping AS mapping
WHERE car.name = mapping.name AND car.brand = mapping.brand;
