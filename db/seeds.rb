# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_user = User.create(name: 'Tom', photo: "https://picsum.photos/300/500", bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: "https://picsum.photos/300/500", bio: 'Teacher from Poland.')
first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
second_post = Post.create(author: first_user, title: 'Hey', text: 'This is my second post')
third_post = Post.create(author: first_user, title: 'Hi', text: 'This is my third post')
fourth_post = Post.create(author: first_user, title: 'Hoot', text: 'This is my fourth post')
comment_1 = Comment.create(post: first_post, author: second_user, text: 'Hi Tom!' )
comment_2 = Comment.create(post: first_post, author: first_user, text: 'Hey Tom!' )
comment_3 = Comment.create(post: first_post, author: second_user, text: 'Hey Tomas!' )
comment_4 = Comment.create(post: first_post, author: first_user, text: 'Hi Tuchel!' )
comment_5 = Comment.create(post: first_post, author: second_user, text: 'what a post!' )
comment_6 = Comment.create(post: first_post, author: first_user, text: 'Underrated to be honest!' )
