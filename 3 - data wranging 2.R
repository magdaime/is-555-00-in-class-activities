library(tidyverse)

# The mpg dataset is another one of those 'hidden' datasets that is always loaded:
df <- mpg
View(df)


# Let's do some warmup exercises:
# 
# Create a summary that includes only cars manufactured by "toyota" or "honda", 
# with displ less than 2.0. Show only the manufacturer, model, year, and displ 
# columns in the result, sorted by displ in ascending order.
df %>%
  filter((manufacturer=="toyota" | manufacturer=="honda") & displ<2.0) %>%
  select(manufacturer,model,year,displ)%>%
  arrange(desc(displ))


# Add a new column called efficiency that calculates the average fuel efficiency 
# as (cty + hwy) / 2. Filter the dataset to show only rows where efficiency is 
# greater than 25 and the class is "compact". Display the manufacturer, model, 
# efficiency, and class columns, sorted by efficiency in descending order.


df%>%
  mutate(efficiency = (cty + hwy) / 2)%>%
  filter(efficiency>25 & class=="compact") %>%
  select(manufacturer,model,efficiency,class) %>%
  arrange(desc(efficiency))



# Group the dataset by class and calculate:
#    - The total number of cars in each class (total_cars).
#    - The average city mileage (avg_cty).
#    - The average highway mileage (avg_hwy).
# Display the results, sorted by total_cars in descending order.



df%>%
  group_by(class) %>%
  summarise(total_cars=sum(n()),avg_cty=mean(cty),avg_hwy=mean(hwy) )%>%
  arrange(desc(total_cars))


