# Read in the basic information

raw_info <- read_csv(resume_file) %>%
  mutate(ValueLink = ifelse(is.na(Link),
                            Value,
                            paste("[", Value, "](", Link, ")", sep = "")))

# Need to predetermine the sections to make
sections <- c("blurb", "contact", "education", "skills", "research", "award", "service", "teaching", "paper", "service", "work")

# Create an individual table for each subsections, allows for easier referencing. 
info <- lapply(sections, function(x){
  raw_info %>% 
    # Filter such that you are only focused on the current section. 
    dplyr::filter(Section == x)
})

# Make names for each section for easier/more readable referencing. 
names(info) <- sections
