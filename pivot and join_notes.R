# setup

rm(list = ls())
setwd()

library(tidyverse)
library(nycflights13) # install this if you don't have it!


  ## Pivoting Data

  ###

  ### `pivot_longer()`: Making Data Longer


  ####
  # Challenge 1a: Using `pivot_longer`

  # The dataset `table4b` contains population data in a wide format.
  # table4b # uncomment to view

  # Use `pivot_longer` to reshape `table4b` into a long format.
  # - Gather the `1999` and `2000` columns.
  # - The new column containing the years should be named "year".
  # - The new column containing the population counts should be named "population".
  # Display the resulting long tibble.


  ####

  ### `pivot_wider()`: Making Data Wider



  ####
  # Challenge 1b: Using `pivot_wider`

  # 1. First, recreate the long version of `table4b` from Challenge 1a (or copy your code). Store it in a variable, e.g., `table4b_long`.
  # 2. Take `table4b_long` and use `pivot_wider` to transform it back into the original wide format (with columns `1999` and `2000`).
  #    - Use the "year" column for the new column names.
  #    - Use the "population" column for the cell values.
  # Display the resulting wide tibble. It should look like the original `table4b`.

 ####

  ### More Complex Pivoting: The `who` Dataset



  ####
  # Challenge 1c: Pivoting the `who` dataset

  # Use `pivot_longer` on the `who` dataset.
  # - Gather all columns from `new_sp_m014` through `newrel_f65`.
  # - Name the new column containing these original names `diagnosis_info`.
  # - Name the new column containing the counts `count`.
  # - Use the argument `values_drop_na = TRUE` to remove rows where the count was `NA`.
  # Store the result in a variable called `who_long` and display its structure using `glimpse()`.



  ####

  ---

  ## Joining Data

  ### Introduction to Joins & Keys

  # Joining combines data from multiple tables based on shared "key" columns.
  # We'll use datasets from `nycflights13`: `flights`, `airlines`, `airports`, `planes`.

  # Explore the data
   glimpse(flights)
   glimpse(airlines)
   glimpse(airports)
   glimpse(planes)


  ### `left_join`: Adding Information (Keeping All Left Rows)


  ####
  # Challenge 2a: Using `left_join`

  # 1. Filter the `flights` table for flights departing on January 1st, 2013 (`month == 1`, `day == 1`).
  # 2. Use `left_join` to add the full airline name (`name` column from `airlines`) based on the `carrier` key.
  # 3. `select` only these columns: `month`, `day`, `carrier`, `name`, `flight`, `origin`, `dest`.
  # 4. Show the first 5 rows using `head(5)`.



  ### `inner_join`: Finding Common Observations


  ####
  # Challenge 2b: Using `inner_join`

  # The `planes` table contains aircraft details, including manufacturing year (`year`), linked by `tailnum`.
  # Use `inner_join` to combine `flights` and `planes` using the `tailnum` key.
  # How many rows are in the resulting joined table? (Use `nrow()`).
  # Does this row count represent *all* flights originally in the `flights` table, or only a subset? Briefly explain why in a comment.



   ###`anti_join`: Finding Mismatches (What's Missing?)


   ####
   # Challenge 2c: Using `anti_join`

   # Check if there are any flights in the `flights` table where the `origin` airport code does *not* have a corresponding entry in the `airports$faa` column.
   # Use `anti_join`. Remember the key names are different (`origin` vs `faa`), so you'll need `by = c("origin" = "faa")`.
   # Report the number of rows in the result using `nrow()`.


   ####

   ### `semi_join`: Finding Matches (What Exists?)



   ####
   # Challenge 2d: Using `semi_join`

   # We want to identify flights originating from airports in the "America/New_York" timezone.
   # 1. Create a tibble named `ny_airports`. Filter the `airports` table to keep only rows where `tzone == "America/New_York"`, and then `select` only the `faa` column.
   # 2. Use `semi_join` to filter the `flights` table. Keep only flights where the `origin` column matches an `faa` code present in your `ny_airports` tibble.
   # 3. Count the number of rows in the resulting filtered flights data using `nrow()`.



   ### (Optional Bonus) Joining with Different Key Names


   ####
   # Challenge 2e: (Optional Bonus) Joining with multiple and different keys

   # Let's add hourly temperature and wind speed from the `weather` table to the `flights` table.
   # The join requires matching `year`, `month`, `day`, `hour`, and `origin`.
   # 1. Create a new tibble called `weather_alt`. Start with the `weather` table, `select` only the columns `year`, `month`, `day`, `hour`, `origin`, `temp`, `wind_speed`. Then, `rename` the `origin` column to `airport_code`.
   # 2. Perform a `left_join` starting with the `flights` table and joining `weather_alt`.
   #    You *must* specify all 5 key columns correctly in the `by` argument. Make sure to handle the renamed key (`origin` in `flights` should match `airport_code` in `weather_alt`).
   # 3. From the joined result, `select` the columns `year`, `month`, `day`, `hour`, `origin`, `temp`, `wind_speed` and display the first 6 rows using `head()`.


   ####
