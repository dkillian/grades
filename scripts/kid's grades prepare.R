# Academic performance
# data prepare

?read_excel

tmp <- read_xlsx("data/raw/Sparkles grades.xlsx", sheet=2)

tmp
str(tmp)

crit_key <- read_xlsx("Sparkles grades.xlsx", sheet=3)
crit_key

var_labs <- key[,1] %>% unlist %>% as.vector
var_labs

grade_key <- read_xlsx("Sparkles grades.xlsx", sheet=4)

grade_key
str(grade_key)

grade_labs <- grade_key[,3] %>% unlist %>% as.vector
grade_labs

dat <- tmp %>%
  pivot_longer(cols=2:10,
               names_to = "var_name",
               values_to = "grade") %>%
  left_join(crit_key) %>%
  left_join(grade_key) %>%
  select(date, var_name, criterion, score, grade, grade_lab)

dat

write_csv(dat, "data/processed/Hazel pre-shool 1.csv")
