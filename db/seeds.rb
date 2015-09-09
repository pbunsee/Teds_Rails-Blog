Comment.create!([
  {body: "Do you know what program those maps are created with?", user_id: 2, post_id: 3},
  {body: "Maybe R? I am not sure.", user_id: 1, post_id: 3},
  {body: " Great tutorial!", user_id: 2, post_id: 1}
])
Post.create!([
  {body: "Build a Real Time web app in Node.js , Angular.js, MongoDB", title: "Learn Node.js", user_id: 1, photo_file_name: nil, photo_content_type: nil, photo_file_size: nil, photo_updated_at: nil},
  {body: "John Tukey coined the term ANOVA.", title: "Fact of the day", user_id: 1, photo_file_name: nil, photo_content_type: nil, photo_file_size: nil, photo_updated_at: nil},
  {body: "Minimalist maps http://i.imgur.com/iOIaAJN.png", title: "Minimalism in graphic design", user_id: 1, photo_file_name: nil, photo_content_type: nil, photo_file_size: nil, photo_updated_at: nil},
  {body: "As a private citizen, as long as nobody ever tells me that I can't run my own private e-mail server, we're good.", title: "Privacy laws", user_id: 7, photo_file_name: nil, photo_content_type: nil, photo_file_size: nil, photo_updated_at: nil},
  {body: "Economists say a slower-growing China, over the long haul, could be a plus for the U.S. http://on.wsj.com/1QnPag2 ", title: "WSJ News Graphics has an interesting article...", user_id: 1, photo_file_name: nil, photo_content_type: nil, photo_file_size: nil, photo_updated_at: nil},
  {body: "New York Times graphics are cool! Which European countries accept their share of migrants based on today's proposed quota? http://www.nytimes.com/interactive/2015/09/04/world/europe/europe-refugee-distribution.html … ", title: "Cool graphics!", user_id: 2, photo_file_name: nil, photo_content_type: nil, photo_file_size: nil, photo_updated_at: nil},
  {body: "D3.js", title: "Test your SVG skills", user_id: 2, photo_file_name: nil, photo_content_type: nil, photo_file_size: nil, photo_updated_at: nil}
])
User.create!([
  {username: "pbunsee", password: "Ishfaaq2"},
  {username: "bobc", password: "test"},
  {username: "tommy", password: "test"},
  {username: "treehouse", password: "test"},
  {username: "ericT", password: "test"},
  {username: "rhonert", password: "test"},
  {username: "herbie_mit", password: "test"},
  {username: "silvertree", password: "test"},
  {username: "terryc", password: "test"},
  {username: "herbie3", password: "tewq"},
  {username: "freddy_mercury", password: "test"},
  {username: "ziggy", password: "test"},
  {username: "ren", password: "test"}
])
Profile.create!([
  {firstname: "Pranesha", lastname: "Bunsee", email: "pbunsee@gmail.com", activated: true, user_id: 1, photo_file_name: nil, photo_content_type: nil, photo_file_size: nil, photo_updated_at: nil},
  {firstname: "Bob Henry", lastname: "Smith", email: "test@test.com", activated: true, user_id: 2, photo_file_name: nil, photo_content_type: nil, photo_file_size: nil, photo_updated_at: nil},
  {firstname: "Herbie", lastname: "Andrews", email: "test@test.com", activated: true, user_id: 7, photo_file_name: nil, photo_content_type: nil, photo_file_size: nil, photo_updated_at: nil}
])
