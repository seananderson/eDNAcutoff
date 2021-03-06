# Anonymise the species and sample names in Davon's raw data and the simplified
#  data set, and simplify Davon's data set (remove Category_Sample_blank column)
#  and create examples.

big_example <- readr::read_csv("data-raw/data_for_andy.csv",
                               comment="#")

# Remove blank samples and the Category_Sample_blank column
big_example <- dplyr::filter(big_example, Category_Sample_blank != "b") %>%
    dplyr::select(-Category_Sample_blank)

# Anonymise and save
names(big_example) <- c("Sample", "a1", "a2", "a3", "a4",
                        1:(length(names(big_example))-5))
big_example$Sample = c("mock", 1:(length(big_example$Sample)-1))

usethis::use_data(big_example, overwrite = TRUE)

# Running this once to create test result, change by hand if necessary (though can't as not .csv - Issue #)
# big_example_result <- remove_false_pos(big_example)
# readr::write_csv(big_example_result, "data-raw/big_example_result.csv")  # run once to create, get Davon to manually check, and then edit the .csv file if the result should changed
big_example_result <- readr::read_csv("data-raw/big_example_result.csv")
usethis::use_data(big_example_result, overwrite = TRUE)

# For checking which were set to zero, running this once
big_example_zeros <- which_set_to_zero(big_example, big_example_result)
usethis::use_data(big_example_zeros, overwrite = TRUE)


# Do same for small example

small_example <- readr::read_csv("data-raw/data_manual_test.csv",
                               comment="#")

# Remove blank samples and the Category_Sample_blank column
small_example <- dplyr::select(small_example, -Category_Sample_blank)

# Anonymise and example
names(small_example) <- c("Sample", "a1", "a2", "a3", "a4",
                        1:(length(names(small_example))-5))
small_example$Sample <- c("mock", 1:(length(small_example$Sample)-1))

usethis::use_data(small_example, overwrite = TRUE)

# Save here to then manually edit for expected result after using
#  remove_false_pos().  So if anything changes have to manually edit .csv again:
# readr::write_csv(small_example, "data-raw/data_manual_test_result.csv")

small_example_result <- readr::read_csv("data-raw/data_manual_test_result.csv")

usethis::use_data(small_example_result, overwrite = TRUE)

# For checking which were set to zero:

small_example_zeros <- which_set_to_zero(small_example, small_example_result)
usethis::use_data(small_example_zeros, overwrite = TRUE)

