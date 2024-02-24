# Load necessary libraries
library(dplyr)
library(readr)
library(tidyr)

# Get list of all .txt files in the working directory
txt_files <- list.files(pattern = "\\.tsv$")

# Initialize an empty data frame to store the unique data
unique_df <- data.frame()

# Loop over the txt files
for (i in seq_along(txt_files)) {
  
  # Read in the txt file
  df <- read_delim(txt_files[i], delim = "\t")
  
  # Extract the first column as probe miRNA_IDs
  if (i == 1) {
    probe_ids <- df[[1]]
    unique_df <- data.frame(ProbeID = probe_ids)
  }
  
  # Add the beta values column to the unique_df data frame, named after the current file
  file_name <- tools::file_path_sans_ext(basename(txt_files[i]))
  tpm_values <- df[[3]] # Assuming tpm values are in the third column
  unique_df[[file_name]] <- tpm_values
}

# Remove rows with any NA values
unique_df <- na.omit(unique_df)
rownames(unique_df) <- unique_df[,1]
unique_df2 <- unique_df[,-1]

# Log transform the data frame, adding a small constant to avoid taking the log of zero
unique_df2 <- log(unique_df2 + 0.0001)

unique_df3 <- t(apply(unique_df2, 1, function(x) (x - mean(x)) / sd(x)))

# If you'd like to convert your matrix back into a data frame
data01 <- as.data.frame(unique_df3)

# Remove rows where all values are NaN
data01 <- data01[!apply(is.na(data01), 1, all), ]


# Write the data frame to a CSV file
write.csv(unique_df2, "raw_miRNA.csv", row.names = TRUE)

# Write the data frame to a CSV file
write.csv(data01, "miRNA_all.csv", row.names = TRUE)
