# What is Tidy Data?

## A must-know concept for Data Scientists.

![img](https://miro.medium.com/max/875/0*zZ3ffSODokYgyruR)

Photo by [Hunter Harritt](https://unsplash.com/@hharritt?utm_source=medium&utm_medium=referral) on [Unsplash](https://unsplash.com/?utm_source=medium&utm_medium=referral)

# Introduction

There’s a popular saying in Data Science that goes like this — *“Data Scientists spend up to 80% of the time on data cleaning and 20 percent of their time on actual data analysis”*. The origin of this quote goes back to 2003, in *Dasu and Johnson’s* book, Exploratory Data Mining and Data Cleaning, and it still true to this day.

In a typical Data Science project, from importing your data to communicating your results, tidying your data is a crucial aspect in making your workflow more productive and efficient.

![img](https://miro.medium.com/max/646/1*BsYkSrXgHeaT5f7jvo7JMw.png)

[R for Data Science](https://r4ds.had.co.nz/introduction.html)

The process of tidying data would thus create what’s known as tidy data, which is an ideal first formulated by 

[Hadley Wickham](https://medium.com/u/2f166aac6770?source=post_page-----d58bb9ad2458--------------------------------)

 in his [paper](http://vita.had.co.nz/papers/tidy-data.pdf). So my article will be largely a summarization or extracting the essence of the paper if you will.



# What is Tidy Data?

From the paper, the definition given is:

> Tidy datasets provide a standardized way to link the **structure** of a dataset (its physical layout) with its **semantics** (its meaning)

To break down this definition, you have to first understand what structure and semantics means.

**> Structure** is the form and shape of your data. In statistics, most datasets are rectangular data tables(data frames) and are made up of rows and columns.

**> Semantics** is the meaning for the dataset. Datasets are a collection of values, either *quantitative* or *qualitative*. These values are organized in 2 ways — *variable* & *observation*.

- Variables — all values that measure the same underlying attribute across units
- Observations — all values measured on the same unit across attributes

If you didn’t get any of that, I recommend you reading the paper mentioned as it has examples and tables that illustrate it better.

Nonetheless, the 3 rules of tidy data help simplify the concept and make it more intuitive.

# The 3 rules of Tidy Data

![img](https://miro.medium.com/max/875/1*jS6ldw3qCLWA4m5aU6kn-Q.png)

R for Data Science [12.1](https://r4ds.had.co.nz/tidy-data.html#fig:tidy-structure)

1. Each variable is a column
2. Each observation is a row
3. Each type of observational unit is a table

As you can see from the image above is a great visualization of this framework for tidy data. The data frame you see in the image might just look like tables of values you see everywhere, but you have to understand that data doesn’t come in that form naturally, sometimes data is collected and stored separately, and your job is to aggregate them together in one table.

To appreciate why tidy data is so important, you have to encounter what messy data looks like.

# Messy Data

With tidy data defined, messy data would basically be any kind of data that isn’t following the above framework.

To narrow it down, the paper gives 5 common problems of messy data:

## 5 symptoms of messy data

- Column headers are values, not variable names.
- Multiple variables are stored in one column.
- Variables are stored in both rows and columns.
- Multiple types of observational units are stored in the same table.
- A single observational unit is stored in multiple tables.

# Why is Tidy Data important?

The importance of tidy data ties is simple. With a standardized framework for how your data should look, you spend less time on data cleaning and wrangling, and more time to focus on answering the problem at hand.

It’s also a good practice to have your data in this format, which makes it reproducible and it’s easy for others to understand.

Another more technical reason is that the concept of tidy data is complemented with the tools in R to work with. Since R works with vectors of values (R functions are vectorized by nature), you’re able to naturally apply your tidy data to the tools used.

# Introducing TidyVerse!

There are amazing libraries in R that complement the tidy data philosophy. They help you tidy and clean your data efficiently and swiftly, which you can utilize by loading the package `tidyverse `in R.

![img](https://miro.medium.com/max/810/1*cSdIrlHoIxG2_ATxnlqRzg.jpeg)

Made with [codeimg.io](https://codeimg.io/)

After running `library(tidyverse)`, you’ll see something similar to this. To perform data cleaning and data tidying, the main libraries to use would be `tidyr` and `dplyr`.

A brief intro to these two libraries:

`dplyr` — Grammar of data manipulation, with 5 verbs(functions) that helps you solve most of data manipulation challenges

1. `mutate` → adding new columns
2. `select` → selecting columns
3. `filter` →filtering rows
4. `summarise` → reducing values into summaries (average of variable)
5. `arrange`→ reordering rows

`tidyr` — set of functions to help you get tidy data. It’s the successor to reshape2(which uses melt and cast). It has 5 main categories

1. Pivoting → `pivot_longer()`& `pivot_wider()`
2. Rectangling → `unnest_longer()`, `unnest_wider()`, `hoist()`
3. Nesting → `nest() `& `unnest()`
4. Splitting and combining columns →`separate()`,`extract()`, `unite()`
5. Missing Values→ `complete()`, `drop_na()`, `fill()`, `replace_na()`

To see these functions in action, read [chapter 12: Tidy Data](https://r4ds.had.co.nz/tidy-data.html) from the free book, [R for Data Science](https://r4ds.had.co.nz/index.html) by Hadley Wickham!

To know more about the packages, read about them on their website.

[Tidyverse packagesInstallation and use Install all the packages in the tidyverse by running install.packages("tidyverse"). Run…www.tidyverse.org](https://www.tidyverse.org/packages/)

# Summary

![img](https://miro.medium.com/max/875/0*pCmYrjPB7GRkvr5b)

Photo by [Dennis Kummer](https://unsplash.com/@dekubaum?utm_source=medium&utm_medium=referral) on [Unsplash](https://unsplash.com/?utm_source=medium&utm_medium=referral)

The philosophy of tidy data isn’t all that clear if you just read about it. Along with any other concepts, to understand it better, you would have to apply it and do some hands-on work to see it in action.

Moreover, to really appreciate the power and usefulness of the tidy data tools, you would have to get your hands dirty and **work on some messy data**. Most data you encounter in places like Kaggle or other websites are all already tidy data, so make sure you find data that is messy. Or if you’re brave, you can scrape data from the web and tidy the data yourself. That’s a great challenge to develop your data science skills and become a better “data cleaner”.

## Action plan

A great way to practice your tidy data skills is to participate in the [Tidy Tuesday](https://github.com/rfordatascience/tidytuesday) challenge, which is a weekly social data project by the [R for Data Science online community](https://www.rfordatasci.com/).

About the challenge:

> Every week we post a raw dataset, a chart or article related to that dataset, and ask you to explore the data. While the dataset will be “tamed”, it will not always be tidy! As such you might need to apply various `R for Data Science` techniques to wrangle the data into a true tidy format. The goal of `TidyTuesday` is to apply your R skills, get feedback, explore other’s work, and connect with the greater `#RStats` community! As such we encourage everyone of all skills to participate!

Read more about it at their [GitHub repo](https://github.com/rfordatascience/tidytuesday).

Thanks for reading my article. I leave you with a quote by Hadley Wickham.

> “Tidy datasets are all alike but every messy dataset is messy in its own way.” — Hadley Wickham

