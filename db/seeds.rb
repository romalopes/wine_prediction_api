# db/seeds.rb
# Seed data for wine_prediction API

Wine.destroy_all
WineProfile.destroy_all
TasteParameter.destroy_all
WineProfileTasteParameter.destroy_all
WineTasteParameter.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!("wines")
ActiveRecord::Base.connection.reset_pk_sequence!("wine_profiles")
ActiveRecord::Base.connection.reset_pk_sequence!("taste_parameters")
ActiveRecord::Base.connection.reset_pk_sequence!("wine_profile_taste_parameters")
ActiveRecord::Base.connection.reset_pk_sequence!("wine_taste_parameters")


# Create taste parameters
taste_params_data = [
  { slug: 'acidity', label: 'Acidity', low: 'Soft', high: 'Sharp', help: 'How bright, fresh, or mouth-watering the wine feels.' },
  { slug: 'body', label: 'Body', low: 'Light', high: 'Full', help: 'The weight and richness of the wine on your palate.' },
  { slug: 'tannin', label: 'Tannin', low: 'Silky', high: 'Grippy', help: 'The drying texture, common in red wines.' },
  { slug: 'sweetness', label: 'Sweetness', low: 'Dry', high: 'Sweet', help: 'How much sugar or ripe sweetness you perceive.' },
  { slug: 'alcohol', label: 'Alcohol warmth', low: 'Cool', high: 'Warm', help: 'The heat or weight from alcohol.' },
  { slug: 'fruit', label: 'Fruit intensity', low: 'Subtle', high: 'Expressive', help: 'How strongly fruit aromas and flavors stand out.' }
]

p = {
  pinotNoir: {
    acidity: 4,
    body: 2,
    tannin: 2,
    sweetness: 1,
    alcohol: 2,
    fruit: 3,
  },
  cab: { acidity: 3, body: 5, tannin: 5, sweetness: 1, alcohol: 4, fruit: 4 },
  merlot: {
    acidity: 3,
    body: 4,
    tannin: 3,
    sweetness: 1,
    alcohol: 3,
    fruit: 4,
  },
  syrah: { acidity: 3, body: 5, tannin: 4, sweetness: 1, alcohol: 4, fruit: 5 },
  sangiovese: {
    acidity: 5,
    body: 3,
    tannin: 4,
    sweetness: 1,
    alcohol: 3,
    fruit: 3,
  },
  chardonnay: {
    acidity: 3,
    body: 4,
    tannin: 1,
    sweetness: 1,
    alcohol: 3,
    fruit: 3,
  },
  sauvBlanc: {
    acidity: 5,
    body: 2,
    tannin: 1,
    sweetness: 1,
    alcohol: 2,
    fruit: 4,
  },
  riesling: {
    acidity: 5,
    body: 2,
    tannin: 1,
    sweetness: 3,
    alcohol: 2,
    fruit: 4,
  },
  prosecco: {
    acidity: 4,
    body: 1,
    tannin: 1,
    sweetness: 2,
    alcohol: 1,
    fruit: 4,
  },
  rose: { acidity: 4, body: 2, tannin: 1, sweetness: 1, alcohol: 2, fruit: 3 },
  tempranillo: {
    acidity: 4,
    body: 4,
    tannin: 4,
    sweetness: 1,
    alcohol: 3,
    fruit: 4,
  },
  malbec: {
    acidity: 3,
    body: 5,
    tannin: 4,
    sweetness: 1,
    alcohol: 4,
    fruit: 5,
  },
  zinfandel: {
    acidity: 3,
    body: 5,
    tannin: 4,
    sweetness: 2,
    alcohol: 5,
    fruit: 5,
  },
  nebbiolo: {
    acidity: 4,
    body: 4,
    tannin: 5,
    sweetness: 1,
    alcohol: 4,
    fruit: 3,
  },
  gamay: { acidity: 4, body: 2, tannin: 2, sweetness: 1, alcohol: 2, fruit: 4 },
  pinotGrigio: {
    acidity: 4,
    body: 2,
    tannin: 1,
    sweetness: 1,
    alcohol: 2,
    fruit: 3,
  },
  pinotGris: {
    acidity: 3,
    body: 3,
    tannin: 1,
    sweetness: 2,
    alcohol: 3,
    fruit: 4,
  },
  viognier: {
    acidity: 3,
    body: 4,
    tannin: 1,
    sweetness: 2,
    alcohol: 4,
    fruit: 5,
  },
  gewurz: {
    acidity: 3,
    body: 4,
    tannin: 1,
    sweetness: 3,
    alcohol: 4,
    fruit: 5,
  },
  chenin: {
    acidity: 5,
    body: 3,
    tannin: 1,
    sweetness: 2,
    alcohol: 2,
    fruit: 3,
  },
  semillon: {
    acidity: 4,
    body: 2,
    tannin: 1,
    sweetness: 1,
    alcohol: 2,
    fruit: 2,
  },
  gruner: {
    acidity: 4,
    body: 3,
    tannin: 1,
    sweetness: 1,
    alcohol: 3,
    fruit: 3,
  },
  albarino: {
    acidity: 5,
    body: 2,
    tannin: 1,
    sweetness: 1,
    alcohol: 2,
    fruit: 4,
  },
  verdejo: {
    acidity: 4,
    body: 2,
    tannin: 1,
    sweetness: 1,
    alcohol: 2,
    fruit: 3,
  },
  champagne: {
    acidity: 5,
    body: 2,
    tannin: 1,
    sweetness: 1,
    alcohol: 3,
    fruit: 3,
  },
  cava: { acidity: 4, body: 2, tannin: 1, sweetness: 1, alcohol: 2, fruit: 3 },
  franciacorta: {
    acidity: 4,
    body: 3,
    tannin: 1,
    sweetness: 1,
    alcohol: 3,
    fruit: 3,
  },
  moscato: {
    acidity: 4,
    body: 2,
    tannin: 1,
    sweetness: 5,
    alcohol: 1,
    fruit: 5,
  },
  sauternes: {
    acidity: 4,
    body: 4,
    tannin: 1,
    sweetness: 5,
    alcohol: 3,
    fruit: 5,
  },
  port: { acidity: 3, body: 4, tannin: 3, sweetness: 5, alcohol: 4, fruit: 4 },
  sherry: {
    acidity: 3,
    body: 4,
    tannin: 1,
    sweetness: 2,
    alcohol: 5,
    fruit: 3,
  },
  pinotage: {
    acidity: 3,
    body: 4,
    tannin: 3,
    sweetness: 1,
    alcohol: 4,
    fruit: 4,
  },
  torrontes: {
    acidity: 4,
    body: 2,
    tannin: 1,
    sweetness: 1,
    alcohol: 3,
    fruit: 5,
  },
  superTuscan: {
    acidity: 4,
    body: 5,
    tannin: 4,
    sweetness: 1,
    alcohol: 4,
    fruit: 4,
  },
};

wine_profiles_data = [
  {
    slug: "pinot-noir",
    name: "Pinot Noir",
    color: "Red",
    grapes: ["Pinot Noir"],
    regions: ["Burgundy", "Oregon", "New Zealand"],
    notes: ["cherry", "raspberry", "earth", "violet"],
    serving: "Great with roast chicken, mushrooms, salmon, and charcuterie.",
    # # image: img("Red"),
    parameters: p[:pinotNoir],
  },
  {
    slug: "cabernet-sauvignon",
    name: "Cabernet Sauvignon",
    color: "Red",
    grapes: ["Cabernet Sauvignon"],
    regions: ["Bordeaux", "Napa Valley", "Coonawarra"],
    notes: ["blackcurrant", "cedar", "graphite", "mint"],
    serving: "Built for steak, lamb, hard cheeses, and richer sauces.",
    # image: img("Red"),
    parameters: p[:cab],
  },
  {
    slug: "merlot",
    name: "Merlot",
    color: "Red",
    grapes: ["Merlot"],
    regions: ["Right Bank Bordeaux", "Washington State", "Chile"],
    notes: ["plum", "black cherry", "cocoa", "bay leaf"],
    serving: "Easy with burgers, roast pork, tomato pasta, and soft cheeses.",
    # image: img("Red"),
    parameters: p[:merlot],
  },
  {
    slug: "syrah-shiraz",
    name: "Syrah / Shiraz",
    color: "Red",
    grapes: ["Syrah", "Shiraz"],
    regions: ["Northern Rhone", "Barossa Valley", "McLaren Vale"],
    notes: ["blackberry", "pepper", "smoke", "olive"],
    serving: "Strong match for barbecue, grilled vegetables, lamb, and spices.",
    # image: img("Red"),
    parameters: p[:syrah],
  },
  {
    slug: "sangiovese",
    name: "Sangiovese",
    color: "Red",
    grapes: ["Sangiovese"],
    regions: ["Chianti", "Brunello di Montalcino", "Tuscany"],
    notes: ["red cherry", "tomato leaf", "dried herbs", "leather"],
    serving: "A natural partner for pizza, pasta, ragu, and grilled meats.",
    # image: img("Red"),
    parameters: p[:sangiovese],
  },
  {
    slug: "chardonnay",
    name: "Chardonnay",
    color: "White",
    grapes: ["Chardonnay"],
    regions: ["Burgundy", "California", "Margaret River"],
    notes: ["apple", "citrus", "butter", "vanilla"],
    serving: "Works with roast chicken, creamy sauces, seafood, and corn.",
    # image: img("White"),
    parameters: p[:chardonnay],
  },
  {
    slug: "sauvignon-blanc",
    name: "Sauvignon Blanc",
    color: "White",
    grapes: ["Sauvignon Blanc"],
    regions: ["Marlborough", "Loire Valley", "Adelaide Hills"],
    notes: ["lime", "passionfruit", "grass", "gooseberry"],
    serving: "Bright with goat cheese, salads, prawns, herbs, and citrus.",
    # image: img("White"),
    parameters: p[:sauvBlanc],
  },
  {
    slug: "riesling",
    name: "Riesling",
    color: "White",
    grapes: ["Riesling"],
    regions: ["Mosel", "Clare Valley", "Alsace"],
    notes: ["lime", "green apple", "jasmine", "petrol"],
    serving: "Excellent with spicy food, pork, seafood, and salty snacks.",
    # image: img("White"),
    parameters: p[:riesling],
  },
  {
    slug: "prosecco",
    name: "Prosecco",
    color: "Sparkling",
    grapes: ["Glera"],
    regions: ["Veneto", "Friuli"],
    notes: ["pear", "apple blossom", "melon", "lemon"],
    serving:
      "Pour with brunch, fried snacks, fresh fruit, and aperitivo plates.",
    # image: img("Sparkling"),
    parameters: p[:prosecco],
  },
  {
    slug: "rose",
    name: "Dry Rose",
    color: "Rose",
    grapes: ["Grenache", "Cinsault", "Syrah"],
    regions: ["Provence", "Bandol", "South Australia"],
    notes: ["strawberry", "watermelon", "citrus", "white flowers"],
    serving: "Flexible with seafood, picnic food, grilled chicken, and mezze.",
    # image: img("Rose"),
    parameters: p[:rose],
  },
  {
    slug: "tempranillo",
    name: "Tempranillo",
    color: "Red",
    grapes: ["Tempranillo"],
    regions: ["Rioja", "Ribera del Duero", "Toro"],
    notes: ["red cherry", "dried fig", "tobacco", "leather"],
    serving: "Pairs with grilled lamb, chorizo, manchego, and beef stew.",
    # image: img("Red"),
    parameters: p[:tempranillo],
  },
  {
    slug: "malbec",
    name: "Malbec",
    color: "Red",
    grapes: ["Malbec"],
    regions: ["Mendoza", "Cahors", "Patagonia"],
    notes: ["plum", "blackberry", "violet", "cocoa"],
    serving:
      "Perfect with grilled steak, empanadas, barbecue, and blue cheese.",
    # image: img("Red"),
    parameters: p[:malbec],
  },
  {
    slug: "zinfandel",
    name: "Zinfandel",
    color: "Red",
    grapes: ["Zinfandel"],
    regions: ["Sonoma", "Napa Valley", "Paso Robles"],
    notes: ["brambleberry", "jammy fruit", "black pepper", "vanilla"],
    serving: "Great with pulled pork, ribs, smoky barbecue, and pizza.",
    # image: img("Red"),
    parameters: p[:zinfandel],
  },
  {
    slug: "nebbiolo",
    name: "Nebbiolo",
    color: "Red",
    grapes: ["Nebbiolo"],
    regions: ["Piedmont", "Barolo", "Barbaresco"],
    notes: ["tar", "rose", "dried cherry", "truffle"],
    serving:
      "Matches braised beef, risotto, aged hard cheese, and truffle dishes.",
    # image: img("Red"),
    parameters: p[:nebbiolo],
  },
  {
    slug: "gamay",
    name: "Gamay (Beaujolais)",
    color: "Red",
    grapes: ["Gamay"],
    regions: ["Beaujolais", "Loire Valley"],
    notes: ["red berry", "banana", "candy", "floral"],
    serving:
      "Lively with charcuterie, roasted chicken, soft cheeses, and salads.",
    # image: img("Red"),
    parameters: p[:gamay],
  },
  {
    slug: "pinot-grigio",
    name: "Pinot Grigio",
    color: "White",
    grapes: ["Pinot Grigio"],
    regions: ["Friuli", "Trentino", "Veneto"],
    notes: ["lemon zest", "green apple", "pear", "almond"],
    serving: "Clean with seafood pasta, oysters, light salads, and caprese.",
    # image: img("White"),
    parameters: p[:pinotGrigio],
  },
  {
    slug: "pinot-gris",
    name: "Pinot Gris",
    color: "White",
    grapes: ["Pinot Gris"],
    regions: ["Alsace", "Oregon", "New Zealand"],
    notes: ["pear", "honey", "stone fruit", "spice"],
    serving:
      "Versatile with roast pork, asian cuisine, soft cheeses, and pumpkin.",
    # image: img("White"),
    parameters: p[:pinotGris],
  },
  {
    slug: "viognier",
    name: "Viognier",
    color: "White",
    grapes: ["Viognier"],
    regions: ["Condrieu", "Margaret River", "Virginia"],
    notes: ["apricot", "peach", "honeysuckle", "ginger"],
    serving: "Lovely with lobster, scallops, spicy curries, and roast chicken.",
    # image: img("White"),
    parameters: p[:viognier],
  },
  {
    slug: "gewurztraminer",
    name: "Gewurztraminer",
    color: "White",
    grapes: ["Gewurztraminer"],
    regions: ["Alsace", "Pfalz", "Marlborough"],
    notes: ["lychee", "rose petal", "turkish delight", "ginger"],
    serving:
      "Stunning with thai food, indian curries, smoked salmon, and strong cheese.",
    # image: img("White"),
    parameters: p[:gewurz],
  },
  {
    slug: "chenin-blanc",
    name: "Chenin Blanc",
    color: "White",
    grapes: ["Chenin Blanc"],
    regions: ["Loire Valley", "Stellenbosch", "California"],
    notes: ["quince", "honeydew", "chamomile", "wet stone"],
    serving:
      "Bright with roast chicken, pork, goat cheese, and vegetable tarts.",
    # image: img("White"),
    parameters: p[:chenin],
  },
  {
    slug: "semillon",
    name: "Semillon",
    color: "White",
    grapes: ["Semillon"],
    regions: ["Hunter Valley", "Bordeaux", "Margaret River"],
    notes: ["lemon curd", "beeswax", "lanolin", "toast"],
    serving: "Classic with roast chicken, seafood, and creamy pasta.",
    # image: img("White"),
    parameters: p[:semillon],
  },
  {
    slug: "gruner-veltliner",
    name: "Gruner Veltliner",
    color: "White",
    grapes: ["Gruner Veltliner"],
    regions: ["Wachau", "Kamptal", "Kremstal"],
    notes: ["white pepper", "green pea", "lime", "lentil"],
    serving:
      "Beautifully matches schnitzel, asparagus, sushi, and fresh salads.",
    # image: img("White"),
    parameters: p[:gruner],
  },
  {
    slug: "albarino",
    name: "Albarino",
    color: "White",
    grapes: ["Albarino"],
    regions: ["Rias Baixas", "Moncao", "Bairrada"],
    notes: ["saline", "citrus peel", "white peach", "jasmine"],
    serving:
      "Brilliant with grilled octopus, ceviche, sushi, and briny shellfish.",
    # image: img("White"),
    parameters: p[:albarino],
  },
  {
    slug: "verdejo",
    name: "Verdejo",
    color: "White",
    grapes: ["Verdejo"],
    regions: ["Rueda", "La Mancha"],
    notes: ["fennel", "grapefruit", "broom flower", "cut grass"],
    serving:
      "Cuts through garlic prawns, paella, grilled vegetables, and tapas.",
    # image: img("White"),
    parameters: p[:verdejo],
  },
  {
    slug: "champagne",
    name: "Champagne",
    color: "Sparkling",
    grapes: ["Chardonnay", "Pinot Noir", "Pinot Meunier"],
    regions: ["Champagne"],
    notes: ["brioche", "citrus", "green apple", "chalk"],
    serving:
      "Pour with oysters, caviar, fried chicken, and celebration toasts.",
    # image: img("Sparkling"),
    parameters: p[:champagne],
  },
  {
    slug: "cava",
    name: "Cava",
    color: "Sparkling",
    grapes: ["Macabeo", "Parellada", "Xarel.lo"],
    regions: ["Penedes", "Catalonia"],
    notes: ["green apple", "almond", "toast", "lemon"],
    serving: "Lively with patatas bravas, jamon, seafood, and fried snacks.",
    # image: img("Sparkling"),
    parameters: p[:cava],
  },
  {
    slug: "franciacorta",
    name: "Franciacorta",
    color: "Sparkling",
    grapes: ["Chardonnay", "Pinot Nero"],
    regions: ["Lombardy", "Franciacorta"],
    notes: ["almond paste", "white peach", "lemon curd", "biscuit"],
    serving: "Refined with cured meats, sushi, seafood risotto, and aperitivo.",
    # image: img("Sparkling"),
    parameters: p[:franciacorta],
  },
  {
    slug: "moscato-d-asti",
    name: "Moscato d'Asti",
    color: "Dessert",
    grapes: ["Moscato Bianco"],
    regions: ["Asti", "Piedmont"],
    notes: ["orange blossom", "peach", "honey", "grape"],
    serving: "Luscious with panettone, fresh fruit, panna cotta, and pastries.",
    # image: img("Dessert"),
    parameters: p[:moscato],
  },
  {
    slug: "sauternes",
    name: "Sauternes",
    color: "Dessert",
    grapes: ["Semillon", "Sauvignon Blanc", "Muscadelle"],
    regions: ["Bordeaux", "Sauternes", "Barsac"],
    notes: ["apricot", "honey", "ginger", "beeswax"],
    serving:
      "Decadent with foie gras, blue cheese, tarte tatin, and creme brulee.",
    # image: img("Dessert"),
    parameters: p[:sauternes],
  },
  {
    slug: "port-tawny",
    name: "Tawny Port",
    color: "Dessert",
    grapes: ["Touriga Nacional", "Touriga Franca", "Tinta Roriz"],
    regions: ["Douro Valley"],
    notes: ["dried fig", "caramel", "walnut", "orange peel"],
    serving: "Wonderful with stilton, chocolate desserts, and toasted nuts.",
    # image: img("Dessert"),
    parameters: p[:port],
  },
  {
    slug: "sherry-oloroso",
    name: "Oloroso Sherry",
    color: "Dessert",
    grapes: ["Palomino"],
    regions: ["Jerez", "Andalusia"],
    notes: ["walnut", "toffee", "cinnamon", "dried orange"],
    serving: "Sip with aged manchego, olives, almonds, and rich stews.",
    # image: img("Dessert"),
    parameters: p[:sherry],
  },
  {
    slug: "pinotage",
    name: "Pinotage",
    color: "Red",
    grapes: ["Pinotage"],
    regions: ["Stellenbosch", "Franschhoek", "Swartland"],
    notes: ["smoked meat", "plum", "banana", "earthy spice"],
    serving:
      "Barbecue champion - pairs with boerewors, lamb chops, and grilled meats.",
    # image: img("Red"),
    parameters: p[:pinotage],
  },
  {
    slug: "torrontes",
    name: "Torrontes",
    color: "White",
    grapes: ["Torrontes"],
    regions: ["Salta", "Mendoza", "Cafayate"],
    notes: ["grapefruit", "rose", "lychee", "herbal lift"],
    serving:
      "Vivid with ceviche, grilled fish, empanadas, and spicy latin cuisine.",
    # image: img("White"),
    parameters: p[:torrontes],
  },
  {
    slug: "sangiovese-blend-super-tuscan",
    name: "Super Tuscan Blend",
    color: "Red",
    grapes: ["Sangiovese", "Cabernet Sauvignon", "Merlot"],
    regions: ["Tuscany", "Bolgheri"],
    notes: ["dark cherry", "cedar", "leather", "tobacco"],
    serving:
      "Great with bistecca alla fiorentina, rich pasta, and aged pecorino.",
    # image: img("Red"),
    parameters: p[:superTuscan],
  },
];




# Create wine test cases (australianWineTests)
australian_wine_tests_data = [
  {
    slug: 'penfolds-bin-389',
    name: 'Penfolds Bin 389 Cabernet Shiraz',
    region: 'South Australia',
    color: 'Red',
    prompt: 'Classic Australian cabernet shiraz: dark fruit, structure, oak spice, and generous weight.',
    parameters: {
      acidity: 3,
      body: 5,
      tannin: 4,
      sweetness: 1,
      alcohol: 4,
      fruit: 5
    }
  },
  {
    slug: 'henschke-hill-of-grace',
    name: 'Henschke Hill of Grace Shiraz',
    region: 'Eden Valley, South Australia',
    color: 'Red',
    prompt: 'A powerful but detailed old-vine shiraz style with spice, dark berries, and firm structure.',
    parameters: {
      acidity: 3,
      body: 5,
      tannin: 4,
      sweetness: 1,
      alcohol: 4,
      fruit: 4
    }
  },
  {
    slug: 'leeuwin-estate-art-series',
    name: 'Leeuwin Estate Art Series Chardonnay',
    region: 'Margaret River, Western Australia',
    color: 'White',
    prompt: 'Premium Margaret River chardonnay: citrus, stone fruit, creamy texture, and polished oak.',
    parameters: {
      acidity: 4,
      body: 4,
      tannin: 1,
      sweetness: 1,
      alcohol: 3,
      fruit: 4
    }
  },
  {
    slug: 'grosset-polish-hill',
    name: 'Grosset Polish Hill Riesling',
    region: 'Clare Valley, South Australia',
    color: 'White',
    prompt: 'Dry Clare Valley riesling: lime, floral lift, high acidity, and a lean mineral feel.',
    parameters: {
      acidity: 5,
      body: 1,
      tannin: 1,
      sweetness: 1,
      alcohol: 2,
      fruit: 3
    }
  },
  {
    slug: 'tyrrells-vat-1-semillon',
    name: "Tyrrell's Vat 1 Semillon",
    region: 'Hunter Valley, New South Wales',
    color: 'White',
    prompt: 'Classic Hunter semillon: light, dry, lemony, low alcohol, and very crisp when young.',
    parameters: {
      acidity: 5,
      body: 1,
      tannin: 1,
      sweetness: 1,
      alcohol: 1,
      fruit: 2
    }
  },
  {
    slug: 'giaconda-chardonnay',
    name: 'Giaconda Estate Vineyard Chardonnay',
    region: 'Beechworth, Victoria',
    color: 'White',
    prompt: 'Intense Victorian chardonnay with citrus, stone fruit, texture, oak detail, and strong freshness.',
    parameters: {
      acidity: 4,
      body: 4,
      tannin: 1,
      sweetness: 1,
      alcohol: 3,
      fruit: 4
    }
  },
  {
    slug: 'yalumba-signature',
    name: 'Yalumba The Signature Cabernet Shiraz',
    region: 'Barossa, South Australia',
    color: 'Red',
    prompt: 'Australian cabernet shiraz blend: cassis, plum, spice, firm tannin, and generous body.',
    parameters: {
      acidity: 3,
      body: 5,
      tannin: 4,
      sweetness: 1,
      alcohol: 4,
      fruit: 5
    }
  },
  {
    slug: 'tolpuddle-pinot-noir',
    name: 'Tolpuddle Vineyard Pinot Noir',
    region: 'Coal River Valley, Tasmania',
    color: 'Red',
    prompt: 'Cool-climate Tasmanian pinot: red cherry, perfume, bright acidity, fine tannin, and medium-light body.',
    parameters: {
      acidity: 4,
      body: 2,
      tannin: 2,
      sweetness: 1,
      alcohol: 2,
      fruit: 3
    }
  },
  {
    slug: 'de-bortoli-noble-one',
    name: 'De Bortoli Noble One Botrytis Semillon',
    region: 'Riverina, New South Wales',
    color: 'Dessert',
    prompt: 'Sweet botrytis semillon: honey, apricot, marmalade, rich body, and balancing acidity.',
    parameters: {
      acidity: 4,
      body: 4,
      tannin: 1,
      sweetness: 5,
      alcohol: 2,
      fruit: 5
    }
  },
  {
    slug: 'rockford-basket-press',
    name: 'Rockford Basket Press Shiraz',
    region: 'Barossa Valley, South Australia',
    color: 'Red',
    prompt: 'Traditional Barossa shiraz: ripe blackberry, dark plum, spice, full body, and warm alcohol.',
    parameters: {
      acidity: 3,
      body: 5,
      tannin: 4,
      sweetness: 1,
      alcohol: 5,
      fruit: 5
    }
  }
]


taste_params = TasteParameter.create(taste_params_data.map { |tp| {
  slug: tp[:slug],
  label: tp[:label],
  low: tp[:low],
  high: tp[:high],
  help: tp[:help]
} })



wine_profiles = WineProfile.create(wine_profiles_data.map { |wp| {
  slug: wp[:slug],
  name: wp[:name],
  color: wp[:color],
  grapes: wp[:grapes].to_json,
  regions: wp[:regions].to_json,
  notes: wp[:notes].to_json,
  serving: wp[:serving],
  # parameters: wp[:parameters].to_json
} })

# Create wine profile taste parameters
wine_profiles.each do |wine_profile|
  puts "\n\nwine_profile.slug: #{wine_profile.slug}"
  line = wine_profiles_data.find { |item| item[:slug] == wine_profile.slug }
  line[:parameters].each do |parameter|
    puts "parameter[0]: #{parameter[0]} "
    puts "parameter[1]: #{parameter[1]}"

    taste_parameter = TasteParameter.find_by(slug: parameter[0])
    puts "taste_param[:slug]: #{taste_parameter.slug}"
    WineProfileTasteParameter.create(
      wine_profile: wine_profile,
      taste_parameter: taste_parameter,
      score: parameter[1]
    )
  end
end


wine_tests = Wine.create(australian_wine_tests_data.map { |wt| {
  slug: wt[:slug],
  name: wt[:name],
  region: wt[:region],
  color: wt[:color],
  prompt: wt[:prompt],
  # parameters: wt[:parameters].to_json
} })

# Create wine taste parameters for test cases
wine_tests.each do |wine_test|
  puts "\n\nwine_test.slug: #{wine_test.slug}"
  line = australian_wine_tests_data.find { |item| item[:slug] == wine_test.slug }
  line[:parameters].each do |parameter|
    puts "parameter[0]: #{parameter[0]}"
    puts "parameter[1]: #{parameter[1]}"
    taste_parameter = TasteParameter.find_by(slug: parameter[0])
    WineTasteParameter.create(
      wine: wine_test,
      taste_parameter: taste_parameter,
      score: parameter[1]
    )
  end
end