caribbean_population <- data.frame(
  Country = c(
    "Jamaica", "Trinidad and Tobago", "Bahamas", "United States Virgin Islands", 
    "Cayman Islands", "Dominica", "Saint Kitts and Nevis", "Turks and Caicos Islands", 
    "Sint Maarten", "British Virgin Islands", "Caribbean Netherlands", "Saint Martin", 
    "Anguilla", "Saint Barthélemy", "Montserrat"
  ),
  Population = c(
    2839175, 1507782, 412624, 84905, 
    74457, 66205, 46843, 46535, 
    43350, 39471, 30675, 26129, 
    14598, 11258, 4389
  )
)

write_csv(caribbean_population, "carribean_population.csv")
