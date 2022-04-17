
make_contact <- function(infotable, priority=1){
  contact <- infotable %>%
    filter(Priority > priority) %>%
    arrange(desc(Priority)) %>%
    glue_data(
      "- <i class=\"fa fa-{Icon}\"></i> {ValueLink} \n"
    )
  
  glue("## Contact {{#contact}}\n\n", 
       contact %>% glue_collapse(sep="\n"), "\n\n")
}

make_blurb <- function(infotable, priority=1){
  blurb <- infotable %>% 
    filter(Priority > priority) %>%
    glue_data(
      "### {Value} \n\n",
      "{MoreInfo1}"
    )
  
  glue("## Mark Klose {{#title}}\n\n",
       blurb %>% glue_collapse(), "\n\n")
}

make_education <- function(infotable, priority=1){
  edu <- infotable %>%
    filter(Priority > priority) %>%
    arrange(desc(ValueLink), desc(End), desc(Start)) %>%
    mutate(EndDate = ifelse(End >= as.integer(format(Sys.Date(), "%Y")), "Present", End),
           ValueLinkNoDup = ifelse(!duplicated(ValueLink), ValueLink, "")) %>%
    glue_data(
      "\n\n",
      "### {ValueLinkNoDup} \n\n",
      "{MoreInfo1} \n\n",
      "{Location} \n\n", 
      "{EndDate} - {Start} \n\n",
      "- Courses: {Coursework} \n",
      "- Mentors: {Mentors} \n",
      "- Thesis: {Thesis} \n\n"
    )
  
  glue("## Education {{data-icon=graduation-cap data-concise=true}} \n\n",
        edu %>% glue_collapse(), "\n\n")
}

make_research <- function(infotable, priority=1){
  research <- infotable %>%
    filter(Priority > priority) %>%
    arrange(desc(ValueLink), desc(End), desc(Start)) %>%
    mutate(EndDate = ifelse(End >= as.integer(format(Sys.Date(), "%Y")), "Present", End),
           ValueLinkNoDup = ifelse(!duplicated(ValueLink), ValueLink, "")) %>%
    glue_data(
      "\n\n",
      "### {ValueLinkNoDup} \n\n",
      "{MoreInfo1} \n\n",
      "{Location} \n\n", 
      "{EndDate} - {Start} \n\n",
      "- Courses: {Coursework} \n",
      "- Mentors: {Mentors} \n",
      "- Thesis: {Thesis} \n\n"
    )
  
  glue("## Research Experience {{data-icon=laptop}} \n\n",
       research %>% glue_collapse(), "\n\n")
}

make_prof <- function(infotable, priority=1){
  prof <- infotable %>%
    filter(Priority > priority) %>%
    arrange(desc(End), desc(Start)) %>%
    mutate(EndDate = ifelse(End > as.integer(format(Sys.Date(), "%Y")), "Present", End),
           ValueLinkNoDup = ifelse(!duplicated(ValueLink), ValueLink, ""),
           Dates = ifelse(Start==End, End, paste(End, "-", Start))) %>%
    glue_data(
      "\n\n",
      "### {ValueLinkNoDup} \n\n",
      "{MoreInfo1} \n\n",
      "{Location} \n\n", 
      "{Dates} \n\n",
      "DETAILS HERE \n\n"
    )
  
  glue("## Professional Experience {{data-icon=suitcase}} \n\n",
       prof %>% glue_collapse(), "\n\n")
}

make_skills <- function(infotable, priority=1){
  print(infotable$Value)
}