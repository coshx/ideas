user = User.find_or_create_by_email('ben@coshx.com') do  |u|
u.email = 'ben@coshx.com'
u.name = 'Ben Taitelbaum'
u.image_url = 'https://lh5.googleusercontent.com/-DOrCnXsucCo/AAAAAAAAAAI/AAAAAAAAACc/3xnD_GEhaoQ/photo.jpg'
u.password = 'jRywDyHN'
auth = u.authentications.new
auth.provider = 'google_oauth2'
auth.uid = '117760357840569736229'
auth.save!
end
user.save!
user = User.find_or_create_by_email('mikhail@coshx.com') do  |u|
u.email = 'mikhail@coshx.com'
u.name = 'Michael Makarov'
u.image_url = 'https://lh4.googleusercontent.com/-49H1YIMLM0k/AAAAAAAAAAI/AAAAAAAAABk/tjNwGNAXO4E/photo.jpg'
u.password = 'x7aaBKgo'
auth = u.authentications.new
auth.provider = 'google_oauth2'
auth.uid = '102598203320652223240'
auth.save!
end
user.save!
user = User.find_or_create_by_email('gabe@coshx.com') do  |u|
u.email = 'gabe@coshx.com'
u.name = 'Gabe Kopley'
u.image_url = ''
u.password = '7sytaz9h'
auth = u.authentications.new
auth.provider = 'google_oauth2'
auth.uid = '104331641439296424561'
auth.save!
end
user.save!
user = User.find_or_create_by_email('owen@coshx.com') do  |u|
u.email = 'owen@coshx.com'
u.name = 'Owen Larkin'
u.image_url = ''
u.password = 'p6VYCPdJ'
auth = u.authentications.new
auth.provider = 'google_oauth2'
auth.uid = '114959062193999626897'
auth.save!
end
user.save!
user = User.find_or_create_by_email('davidkapp@coshx.com') do  |u|
u.email = 'davidkapp@coshx.com'
u.name = 'David Kapp'
u.image_url = ''
u.password = 'aDVLw2F4'
auth = u.authentications.new
auth.provider = 'google_oauth2'
auth.uid = '108545719793465070003'
auth.save!
end
user.save!
user = User.find_or_create_by_email('josh@coshx.com') do  |u|
u.email = 'josh@coshx.com'
u.name = 'Josh Rohrbaugh'
u.image_url = ''
u.password = 'ixMWk1cf'
auth = u.authentications.new
auth.provider = 'google_oauth2'
auth.uid = '102186182164223601908'
auth.save!
end
user.save!
user = User.find_or_create_by_email('calvin@coshx.com') do  |u|
u.email = 'calvin@coshx.com'
u.name = 'Calvin Delamere'
u.image_url = 'https://lh5.googleusercontent.com/-4MRCLz43pzA/AAAAAAAAAAI/AAAAAAAAACA/dfYf_rEvPW8/photo.jpg'
u.password = '-FWfTBtt'
auth = u.authentications.new
auth.provider = 'google_oauth2'
auth.uid = '100446302148346127489'
auth.save!
end
user.save!
user = User.find_or_create_by_email('sang@coshx.com') do  |u|
u.email = 'sang@coshx.com'
u.name = 'Sang Seo'
u.image_url = ''
u.password = 'Kvhukzas'
auth = u.authentications.new
auth.provider = 'google_oauth2'
auth.uid = '118279780595901436878'
auth.save!
end
user.save!
user = User.find_or_create_by_email('ryan@coshx.com') do  |u|
u.email = 'ryan@coshx.com'
u.name = 'Ryan Ahearn'
u.image_url = ''
u.password = 'F6fy1GNJ'
auth = u.authentications.new
auth.provider = 'google_oauth2'
auth.uid = '113419957437404153248'
auth.save!
end
user.save!
user = User.find_or_create_by_email('gil@coshx.com') do  |u|
u.email = 'gil@coshx.com'
u.name = 'Gil Edi'
u.image_url = 'https://lh5.googleusercontent.com/-qhLxNcQrzHY/AAAAAAAAAAI/AAAAAAAAAHM/Dw7Z88B6VCY/photo.jpg'
u.password = 'VK-sccDs'
auth = u.authentications.new
auth.provider = 'google_oauth2'
auth.uid = '110459010637544373941'
auth.save!
end
user.save!

idea = Idea.find_or_create_by_title('Bad Ideas') do  |i|
i.user = User.find_by email:'ben@coshx.com'
i.upvotes = 1
end
v = idea.votes.new
v.user_id = 7
v.save!
idea.save!
idea = Idea.find_or_create_by_title('Idea change background and it fades when the location changes') do  |i|
i.user = User.find_by email:'mikhail@coshx.com'
i.upvotes = 1
end
v = idea.votes.new
v.user_id = 1
v.save!
idea.save!
idea = Idea.find_or_create_by_title('Gamification') do  |i|
i.user = User.find_by email:'gabe@coshx.com'
i.upvotes = 1
end
v = idea.votes.new
v.user_id = 3
v.save!
idea.save!
idea = Idea.find_or_create_by_title('Budget') do  |i|
i.user = User.find_by email:'ben@coshx.com'
i.upvotes = 0
end
idea.save!
idea = Idea.find_or_create_by_title('Get hubot to connect IRC and Hipchat') do  |i|
i.user = User.find_by email:'ben@coshx.com'
i.upvotes = 1
end
v = idea.votes.new
v.user_id = 4
v.save!
idea.save!
idea = Idea.find_or_create_by_title('Coshx Tracker ') do  |i|
i.user = User.find_by email:'mikhail@coshx.com'
i.upvotes = 2
end
v = idea.votes.new
v.user_id = 3
v.save!
v = idea.votes.new
v.user_id = 1
v.save!
idea.save!
idea = Idea.find_or_create_by_title('Hip chat integration/notifications') do  |i|
i.user = User.find_by email:'calvin@coshx.com'
i.upvotes = 4
end
v = idea.votes.new
v.user_id = 7
v.save!
v = idea.votes.new
v.user_id = 8
v.save!
v = idea.votes.new
v.user_id = 1
v.save!
v = idea.votes.new
v.user_id = 10
v.save!
idea.save!
idea = Idea.find_or_create_by_title('Use a drop down to display details on an idea') do  |i|
i.user = User.find_by email:'calvin@coshx.com'
i.upvotes = 2
end
v = idea.votes.new
v.user_id = 8
v.save!
v = idea.votes.new
v.user_id = 7
v.save!
idea.save!
idea = Idea.find_or_create_by_title('cant vote on own ideas') do  |i|
i.user = User.find_by email:'calvin@coshx.com'
i.upvotes = 0
end
idea.save!
idea = Idea.find_or_create_by_title('Idea has many features') do  |i|
i.user = User.find_by email:'calvin@coshx.com'
i.upvotes = 3
end
v = idea.votes.new
v.user_id = 4
v.save!
v = idea.votes.new
v.user_id = 1
v.save!
v = idea.votes.new
v.user_id = 8
v.save!
idea.save!
idea = Idea.find_or_create_by_title('Fix comment avatars') do  |i|
i.user = User.find_by email:'josh@coshx.com'
i.upvotes = 3
end
v = idea.votes.new
v.user_id = 7
v.save!
v = idea.votes.new
v.user_id = 1
v.save!
v = idea.votes.new
v.user_id = 4
v.save!
idea.save!
idea = Idea.find_or_create_by_title('Fix the microphone in Cville') do  |i|
i.user = User.find_by email:'gabe@coshx.com'
i.upvotes = 1
end
v = idea.votes.new
v.user_id = 1
v.save!
idea.save!
idea = Idea.find_or_create_by_title('Improve Commenting') do  |i|
i.user = User.find_by email:'josh@coshx.com'
i.upvotes = 2
end
v = idea.votes.new
v.user_id = 8
v.save!
v = idea.votes.new
v.user_id = 1
v.save!
idea.save!
idea = Idea.find_or_create_by_title('Deleting Ideas') do  |i|
i.user = User.find_by email:'josh@coshx.com'
i.upvotes = 3
end
v = idea.votes.new
v.user_id = 5
v.save!
v = idea.votes.new
v.user_id = 8
v.save!
v = idea.votes.new
v.user_id = 1
v.save!
idea.save!
idea = Idea.find_or_create_by_title('Tagging Ideas') do  |i|
i.user = User.find_by email:'josh@coshx.com'
i.upvotes = 5
end
v = idea.votes.new
v.user_id = 1
v.save!
v = idea.votes.new
v.user_id = 4
v.save!
v = idea.votes.new
v.user_id = 3
v.save!
v = idea.votes.new
v.user_id = 7
v.save!
v = idea.votes.new
v.user_id = 10
v.save!
idea.save!
idea = Idea.find_or_create_by_title('Show Status') do  |i|
i.user = User.find_by email:'ben@coshx.com'
i.upvotes = 1
end
v = idea.votes.new
v.user_id = 1
v.save!
idea.save!
idea = Idea.find_or_create_by_title('Show progress') do  |i|
i.user = User.find_by email:'ben@coshx.com'
i.upvotes = 2
end
v = idea.votes.new
v.user_id = 3
v.save!
v = idea.votes.new
v.user_id = 1
v.save!
idea.save!
idea = Idea.find_or_create_by_title('Email Notifications') do  |i|
i.user = User.find_by email:'ben@coshx.com'
i.upvotes = 1
end
v = idea.votes.new
v.user_id = 1
v.save!
idea.save!