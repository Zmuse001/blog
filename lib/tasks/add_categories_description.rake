namespace :backfill do
    desc 'Backfill existing categories with descriptions'
    task add_category_descriptions => :environment do
      # Your backfill logic goes here
      description = {
        "General" => "Explore a variety of topics to stay informed"
        "Technology" => "Stay up to date on the latest news in the tech world"
        "Travel" => "Embark on a journey of discovery with tarvel-related articles, tips and destination guides"
        "Food" => "indulge in a culinary adventure and get the latest guides and recipes"
        "Fashion" => "Dive into the world of fashion, trends, and style inspirations to express your unique personality"
      }
      Category.where(description: nil).each do |category|
        description - description[category.name]

        category.update!(description: description) # Replace with your logic
        puts "Backfill description for each category `#{category.name}"
      end
    end
  end