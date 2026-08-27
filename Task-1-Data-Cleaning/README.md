# Task 1 - Data Cleaning and Preprocessing

##  Project Overview

This project focuses on cleaning and preprocessing the Netflix Movies and TV Shows dataset.

The objective was to identify and handle common data quality issues such as missing values, inconsistent values, duplicate records, and incorrect data types.

##  Dataset

**Dataset:** Netflix Movies and TV Shows

The dataset contains information about movies and TV shows available on Netflix.

### Dataset Details

- Rows: 8,807
- Columns: 12

##  Tools Used

- Python
- Pandas
- VS Code

##  Data Cleaning Performed

The following preprocessing steps were performed:

- Inspected the dataset structure and contents
- Identified missing values
- Checked for duplicate records
- Handled missing values in relevant columns
- Identified and corrected misplaced duration values in the rating column
- Standardized the dataset's date format
- Converted `date_added` from string to datetime
- Checked data types after cleaning
- Performed final data-quality checks

##  Data Quality Findings

- The original dataset contained missing values in several columns.
- No duplicate rows were found.
- Three duration values (`74 min`, `84 min`, and `66 min`) were incorrectly stored in the `rating` column and were moved to the `duration` column.
- Missing/invalid dates were retained as `NaT` rather than assigning artificial dates.

## Project Files

| File | Description |
|---|---|
| `netflix_titles.csv` | Original/raw dataset |
| `netflix_titles_cleaned.csv` | Cleaned dataset |
| `data_cleaning.py` | Python script used for cleaning |
| `cleaning_summary.md` | Summary of cleaning operations |

##  Result

The dataset was successfully cleaned and saved as:

`netflix_titles_cleaned.csv`