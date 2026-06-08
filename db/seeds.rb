# db/seeds.rb
# Seed data for wine_prediction API

Wine.destroy_all
WineProfileTasteParameter.destroy_all
WineTasteParameter.destroy_all
WineProfile.destroy_all
TasteParameter.destroy_all


# Create taste parameters
taste_params_data = [
  { identification: 'acidity', label: 'Acidity', low: 'Soft', high: 'Sharp', help: 'How bright, fresh, or mouth-watering the wine feels.' },
  { identification: 'body', label: 'Body', low: 'Light', high: 'Full', help: 'The weight and richness of the wine on your palate.' },
  { identification: 'tannin', label: 'Tannin', low: 'Silky', high: 'Grippy', help: 'The drying texture, common in red wines.' },
  { identification: 'sweetness', label: 'Sweetness', low: 'Dry', high: 'Sweet', help: 'How much sugar or ripe sweetness you perceive.' },
  { identification: 'alcohol', label: 'Alcohol warmth', low: 'Cool', high: 'Warm', help: 'The heat or weight from alcohol.' },
  { identification: 'fruit', label: 'Fruit intensity', low: 'Subtle', high: 'Expressive', help: 'How strongly fruit aromas and flavors stand out.' }
]

identification = 'body'
line = taste_params_data.find { |item| item[:identification] == identification }
puts line.inspect

# taste_params = TasteParameter.create(taste_params_data.map { |tp| {
#   identification: tp[:identification],
#   label: tp[:label],
#   low: tp[:low],
#   high: tp[:high],
#   help: tp[:help]
# } })

# # Create wine profiles
# wine_profiles_data = [
#   {
#     identification: 'pinot-noir',
#     name: 'Pinot Noir',
#     color: 'Red',
#     grapes: ['Pinot Noir'],
#     regions: ['Burgundy', 'Oregon', 'New Zealand'],
#     notes: ['cherry', 'raspberry', 'earth', 'violet'],
#     serving: 'Great with roast chicken, mushrooms, salmon, and charcuterie.',
#     parameters: {
#       acidity: 4,
#       body: 2,
#       tannin: 2,
#       sweetness: 1,
#       alcohol: 2,
#       fruit: 3
#     }
#   },
#   {
#     identification: 'cabernet-sauvignon',
#     name: 'Cabernet Sauvignon',
#     color: 'Red',
#     grapes: ['Cabernet Sauvignon'],
#     regions: ['Bordeaux', 'Napa Valley', 'Coonawarra'],
#     notes: ['blackcurrant', 'cedar', 'graphite', 'mint'],
#     serving: 'Built for steak, lamb, hard cheeses, and richer sauces.',
#     parameters: {
#       acidity: 3,
#       body: 5,
#       tannin: 5,
#       sweetness: 1,
#       alcohol: 4,
#       fruit: 4
#     }
#   },
#   {
#     identification: 'merlot',
#     name: 'Merlot',
#     color: 'Red',
#     grapes: ['Merlot'],
#     regions: ['Right Bank Bordeaux', 'Washington State', 'Chile'],
#     notes: ['plum', 'black cherry', 'cocoa', 'bay leaf'],
#     serving: 'Easy with burgers, roast pork, tomato pasta, and soft cheeses.',
#     parameters: {
#       acidity: 3,
#       body: 4,
#       tannin: 3,
#       sweetness: 1,
#       alcohol: 3,
#       fruit: 4
#     }
#   },
#   {
#     identification: 'syrah-shiraz',
#     name: 'Syrah / Shiraz',
#     color: 'Red',
#     grapes: ['Syrah', 'Shiraz'],
#     regions: ['Northern Rhone', 'Barossa Valley', 'McLaren Vale'],
#     notes: ['blackberry', 'pepper', 'smoke', 'olive'],
#     serving: 'Strong match for barbecue, grilled vegetables, lamb, and spices.',
#     parameters: {
#       acidity: 3,
#       body: 5,
#       tannin: 4,
#       sweetness: 1,
#       alcohol: 4,
#       fruit: 5
#     }
#   },
#   {
#     identification: 'sangiovese',
#     name: 'Sangiovese',
#     color: 'Red',
#     grapes: ['Sangiovese'],
#     regions: ['Chianti', 'Brunello di Montalcino', 'Tuscany'],
#     notes: ['red cherry', 'tomato leaf', 'dried herbs', 'leather'],
#     serving: 'A natural partner for pizza, pasta, ragù, and grilled meats.',
#     parameters: {
#       acidity: 5,
#       body: 3,
#       tannin: 4,
#       sweetness: 1,
#       alcohol: 3,
#       fruit: 3
#     }
#   },
#   {
#     identification: 'chardonnay',
#     name: 'Chardonnay',
#     color: 'White',
#     grapes: ['Chardonnay'],
#     regions: ['Burgundy', 'California', 'Margaret River'],
#     notes: ['apple', 'citrus', 'butter', 'vanilla'],
#     serving: 'Works with roast chicken, creamy sauces, seafood, and corn.',
#     parameters: {
#       acidity: 3,
#       body: 4,
#       tannin: 1,
#       sweetness: 1,
#       alcohol: 3,
#       fruit: 3
#     }
#   },
#   {
#     identification: 'sauvignon-blanc',
#     name: 'Sauvignon Blanc',
#     color: 'White',
#     grapes: ['Sauvignon Blanc'],
#     regions: ['Marlborough', 'Loire Valley', 'Adelaide Hills'],
#     notes: ['lime', 'passionfruit', 'grass', 'gooseberry'],
#     serving: 'Bright with goat cheese, salads, prawns, herbs, and citrus.',
#     parameters: {
#       acidity: 5,
#       body: 2,
#       tannin: 1,
#       sweetness: 1,
#       alcohol: 2,
#       fruit: 4
#     }
#   },
#   {
#     identification: 'riesling',
#     name: 'Riesling',
#     color: 'White',
#     grapes: ['Riesling'],
#     regions: ['Mosel', 'Clare Valley', 'Alsace'],
#     notes: ['lime', 'green apple', 'jasmine', 'petrol'],
#     serving: 'Excellent with spicy food, pork, seafood, and salty snacks.',
#     parameters: {
#       acidity: 5,
#       body: 2,
#       tannin: 1,
#       sweetness: 3,
#       alcohol: 2,
#       fruit: 4
#     }
#   },
#   {
#     identification: 'prosecco',
#     name: 'Prosecco',
#     color: 'Sparkling',
#     grapes: ['Glera'],
#     regions: ['Veneto', 'Friuli'],
#     notes: ['pear', 'apple blossom', 'melon', 'lemon'],
#     serving: 'Pour with brunch, fried snacks, fresh fruit, and aperitivo plates.',
#     parameters: {
#       acidity: 4,
#       body: 1,
#       tannin: 1,
#       sweetness: 2,
#       alcohol: 1,
#       fruit: 4
#     }
#   },
#   {
#     identification: 'rose',
#     name: 'Dry Rose',
#     color: 'Rose',
#     grapes: ['Grenache', 'Cinsault', 'Syrah'],
#     regions: ['Provence', 'Bandol', 'South Australia'],
#     notes: ['strawberry', 'watermelon', 'citrus', 'white flowers'],
#     serving: 'Flexible with seafood, picnic food, grilled chicken, and mezze.',
#     parameters: {
#       acidity: 4,
#       body: 2,
#       tannin: 1,
#       sweetness: 1,
#       alcohol: 2,
#       fruit: 3
#     }
#   }
# ]

# wine_profiles = WineProfile.create(wine_profiles_data.map { |wp| {
#   identification: wp[:identification],
#   name: wp[:name],
#   color: wp[:color],
#   grapes: wp[:grapes].to_json,
#   regions: wp[:regions].to_json,
#   notes: wp[:notes].to_json,
#   serving: wp[:serving],
#   # parameters: wp[:parameters].to_json
# } })

# # Create wine profile taste parameters
# initial_taste = 3
# wine_profiles.each do |wine_profile|
#   taste_params_data.each do |taste_param|
#     WineProfileTasteParameter.create(
#       wine_profile: wine_profile,
#       taste_parameter: TasteParameter.find_by(identification: taste_param[:identification]),
#       score: initial_taste
#     )
#   end
# end

# # Create wine test cases (australianWineTests)
# australian_wine_tests_data = [
#   {
#     identification: 'penfolds-bin-389',
#     name: 'Penfolds Bin 389 Cabernet Shiraz',
#     region: 'South Australia',
#     color: 'Red',
#     prompt: 'Classic Australian cabernet shiraz: dark fruit, structure, oak spice, and generous weight.',
#     parameters: {
#       acidity: 3,
#       body: 5,
#       tannin: 4,
#       sweetness: 1,
#       alcohol: 4,
#       fruit: 5
#     }
#   },
#   {
#     identification: 'henschke-hill-of-grace',
#     name: 'Henschke Hill of Grace Shiraz',
#     region: 'Eden Valley, South Australia',
#     color: 'Red',
#     prompt: 'A powerful but detailed old-vine shiraz style with spice, dark berries, and firm structure.',
#     parameters: {
#       acidity: 3,
#       body: 5,
#       tannin: 4,
#       sweetness: 1,
#       alcohol: 4,
#       fruit: 4
#     }
#   },
#   {
#     identification: 'leeuwin-estate-art-series',
#     name: 'Leeuwin Estate Art Series Chardonnay',
#     region: 'Margaret River, Western Australia',
#     color: 'White',
#     prompt: 'Premium Margaret River chardonnay: citrus, stone fruit, creamy texture, and polished oak.',
#     parameters: {
#       acidity: 4,
#       body: 4,
#       tannin: 1,
#       sweetness: 1,
#       alcohol: 3,
#       fruit: 4
#     }
#   },
#   {
#     identification: 'grosset-polish-hill',
#     name: 'Grosset Polish Hill Riesling',
#     region: 'Clare Valley, South Australia',
#     color: 'White',
#     prompt: 'Dry Clare Valley riesling: lime, floral lift, high acidity, and a lean mineral feel.',
#     parameters: {
#       acidity: 5,
#       body: 1,
#       tannin: 1,
#       sweetness: 1,
#       alcohol: 2,
#       fruit: 3
#     }
#   },
#   {
#     identification: 'tyrrells-vat-1-semillon',
#     name: "Tyrrell's Vat 1 Semillon",
#     region: 'Hunter Valley, New South Wales',
#     color: 'White',
#     prompt: 'Classic Hunter semillon: light, dry, lemony, low alcohol, and very crisp when young.',
#     parameters: {
#       acidity: 5,
#       body: 1,
#       tannin: 1,
#       sweetness: 1,
#       alcohol: 1,
#       fruit: 2
#     }
#   },
#   {
#     identification: 'giaconda-chardonnay',
#     name: 'Giaconda Estate Vineyard Chardonnay',
#     region: 'Beechworth, Victoria',
#     color: 'White',
#     prompt: 'Intense Victorian chardonnay with citrus, stone fruit, texture, oak detail, and strong freshness.',
#     parameters: {
#       acidity: 4,
#       body: 4,
#       tannin: 1,
#       sweetness: 1,
#       alcohol: 3,
#       fruit: 4
#     }
#   },
#   {
#     identification: 'yalumba-signature',
#     name: 'Yalumba The Signature Cabernet Shiraz',
#     region: 'Barossa, South Australia',
#     color: 'Red',
#     prompt: 'Australian cabernet shiraz blend: cassis, plum, spice, firm tannin, and generous body.',
#     parameters: {
#       acidity: 3,
#       body: 5,
#       tannin: 4,
#       sweetness: 1,
#       alcohol: 4,
#       fruit: 5
#     }
#   },
#   {
#     identification: 'tolpuddle-pinot-noir',
#     name: 'Tolpuddle Vineyard Pinot Noir',
#     region: 'Coal River Valley, Tasmania',
#     color: 'Red',
#     prompt: 'Cool-climate Tasmanian pinot: red cherry, perfume, bright acidity, fine tannin, and medium-light body.',
#     parameters: {
#       acidity: 4,
#       body: 2,
#       tannin: 2,
#       sweetness: 1,
#       alcohol: 2,
#       fruit: 3
#     }
#   },
#   {
#     identification: 'de-bortoli-noble-one',
#     name: 'De Bortoli Noble One Botrytis Semillon',
#     region: 'Riverina, New South Wales',
#     color: 'Dessert',
#     prompt: 'Sweet botrytis semillon: honey, apricot, marmalade, rich body, and balancing acidity.',
#     parameters: {
#       acidity: 4,
#       body: 4,
#       tannin: 1,
#       sweetness: 5,
#       alcohol: 2,
#       fruit: 5
#     }
#   },
#   {
#     identification: 'rockford-basket-press',
#     name: 'Rockford Basket Press Shiraz',
#     region: 'Barossa Valley, South Australia',
#     color: 'Red',
#     prompt: 'Traditional Barossa shiraz: ripe blackberry, dark plum, spice, full body, and warm alcohol.',
#     parameters: {
#       acidity: 3,
#       body: 5,
#       tannin: 4,
#       sweetness: 1,
#       alcohol: 5,
#       fruit: 5
#     }
#   }
# ]

# wine_tests = Wine.create(australian_wine_tests_data.map { |wt| {
#   identification: wt[:identification],
#   name: wt[:name],
#   region: wt[:region],
#   color: wt[:color],
#   prompt: wt[:prompt],
#   # parameters: wt[:parameters].to_json
# } })

# # Create wine taste parameters for test cases
# wine_tests.each do |wine_test|
#   wine_test.parameters.parsed_parameters.each do |param|
#     WineTasteParameter.create(
#       wine: wine_test,
#       taste_parameter: TasteParameter.find_by(identification: param[:identification]),
#       score: param[:value]
#     )
#   end
# end