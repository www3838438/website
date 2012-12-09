# Prepare
{ itemSort, collection, getCategoryName } = @
return  unless collection

_ = @underscore

# Menu
ul typeof:'dc:collection', ->

	# Categories
	categories = _.uniq collection.pluck('category')
	for category in categories
		# Category Items
		categoryItems = collection.findAll({category},itemSort)

		# Category with Items
		text @partial('menu/category.html.coffee',{
			type: 'menu'
			items: categoryItems
			activeItem: @activeItem
			showDescription: false
			showDate: false
			partial: @partial
			moment: @moment
		})