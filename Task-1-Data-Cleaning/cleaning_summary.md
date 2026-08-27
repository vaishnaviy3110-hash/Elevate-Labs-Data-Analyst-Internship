# Data Cleaning Summary

## Dataset
Netflix Movies and TV Shows

## Cleaning Steps Performed

1. Loaded and inspected the original Netflix dataset using Python and Pandas.
2. Checked the dataset for missing values and duplicate rows.
3. Handled missing values in the director, cast, country, rating, and duration columns by replacing them with "Unknown".
4. Identified incorrect duration values stored in the rating column (74 min, 84 min, and 66 min) and moved them to the duration column.
5. Converted the date_added column from string format to datetime format.
6. Checked and verified the data types after cleaning.
7. Confirmed that no duplicate rows were present.
8. Saved the cleaned dataset as `netflix_titles_cleaned.csv`.

## Date Handling

Missing or invalid dates were retained as `NaT` because the original dataset did not provide valid date information. No artificial dates were added.

## Tools Used

- Python
- Pandas
- VS Code