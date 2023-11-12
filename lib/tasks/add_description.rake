namespace :backfill do
    desc 'Backfill existing categories with descriptions'
    task :categories => :environment do
      # Your backfill logic goes here
      Category.all.each do |category|
        category.update(description: "#{Category}") # Replace with your logic
      end
    end
  end