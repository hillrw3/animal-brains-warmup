Brain.destroy_all

File.open("#{Rails.root}/lib/assets/Animals.csv") do |animals|
  animals.read.each_line do |animal|
    animal, body, brain = animal.chomp.split(',')
    animal.gsub!(/\A"|"\Z/, '')
    Brain.create!(animal: animal, body: body, brain: brain)
  end
end

Brain.first.destroy