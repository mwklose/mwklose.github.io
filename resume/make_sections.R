
make_contact <- function(infotable, priority=1){
  infotable %>%
    filter(Priority > priority) %>%
    arrange(desc(Priority)) %>%
    glue_data(
      "- <i class=\"fa fa-{Icon}\"></i> {ValueLink} \n"
    )
}

make_blurb <- function(infotable, priority=1){
  blurb <- infotable %>% 
    filter(Priority > priority) %>%
    glue_data(
      "### {Value} \n\n",
      "{MoreInfo1}"
    )
  glue("## Mark Klose {{#title}}",
       blurb)
}

make_education <- function(infotable, priority=1){
  edu <- infotable %>%
    filter(Priority > priority) %>%
    arrange(desc(End), desc(Start)) %>%
    glue_data(
      "### {ValueLink} \n\n",
      "{MoreInfo1} \n\n",
      "{Location} \n\n", 
      "- Courses: {Coursework} \n",
      "- Mentors: {Mentors} \n",
      "- Thesis: {Thesis} \n\n"
    )
  
  glue("## Education {{data-icon=graduation-cap data-concise=true}} \n\n",
       "{edu}")
}

make_research <- function(infotable, priority=1){
  print(infotable$Value)
}

make_skills <- function(infotable, priority=1){
  print(infotable$Value)
}