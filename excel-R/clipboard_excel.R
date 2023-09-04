# atencion a vacías -> NA
df <-  read.table("clipboard",  sep="\t", dec=",",  header = TRUE, na.strings=c("","NA"))


# atencion a NA -> vacias
write.table(df, "clipboard", sep="\t", dec=",", row.names=FALSE, na="")

