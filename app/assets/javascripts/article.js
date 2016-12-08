function articleListEntry(article) {
  var articleInfo = "";
  if (article["journal"]["name"]) {articleInfo += "<i>"+ article["journal"]["name"] + "</i>"}
  if (article["year"]) {articleInfo += "<strong> " + article["year"] + "</strong>"}
  if (article["vol"]) {articleInfo += "<i> " + article["vol"] + "</i>"}
  if (article["issue"]) {articleInfo += " (" + article["issue"] + ")"}
  if (article["start_page"]) {articleInfo += " p" + article["start_page"]}
  return articleInfo;
}
