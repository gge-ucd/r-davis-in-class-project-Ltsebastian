number_vector = c(23, 32, 45)

number_vector[2]
number_vector[c(2,2)]
number_vector[c(3,2,1)]
number_vector <- c(number_vector, 54)
number_vector <- c(13, 14)

letter_vector <- "l, a, u, r, e, l"
letter_vector
my_string <- "l a u r e l"
my_string

str(my_string)
str(letter_vector)
str(number_vector)

my_string <- c("dog",  "walrus")
data.frame(c(my_string))

data.frame(first_column = my_string, second_column = my_string)

?list()
test_list <- list("first string test")
test_list[[1]]

test_list <- list("first string test", "second test")
test_list
c(test_list, "next_try")

c(test_list, data.frame(1, 2, 3))
test_list
test_df <-data.frame(1,2,3)

test_list[[3]] <- test_df
test_list

str(test_list)

(test_list[3])

number_vector
number_vector[2]
number_vector
number_vector <- c(number_vector, 3, 6, 4)
number_vector <- c(2, 5, 35453, 22)
number_vector[c(2, 4)]
