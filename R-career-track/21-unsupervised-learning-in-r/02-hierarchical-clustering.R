# Create hierarchical clustering model: hclust.out
hclust.out <- hclust(dist(x))

# Inspect the result
summary(hclust.out)

# Cut by height
cutree(hclust.out, h=7)

# Cut by number of clusters
cutree(hclust.out, k=3)

# Cluster using complete linkage: hclust.complete
hclust.complete <- hclust(dist(x), method = "complete")

# Cluster using average linkage: hclust.average
hclust.average <- hclust(dist(x), method = "average")

# Cluster using single linkage: hclust.single
hclust.single <- hclust(dist(x), method = "single")

# Plot dendrogram of hclust.complete
plot(hclust.complete, main = "Complete")

# Plot dendrogram of hclust.average
plot(hclust.average, main = "Average")

# Plot dendrogram of hclust.single
plot(hclust.single, main = "Single")

# View column means
colMeans(pokemon)

# View column standard deviations
apply(pokemon, sd, MARGIN=2)

# Scale the data
pokemon.scaled <- scale(pokemon)

# Create hierarchical clustering model: hclust.pokemon
hclust.pokemon <- hclust(dist(pokemon.scaled), method="complete")

# Apply cutree() to hclust.pokemon: cut.pokemon
cut.pokemon <- cutree(hclust.pokemon, k=3)

# Compare methods
table(cut.pokemon, km.pokemon[["cluster"]])

