import pandas as pd

df = pd.read_csv("netflix_titles.csv")

df_cleaned = df.copy()

print("Dataset loaded successfully!")
print("Rows:", df.shape[0])
print("Columns:", df.shape[1])

print("\nFirst 5 rows:")
print(df.head())

print("\nData types:")
print(df.dtypes)

print("\nMissing values:")
print(df.isnull().sum())
print("\nDuplicate rows:")
print(df.duplicated().sum())
print("\nOriginal column names:")
print(df.columns.tolist())
print("\nRows with missing director:")
print(df[df["director"].isnull()][["title", "director"]].head(10))
print("\nRows with missing country:")
print(df[df["country"].isnull()][["title", "country"]].head(10))
print("\nRows with missing rating:")
print(df[df["rating"].isnull()][["title", "rating"]].head(10))
print("\nRows with missing date_added:")
print(df[df["date_added"].isnull()][["title", "date_added"]].head(10))
print("\nDate_added data type:")
print(df["date_added"].dtype)
df.columns = (
    df.columns
    .str.strip()
    .str.lower()
    .str.replace(" ", "_")
)
df["director"] = df["director"].fillna("Unknown")
df["cast"] = df["cast"].fillna("Unknown")
df["country"] = df["country"].fillna("Unknown")

print("\nRating values:")
print(df["rating"].value_counts(dropna=False))

print("\nDuration values:")
print(df["duration"].value_counts(dropna=False))

print("\nSuspicious rating values:")
print(df[df["rating"].isin(["74 min", "84 min", "66 min"])]
      [["title", "type", "rating", "duration"]])

print("\nRows with missing duration:")
print(df[df["duration"].isnull()]
      [["title", "type", "rating", "duration"]])

# Fix misplaced duration values
mask = df_cleaned["rating"].isin(["74 min", "84 min", "66 min"])

df_cleaned.loc[mask, "duration"] = df_cleaned.loc[mask, "rating"]
df_cleaned.loc[mask, "rating"] = "Unknown"

# Handle missing values
df_cleaned["director"] = df_cleaned["director"].fillna("Unknown")
df_cleaned["cast"] = df_cleaned["cast"].fillna("Unknown")
df_cleaned["country"] = df_cleaned["country"].fillna("Unknown")
df_cleaned["rating"] = df_cleaned["rating"].fillna("Unknown")
df_cleaned["duration"] = df_cleaned["duration"].fillna("Unknown")

df_cleaned["date_added"] = pd.to_datetime(
    df_cleaned["date_added"],
    errors="coerce"
)
print("\nMissing values AFTER cleaning:")
print(df_cleaned.isnull().sum())

print("\nData types AFTER cleaning:")
print(df_cleaned.dtypes)

print("\nDuplicate rows AFTER cleaning:")
print(df_cleaned.duplicated().sum())

print("\nCorrected rows:")
print(
    df_cleaned.loc[
        [5541, 5794, 5813],
        ["title", "type", "rating", "duration"]
    ]
)

# Save cleaned dataset
df.to_csv("netflix_titles_cleaned.csv", index=False)

print("\nCleaned dataset saved successfully!")