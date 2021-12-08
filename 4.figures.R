
working_directory <- getwd()

#====== 1) Distribution of the average rating per user" figure and PDF===========

pdf(file = paste(wk.dir, "/Distribution of average rating per user.pdf", 
                 sep = ""),   
    # The directory you want to save the file in
    width = 4, # The width of the plot in inches
    height = 4) # The height of the plot in inches

# displaying distribution of the average rating per user
qplot(average_ratings, fill=I("steelblue"), col=I("black"), ylab = "frequency", 
      xlim = c(0, 5)) +
  ggtitle("Distribution of the average rating per user")

dev.off()


#==========2) "/Total Views of the Top Films" figure and PDF ===================

pdf(file = paste(wk.dir, "/Total Views of the Top Films.pdf", sep = ""),   
    # The directory you want to save the file in
    width = 4, # The width of the plot in inches
    height = 4) # The height of the plot in inches

#bar plot of total view of most popular movies 
ggplot(table_views[1:10, ], aes(x = title, y = views)) +
  geom_bar(stat="identity", fill = 'steelblue', col=I("black")) +
  geom_text(aes(label=views), vjust=-0.3, size=3.5) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ggtitle("Total Views of the Top Films")

dev.off()


#=========== 3) heat map of 95 percentile users and movies + PDF ===============

pdf(file = paste(wk.dir, "/Heatmap of the top users and movies.pdf", sep = ""),   
    # The directory you want to save the file in
    width = 4, # The width of the plot in inches
    height = 4) # The height of the plot in inches

binary_minimum_movies <- quantile(rowCounts(movie_ratings), 0.)
binary_minimum_users <- quantile(colCounts(movie_ratings), 0.95, 0.95)
image(movie_ratings[rowCounts(movie_ratings) > minimum_movies,
                    colCounts(movie_ratings) > minimum_users],
      main = "Heatmap of the top users and movies")

dev.off()



