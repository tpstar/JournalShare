# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

article_1 = Article.create(doi: '10.1021/om8005799', title: 'Synthesis and Reactivity of a Sterically Crowded Tris(pyrazolyl)borate Hafnium Benzyl Complex', vol: 27, year: 2008, issue: 19, start_page: 5075)
journal_1 = Journal.find_or_create_by(name: "Organometallics")
journal_1.articles << article_1
user_1 = User.find(1) # rake db:seed needs to be run after signed in
article_1.users << user_1

article_2 = Article.create(doi: '10.1021/ja0527673', title: 'Unusual Reactivity of Tris(pyrazolyl)borate Zirconium Benzyl Complexes', vol: 127, year: 2005, issue: 26, start_page: 9384)
journal_2 = Journal.find_or_create_by(name: 'J. Am. Chem. Soc.')
journal_2.articles << article_2
article_2.users << user_1

article_3 = Article.create(doi: '10.1371/journal.pone.0011273', title: 'Open Access to the Scientific Journal Literature: Situation 2009', vol: 5, year: 2010, issue: 6, start_page: 11273)
journal_3 = Journal.find_or_create_by(name: 'PLoS ONE')
journal_3.articles << article_3
user_2 = User.create(first_name: "Bo-Christer", last_name: "Bjoerk", email: "bo-christer@email.com", password: "password")
article_3.users << user_2
