namespace :logins do
  desc "seed admin"
  task seed_admin: :environment do
    User.destroy_all

    # # create categories
    category_2 = Category.create(name: "Admin")
    category_3 = Category.create(name: "SuperUser")

    all_cats = [ "Admin", "Travel", "Fitness" ]

    # admin username
    username = "arjuna"
    email = "rob.lockhart@yahoo.co.uk"
    password = "password"

    user = User.create!(
                  username: username,
                  email: email,
                  password: password,
                  password_confirmation: password,
                  admin: true
                )

    3.times do |i|
      article = Article.create(title: "#{Faker::Lorem.word}_#{i}", description: "#{Faker::Lorem.paragraph}_#{i}", user_id: user.id)
      ArticleCategory.create(article_id: article.id, category_id: category_2.id)
      ArticleCategory.create(article_id: article.id, category_id: category_3.id)

      # puts "#{i} : all_cats : #{all_cats}"
      # all_cats.each do |cat|
      #   cat_name = Category.create(name: "category_#{cat}")
      #   puts "### :: cat_name: #{cat_name.name}"

      #   alt_cat = ArticleCategory.create(article_id: article.id, category_id: cat_name.id)
      #   puts "article_category: #{ArticleCategory.count} :"
      # end
    end
  end

  desc "seed users"
  task seed_users: :environment do
    # create categories
    category_1 = Category.create(name: "Sports")
    category_2 = Category.create(name: "Fitness")
    category_4 = Category.create(name: "Health")


    5.times do |i|
      password = "password"
      user = User.create!(
                    username: "user_#{i}",
                    email: "email_#{i}@test.com",
                    password: password,
                    password_confirmation: password,
                    admin: false
                  )

      2.times do |i|
        article = Article.create(title: "#{Faker::Lorem.word}_#{i}", description: "#{Faker::Lorem.paragraph}_#{i}", user_id: user.id)
        ArticleCategory.create(article_id: article.id, category_id: category_1.id)
        ArticleCategory.create(article_id: article.id, category_id: category_2.id)
        ArticleCategory.create(article_id: article.id, category_id: category_4.id)
      end
    end
  end
end
