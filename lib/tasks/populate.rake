namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    6.times do |n|
      puts "[DEBUG] creating user #{n+1} of 10"
      name = Faker::Name.name
      email = "test-user-#{n+1}@example.com"
      password = "password"
      User.create!( name: name,
                    email: email,
                    password: password,
                    password_confirmation: password)
    end

    User.all.each do |user|
      puts "[DEBUG] uploading images for user #{user.id} of #{User.last.id}"
      6.times do |n|
        # image = File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample)
        image = %w(http://www.tomatobubble.com/sitebuildercontent/sitebuilderpictures/hitler-and-child.jpg 
        		   http://www.tomatobubble.com/sitebuildercontent/sitebuilderpictures/Hitlerod.jpg
        		   http://www.tomatobubble.com/sitebuildercontent/sitebuilderpictures/.pond/youth1.jpg.w560h380.jpg
        		   http://www.tomatobubble.com/sitebuildercontent/sitebuilderpictures/Hitleberg.jpg
        		   http://www.tomatobubble.com/sitebuildercontent/sitebuilderpictures/HitleDM.jpg
        		   http://www.tomatobubble.com/sitebuildercontent/sitebuilderpictures/Duk937.jpg
        		   http://www.tomatobubble.com/sitebuildercontent/sitebuilderpictures/2009Berghof.jpg
        		   http://www.tomatobubble.com/sitebuildercontent/sitebuilderpictures/azgxp1.jpg
        		   http://www.tomatobubble.com/sitebuildercontent/sitebuilderpictures/ah_fawn.jpg
        		   http://www.tomatobubble.com/sitebuildercontent/sitebuilderpictures/Adolf_Hitler.jpg
        		   http://www.tomatobubble.com/sitebuildercontent/sitebuilderpictures/hitlerlg.jpg
        		   http://www.tomatobubble.com/sitebuildercontent/sitebuilderpictures/Hitleether.jpeg
        		   http://www.tomatobubble.com/sitebuildercontent/sitebuilderpictures/mufti539.jpg
        		   http://timelifeblog.files.wordpress.com/2012/04/13_47-35.jpg?w=737
        		   http://timelifeblog.files.wordpress.com/2012/04/15_47-29.jpg?w=738
        		   http://scallywagandvagabond.com/wp-content/uploads/2012/02/adolf_hitler_20100527_1185227214.jpg
        		   https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcR5bEMGU2o6nP3wjLmrngB_CHRnvIZZW5Ij9VOlHfcjLDyecjr8XA
        		   http://deathandtaxesmag.wpengine.netdna-cdn.com/wp-content/uploads/2013/02/hitler_1881083c.jpeg
        		   http://www.counter-currents.com/wp-content/uploads/2011/04/09hitler.jpg
        		   http://sz-n.com/wp-content/uploads/2013/05/Adolf-Hitler.jpg
        		   http://www.orange-papers.org/orange-Hitler11cx.jpg
        		   http://www.museumsyndicate.com/images/artists/12.jpg
        		   http://www.inquisitr.com/wp-content/2012/12/large1-e1356906903676.jpg
        		   http://img.timeinc.net/time/daily/2011/1106/hitler_0607.jpg).sample
        description = %w(cool awesome crazy wow adorbs incredible).sample
        user.pins.create!(image_remote_url: image, description: description)
      end
    end
  end
end