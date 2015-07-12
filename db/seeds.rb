# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# ruby encoding: utf-8
  User.create(username: 'jimb', password: 'test')
  User.create(username: 'bobc', password: 'test')
  User.create(username: 'tommy', password: 'test')
  User.create(username: 'treehouse', password: 'test')
  User.create(username: 'ericT', password: 'test')
  User.create(username: 'rhone_ert', password: 'test')
  User.create(username: 'herbie_mit', password: 'test')

  #Profile.create(firstname: 'Jim', lastname: 'Bob', email: 'test@test.com', user_id: 1, activated: true, photo_file_name: nil, photo_content_type: nil, photo_file_size: nil, photo_updated_at: nil )
  Profile.create(firstname: 'Jim', lastname: 'Bob', email: 'test@test.com', user_id: 1, activated: true)
  Profile.create(firstname: 'Bob', lastname: 'Smith', email: 'test@test.com', user_id: 2, activated: true)
  Profile.create(firstname: 'Tommy', lastname: 'Lee Jones', email: 'test@test.com', user_id: 3, activated: true)
  Profile.create(firstname: 'Henry', lastname: 'Jones', email: 'test@test.com', user_id: 4, activated: false)
  Profile.create(firstname: 'Eric', lastname: 'Thomas', email: 'test@test.com', user_id: 5, activated: true)
  Profile.create(firstname: 'Rhonda', lastname: 'Jones', email: 'test@test.com', user_id: 6, activated: true)
  Profile.create(firstname: 'Herbie', lastname: 'Andrews', email: 'test@test.com', user_id: 7, activated: true)

  Post.create(title: 'herbie_mit says...', body: 'abc def ghi jkl mno pqr stu vwx yz', user_id: 7)
  Post.create(title: 'Tommy says...', body: 'abc def ghi jkl mno pqr stu vwx yz', user_id: 3)
  Post.create(title: 'Henry says...', body: 'abc def ghi jkl mno pqr stu vwx yz', user_id: 4)
  Post.create(title: 'herbie_mit has more to say...', body: 'abc def ghi jkl mno pqr stu vwx yz', user_id: 7)
  Post.create(title: 'Eric says...', body: 'abc def ghi jkl mno pqr stu vwx yz', user_id: 5)
  Post.create(title: 'Rhonda says...', body: 'abc def ghi jkl mno pqr stu vwx yz', user_id: 6)

  Comment.create(body: 'comment one about this jkl mno pqr stu vwx yz', user_id: 7, post_id: 1)
  Comment.create(body: 'comment two about this jkl mno pqr stu vwx yz', user_id: 7, post_id: 1)
  Comment.create(body: 'comment three about this jkl mno pqr stu vwx yz', user_id: 7, post_id: 1)
  Comment.create(body: 'comment four about this jkl mno pqr stu vwx yz', user_id: 7, post_id: 1)
  Comment.create(body: 'comment five about this jkl mno pqr stu vwx yz', user_id: 7, post_id: 1)
  Comment.create(body: 'comment six about this jkl mno pqr stu vwx yz', user_id: 7, post_id: 1)

