# R Class: Pivoting and Joining Data with Tidyverse

# Clear environment
  rm(list = ls())


# setwd("~/Documents/R_Class_Pivoting_Joins")

# Load necessary libraries
# install.packages("tidyverse") # If needed
# install.packages("nycflights13") # If needed
library(tidyverse)
library(nycflights13) # Provides example datasets flights, airlines, airports etc.

# Introduction:
# Today: Two key data manipulation skills: Pivoting & Joining.
# - Pivoting: Changing the *shape* of a single table (wide <-> long). Often needed for analysis/plotting.
# - Joining: Combining data from *multiple* tables based on shared keys. Essential for real-world data.
# We use `tidyr` (for pivoting) and `dplyr` (for joining), both part of `tidyverse`.


  ## 2. Pivoting Data (45 mins)

  ### 2.1 Concept: Wide vs. Long Data (5 mins)

  # Tidy Data Principles Recap:
  # 1. Each variable = column.
  # 2. Each observation = row.
  # 3. Each observational unit type = table.

  # Often, data isn't initially "tidy".
  # Wide Format: Column names represent *values* of a variable (e.g., columns `1999`, `2000`). Observations might span multiple rows.
  # Long Format: Each variable has its own column (e.g., a `year` column, a `value` column). Generally preferred for analysis in R.

  # Example: `table4a` (cases per country/year) is wide. Years are columns.
  table4a

# A "long" version would have columns: `country`, `year`, `cases`.
# Pivoting functions help us switch between these formats.

### 2.2 `pivot_longer()`: Making Data Longer (15 mins)

# Goal: Convert columns whose names are values into actual data values.
# Function: `pivot_longer(cols = ..., names_to = "...", values_to = "...")`
# - `cols`: Which columns to pivot (gather up). Use `c()` or `tidyselect` helpers (`:` or `-`).
# - `names_to`: Name of the NEW column that gets the *original column names*.
# - `values_to`: Name of the NEW column that gets the *original cell values*.

# Example: Making `table4a` long.
table4a %>%
  pivot_longer(
    cols = c(`1999`, `2000`), # Columns to gather (use backticks for numbers)
    names_to = "year",        # New column for the years (1999, 2000)
    values_to = "cases"       # New column for the counts
  )

# Alternative `cols` selection: Gather all columns *except* `country`.
table4a %>% pivot_longer(cols = -country, names_to = "year", values_to = "cases")

####
# Challenge 1a: Using `pivot_longer`

# The dataset `table4b` contains population data in a similar wide format to `table4a`.
table4b

# Use `pivot_longer` to reshape `table4b` into a long format with columns `country`, `year`, and `population`.
# Gather the `1999` and `2000` columns.

# Solution:
table4b %>%
  pivot_longer(
    cols = c(`1999`, `2000`),
    names_to = "year",
    values_to = "population"
  )

####

### 2.3 `pivot_wider()`: Making Data Wider (15 mins)

# Goal: Convert rows representing different variables for the same observation into columns. Inverse of `pivot_longer`.
# Function: `pivot_wider(names_from = ..., values_from = ...)`
# - `names_from`: Column whose *values* will become the new column names.
# - `values_from`: Column whose *values* will fill the cells of the new columns.

# Example: `table2` has rows for cases and population for each country/year.
table2

# Make it wider: one row per country/year, with separate `cases` and `population` columns.
table2 %>%
  pivot_wider(
    names_from = type,   # Values in 'type' ('cases', 'population') become new column names
    values_from = count  # Values in 'count' fill the new columns
  )

####
# Challenge 1b: Using `pivot_wider`

# Take the result from Challenge 1a (the long version of `table4b`).
# Pipe this long table into `pivot_wider` to convert it *back* into the original wide format of `table4b` (columns for 1999 and 2000 population).
# This demonstrates that `pivot_wider` is the inverse of `pivot_longer`.

# Solution:
# First, recreate the long table from Challenge 1a (or use a stored variable if you made one)
table4b_long <- table4b %>%
  pivot_longer(
    cols = c(`1999`, `2000`),
    names_to = "year",
    values_to = "population"
  )

# Now, pivot it wider
table4b_long %>%
  pivot_wider(
    names_from = year,          # The 'year' column values become new column names
    values_from = population    # The 'population' column provides the cell values
  )

####

### 2.4 Unite and separate

# As well as pivoting tables, unite and separate can be useful to change the structure of a dataset

# table 3 contains rate as a variable, being a combination of rate and population, 
# we can split that up by using the separate() function

new_table_3 <- table3 %>%
  separate(rate, col = c("cases", "population"), sep = "/")

# let's say we want to return table 3 back to it's original form, we can do this using unite()

old_table_3 <- new_table_3 %>% 
  unite(col = "rate", cases, population, sep = "/")

####
# Challenge 1c: Pivoting the `who` dataset

# Perform the `pivot_longer` operation shown in the example above on the `who` dataset.
# Gather all columns from `new_sp_m014` through `newrel_f65`.
# Call the new column containing the original names `diagnosis_info`.
# Call the new column containing the values `count`.
# Use `values_drop_na = TRUE`.
# Store the result in `who_long` and display its structure using `glimpse()`.

# Solution:
who_long <- who %>%
  pivot_longer(
    cols = new_sp_m014:newrel_f65,
    names_to = "diagnosis_info",
    values_to = "count",
    values_drop_na = TRUE
  )

glimpse(who_long)

####

---

  ## 3. Joining Data (55 mins)

  ### 3.1 Introduction to Joins & Keys (5 mins)

  # Relational Data: Data spread across tables linked by common variables (keys).
  # Example: `nycflights13` datasets (`flights`, `airlines`, `airports`, `planes`, `weather`).
  # Keys link these tables (e.g., `carrier`, `faa`, `tailnum`, `year, month, day, hour, origin`).

  # We'll mainly use `flights` and `airlines` initially.
  # glimpse(flights) # uncomment to view
  # glimpse(airlines) # uncomment to view
  # Identify the common key: `carrier`

  ### 3.2 `left_join`: Adding Information (Keeping All Left Rows) (15 mins)

  # `left_join(x, y, by = "key")`: The most common join.
  # - Keeps ALL rows from `x`. Adds columns from `y` where keys match. Puts `NA` otherwise.

  # Example: Add airline names to flights data.
  flights_with_names <- flights %>%
  left_join(airlines, by = "carrier") # Key 'carrier' matches in both

# glimpse(flights_with_names) # uncomment to view result with added 'name' column

####
# Challenge 2a: Using `left_join`

# Find all flights that departed on January 1st, 2013 (`month == 1`, `day == 1`).
# Then, use `left_join` to add the full airline name (from `airlines`).
# Finally, select and display columns `month`, `day`, `carrier`, airline `name`, `flight`, `origin`, `dest`. Show `head(5)`.

# Solution:
flights %>%
  filter(month == 1, day == 1) %>%
  left_join(airlines, by = "carrier") %>%
  select(month, day, carrier, name, flight, origin, dest) %>%
  head(5)

####

### 3.3 `inner_join`: Finding Common Observations (10 mins)

# `inner_join(x, y, by = "key")`: Keeps ONLY rows where keys exist in BOTH tables. Filters out non-matches.

# Example: How many flights were flown by planes with known details in the `planes` table?
# (Joins `flights` and `planes` on `tailnum`, keeping only matching rows)
flights %>%
  inner_join(planes, by = "tailnum") %>%
  nrow()
# Compare this to nrow(flights) - it's likely smaller.

####
# Challenge 2b: Using `inner_join`

# The `planes` table has manufacturing year (`year`).
# Use `inner_join` between `flights` and `planes` (key: `tailnum`).
# Count the rows in the result. Does this count represent all flights, or only some? Explain briefly why.

# Solution:
flights_with_plane_info <- flights %>%
  inner_join(planes, by = "tailnum")

nrow(flights_with_plane_info)
# Explanation: This count represents only flights where the specific plane (`tailnum`) was found in the `planes` table. Flights whose `tailnum` was not listed in `planes` are excluded by the inner join.

####

### 3.4 `anti_join`: Finding Mismatches (What's Missing?) (10 mins)

# `anti_join(x, y, by = "key")`: Returns rows from `x` that DO NOT have a match in `y`. Good for diagnostics.

# Example: Are there any flights with a carrier code not listed in the `airlines` table?
flights %>%
  anti_join(airlines, by = "carrier") %>%
  nrow() # Should be 0 if data is clean

####
# Challenge 2c: Using `anti_join`

# Are there any flights in `flights` whose `origin` airport code does *not* appear in the `airports$faa` column?
# Use `anti_join` (remember `by = c("origin" = "faa")`) and count the rows.

# Solution:
flights_bad_origin <- flights %>%
  anti_join(airports, by = c("origin" = "faa"))

nrow(flights_bad_origin)
# Explanation: Checks if all origin airports in flights are valid according to the airports table. (Should be 0 here).

####

### 3.5 `semi_join`: Finding Matches (What Exists?) (10 mins)

# `semi_join(x, y, by = "key")`: Filters `x`, keeping rows that HAVE a match in `y`. Doesn't add columns from `y`.

# Example: Filter `airlines` to show only those that actually had flights in the `flights` data.
airlines %>%
  semi_join(flights, by = "carrier")

####
# Challenge 2d: Using `semi_join`

# Find all flights that departed from an airport in the "America/New_York" timezone.
# 1. Create `ny_airports` containing `faa` codes from `airports` where `tzone == "America/New_York"`.
# 2. Use `semi_join` to filter `flights` based on `origin` matching `ny_airports$faa`.
# 3. Count the resulting rows.

# Solution:
# 1. Find NY timezone airports
ny_airports <- airports %>%
  filter(tzone == "America/New_York") %>%
  select(faa)

# 2. Filter flights using semi_join
flights_from_ny_tzone <- flights %>%
  semi_join(ny_airports, by = c("origin" = "faa"))

# 3. Count them
nrow(flights_from_ny_tzone)
# Explanation: Filters flights to keep only those originating from airports listed in ny_airports.

####

### 3.6 (Optional Bonus) Joining with Different Key Names (5 mins)

# Use `by = c("col_in_x" = "col_in_y")` if key names differ.
# Use `by = c("key1", "key2a" = "key2b", ...)` for multiple keys, some differing.

# Example: Joining `flights` and `airports` on destination.
# flights %>% left_join(airports, by = c("dest" = "faa")) %>% glimpse() # Adds airport info for destination

####
# Challenge 2e: (Optional Bonus) Joining with multiple and different keys

# Add weather info (`temp`, `wind_speed`) from `weather` to `flights`.
# Keys: `year, month, day, hour, origin`.
# 1. Create `weather_alt`: select needed columns from `weather`, RENAME `origin` to `airport_code`.
# 2. `left_join` `flights` with `weather_alt` specifying all 5 keys correctly in `by`, noting the renamed key.
# 3. Select `year`:`hour`, `origin`, `temp`, `wind_speed` and show `head()`.

# Solution:
# 1. Create weather_alt
weather_alt <- weather %>%
  select(year, month, day, hour, origin, temp, wind_speed) %>%
  rename(airport_code = origin)

# 2. Join using all 5 keys
flights_with_weather <- flights %>%
  left_join(weather_alt, by = c("year", "month", "day", "hour", "origin" = "airport_code"))

# 3. Select and view
flights_with_weather %>%
  select(year:hour, origin, temp, wind_speed) %>%
  head()

####
