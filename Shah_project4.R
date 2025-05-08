# ALY 6000 - Project 4: Chemicals in Cosmetics
# Author: Neeti Shah
# Date: May 6, 2025

# Load required libraries
library(tidyverse)
library(readr)
library(lubridate)

# Load the dataset
cosmetics <- read_csv("chemicals_in_cosmetics.csv")

# Rename relevant columns for ease of use
cosmetics <- cosmetics %>%
  rename(
    product_name = ProductName,
    brand = BrandName,
    company = CompanyName,
    product_type = PrimaryCategory,
    sub_category = SubCategory,
    chemical = ChemicalName,
    discontinued_date = DiscontinuedDate,
    report_date = InitialDateReported
  )

# Filter for valid chemicals
cosmetics <- cosmetics %>% filter(!is.na(chemical))

# Add discontinued status flag
cosmetics <- cosmetics %>%
  mutate(discontinued_flag = ifelse(is.na(discontinued_date), "Active", "Discontinued"))

# Convert report date to year
cosmetics <- cosmetics %>%
  mutate(report_year = year(mdy(report_date)))

# Plot 1: Top 10 Brands with Most Products (grouping duplicates like Sephora/SEPHORA)
cosmetics %>%
  mutate(brand = str_to_title(brand)) %>%
  count(brand, sort = TRUE) %>%
  group_by(brand) %>%
  summarise(n = sum(n)) %>%
  slice_max(n, n = 10) %>%
  ggplot(aes(x = reorder(brand, n), y = n)) +
  geom_col(fill = "orange") +
  coord_flip() +
  labs(title = "Top 10 Brands with Most Products (Grouped)", x = "Brand", y = "Number of Products")

# Plot 2: Top 5 Most Common Product Types as Pie Chart
cosmetics %>%
  count(product_type, sort = TRUE) %>%
  slice_max(n, n = 5) %>%
  ggplot(aes(x = "", y = n, fill = product_type)) +
  geom_col(width = 1) +
  coord_polar("y") +
  theme_void() +
  labs(title = "Top 5 Most Common Product Types", fill = "Product Type")

# Plot 3: Top 5 Product Subcategories
cosmetics %>%
  count(sub_category, sort = TRUE) %>%
  slice_max(n, n = 5) %>%
  ggplot(aes(x = "", y = n, fill = sub_category)) +
  geom_col(width = 1) +
  coord_polar("y") +
  theme_void() +
  labs(title = "Top 5 Product Subcategories", fill = "Subcategory")

# Plot 4: Unique Chemicals per Product Type
cosmetics %>%
  group_by(product_type) %>%
  summarise(unique_chemicals = n_distinct(chemical)) %>%
  arrange(desc(unique_chemicals)) %>%
  ggplot(aes(x = reorder(product_type, unique_chemicals), y = unique_chemicals)) +
  geom_col(fill = "darkred") +
  coord_flip() +
  labs(title = "Unique Chemicals per Product Type", x = "Product Type", y = "Number of Unique Chemicals")

# Plot 5: Top 10 Most Common Chemicals
cosmetics %>%
  count(chemical, sort = TRUE) %>%
  slice_max(n, n = 10) %>%
  ggplot(aes(x = reorder(chemical, n), y = n)) +
  geom_col(fill = "darkgreen") +
  coord_flip() +
  labs(title = "Top 10 Most Common Chemicals", x = "Chemical", y = "Count")

# Plot 6: Top Subcategories Using Titanium Dioxide
cosmetics %>%
  filter(chemical == "Titanium dioxide") %>%
  count(sub_category, sort = TRUE) %>%
  slice_max(n, n = 10) %>%
  ggplot(aes(x = reorder(sub_category, n), y = n)) +
  geom_col(fill = "skyblue") +
  coord_flip() +
  labs(title = "Top Subcategories Using Titanium Dioxide", x = "Subcategory", y = "Count")

# Save cleaned dataset
write_csv(cosmetics, "NeetiShah_cleaned_cosmetics.csv")
