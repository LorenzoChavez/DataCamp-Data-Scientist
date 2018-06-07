# Print the head of airquality
print(airquality.head())

# Melt airquality: airquality_melt
airquality_melt = pd.melt(airquality, id_vars=["Month", "Day"], value_vars=["Ozone","Solar.R", "Wind", "Temp"])

# Print the head of airquality_melt
print(airquality_melt.head())


# Print the head of airquality
print(airquality.head())

# Melt airquality: airquality_melt
airquality_melt = pd.melt(airquality, id_vars = ["Month", "Day"], value_vars=["Ozone", "Solar.R", "Wind", "Temp"], var_name="measurement", value_name="reading")

# Print the head of airquality_melt
print(airquality_melt.head())


# Print the head of airquality_melt
print(airquality_melt.head())

# Pivot airquality_melt: airquality_pivot
airquality_pivot = pd.pivot_table(airquality_melt, index=["Month", "Day"], columns="measurement", values="reading")

# Print the head of airquality_pivot
print(airquality_pivot.head())


# Print the index of airquality_pivot
print(airquality_pivot.index)

# Reset the index of airquality_pivot: airquality_pivot
airquality_pivot = airquality_pivot.reset_index()

# Print the new index of airquality_pivot
print(airquality_pivot.index)

# Print the head of airquality_pivot
print(airquality_pivot.head())


# Pivot airquality_dup: airquality_pivot
airquality_pivot = airquality_dup.pivot_table(index=["Month", "Day"], columns="measurement", values="reading", aggfunc=np.mean)

# Reset the index of airquality_pivot
airquality_pivot = airquality_pivot.reset_index()

# Print the head of airquality_pivot
print(airquality_pivot.head())

# Print the head of airquality
print(airquality.head())


# Melt tb: tb_melt
tb_melt = pd.melt(tb, id_vars=["country", "year"])

# Create the 'gender' column
tb_melt['gender'] = tb_melt.variable.str[0]

# Create the 'age_group' column
tb_melt['age_group'] = tb_melt.variable.str[1:]

# Print the head of tb_melt
print(tb_melt.head())


# Melt ebola: ebola_melt
ebola_melt = pd.melt(ebola, id_vars=["Date", "Day"], var_name="type_country", value_name="counts")

# Create the 'str_split' column
ebola_melt['str_split'] = ebola_melt["type_country"].str.split("_")

# Create the 'type' column
ebola_melt['type'] = ebola_melt["str_split"].str.get(0)

# Create the 'country' column
ebola_melt['country'] = ebola_melt["str_split"].str.get(1)

# Print the head of ebola_melt
print(ebola_melt.head())

