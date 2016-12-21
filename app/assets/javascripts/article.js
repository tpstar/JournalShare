// function articleListEntry(article) {
//   var articleInfo = "";
//   if (article.journal && article.journal.name ) {articleInfo += "<i>"+ article.journal.name + "</i>"}
//   if (article.year) {articleInfo += "<strong> " + article.year + "</strong>"}
//   if (article.vol) {articleInfo += "<i> " + article.vol + "</i>"}
//   if (article.issue) {articleInfo += " (" + article.issue + ")"}
//   if (article.start_page) {articleInfo += " p" + article.start_page}
//   return articleInfo;
// }

function byAuthor(article) {
  var author = article.users[article.users.length - 1];
  var authorString = " by " + author.first_name + " " + author.last_name;
  return authorString;
}


function ListEntry (article){
  this.journal_name = article.journal.name;
  this.year = article.year;
  this.vol = article.vol;
  this.issue = article.issue;
  this.start_page = article.start_page;
  this.users = article.users;
}

ListEntry.prototype.listArticle = function(){
  var articleInfo = "";
  if (this.journal_name ) {articleInfo += "<i>"+ this.journal_name + "</i>"}
  if (this.year) {articleInfo += "<strong> " + this.year + "</strong>"}
  if (this.vol) {articleInfo += "<i> " + this.vol + "</i>"}
  if (this.issue) {articleInfo += " (" + this.issue + ")"}
  if (this.start_page) {articleInfo += " p" + this.start_page}
  return articleInfo;
}

ListEntry.prototype.byAuthor = function() {
  var author = this.users[this.users.length - 1];
  var authorString = " by " + author.first_name + " " + author.last_name;
  return authorString;
}
