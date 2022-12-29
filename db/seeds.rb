# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


data = {
  'ULTHERA': [
    'Ліфтинг брів та верхніх повік',
    'Нижні повіки',
    'Нижні повіки+скроні+верхні повіки',
    'Кисетні зморшки',
    'Шия',
    'Зона маляру',
    'Декольте',
    'Нижня і середня третина обличчя (овал)',
    'Підборідна зона',
    'Ніс',
    'Все обличчя (брови, скроні, нижні повіки, нижня і середня третина обличчя та підборідна зона)',
    '1 лінія'
  ],
  'ЗБІЛЬШЕННЯ ГУБ': [
    'Juvederm Volift Retouch (0,55 ml)',
    'Juvederm Smile (0,55ml)', 'Juvederm Ultra 3 (1 ml)',
    'Juvederm Ultra 4(1 ml)', 'Juvederm Volift (1 ml)',
    'Belotero Intense (1 ml)', 'Belotero Lips (0,6 ml)', 'Teosyal Kiss (0,7 ml)'
  ],
  'RADIESSE': ['Radiesse (1,5 ml)'],
  'КОРЕКЦІЯ СКУЛ': ['Juvederm Ultra 4 (1 ml)', 'Juvederm Voluma (1 ml)', 'Belotero Volume (1 ml)'],
  'КОРЕКЦІЯ ПІДБОРІДДЯ': ['Juvederm Volux (1 ml)', 'Juvederm Ultra 4(1ml)', 'Juvederm Voluma (1 ml)', 'Belotero Volume (1 ml)','Teosyal ultra deep (1 ml)'],
  'КУТИ НИЖНЬОЇ ЩЕЛЕПИ': ['Juvederm Volux (1 ml)', 'Juvederm Ultra 4(1ml)', 'Juvederm Voluma (1 ml)', 'Belotero Volume (1 ml)','Teosyal ultra deep (1 ml)'],
  'КОРЕКЦІЯ НОСОСЛІЗНОЇ БОРОЗДИ': ['Teosyal Redensity 2 (1 ml)', 'Belotero Intense (1 ml)'],
  'ГІАЛУРОНІДАЗА': ['ГІАЛУРОНІДАЗА'],
  'БОТУЛІНОТЕРАПІЯ': ['Міжбрів‘я', 'Лоб', 'Очі', 'Зморшки кролика', 'Підборіддя', 'Кути губ', 'Гінгівальна посмішка', 'Кисетні зморшки', 'Підняття брів', 'Ліфтинг «Нефертіті»', 'Жувальний м‘яз'],
  'ГІПЕРГІДРОЗ': ['Пахви', 'Стопи', 'Долоні'],
  'БЛАНШИНГ': ['Belotero soft (1 ml)', 'Belotero balance (1 ml)'],
  'НИТКИ APTOS': ['Excellence visage classic (10 шт)', 'Excellence visage soft (10 шт)', 'Light lift thread 2g (1 уп.)', 'Light lift needle 2g (1 уп.)', 'Nano vitis 4 (5 штук)'],
  'КОНСУЛЬТАЦІЯ': ['консультація']
}

puts "Clearing zones and medicines"
Zone.destroy_all
Medicine.destroy_all
puts "done"
puts "Creating zones and medicines"
# iterate over the hash
data.each do |zone, medicines|
  # create a zone
  zone_new = Zone.create(title: zone)

  # iterate over the array of medicines
  medicines.each do |medicine|
    # create a medicine
    zone_new.medicines.create(title: medicine)
  end
end
puts "done"
