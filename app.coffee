
amount = 6
num = 4
cardH = 600
margin = 10

allCards = []
allPages = []
colors = []



scroll = new ScrollComponent
	size: Screen.size
	scrollHorizontal: false

# Loop to create row layers
for index in [0...amount]

	card = new PageComponent
		width: scroll.width
		height: cardH
		scrollVertical: false
		x: 0
		y: (cardH + margin)* index
		parent: scroll.content
		backgroundColor: 'black'
	card.animationOptions = 
		curve: 'spring(900,10,0.01)'
	
	allCards.push(card)
		
for card in allCards
	card.content.draggable.options = 
		friction: 10, tension: 400, tolerance: 1
	for i in [0...num]
		colors[i] = Utils.randomColor(0.9)
		page = new Layer
			html: card.id + ':' + i
			width:  scroll.width
			height: cardH
			x: scroll.width * i 
			backgroundColor: colors[i]
			parent: card.content
		page.style = 
			'color': 'white'
			'font-size': '23rem'
			'padding-top': '18rem'
			'padding-left':'2.3rem'
			'font-family': 'futura'
		allPages.push(page)

scroll.content.draggable.directionLock = true

scroll.content.on Events.DirectionLockDidStart,(events)->
	for card in allCards
		if events.x then card.scrollHorizontal = false
		if events.y then card.scrollHorizontal = true





