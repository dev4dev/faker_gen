### Version 0.1
---

### Check available types

`FG::Obj.types`

Output:

	person_name
	company_name
	company_slogan
	address
	address_country
	address_city
	address_zip
	address_street
	phone
	internet_domain
	internet_email
	internet_ip4
	internet_ip6
	internet_url
	internet_username
	lorem_word
	lorem_sentence
	lorem_paragraph

### Gem usage
	
	data = FG::generate `items_count` do # items_count - default 10
		prop 'prop_name', :prop_type
		prop 'prop_name2', 'static value'
	end
	
	data # JSON String

### Bin usage

**Fakefile** - object struct file (optional, default = Fakefile)  
**items_count** - items count in array (optional, default = 10)

	faker <Fakefile> <items_count>

Fakefile example:

	prop 'name', :person_name
	prop 'company', :company_name

### Examples

	data = FG::generate do
	  prop 'owner'
	  prop 'ceo', :person_name
	  prop 'company', :company_name
	  prop 'address', :address
	  prop 'phone', :phone
	end
	
	puts data

Output:

	[
	  {
	    "owner": "Jace Okuneva",
	    "ceo": "Ethel Kunze",
	    "company": "Moore-Ziemann",
	    "address": "299 Wilfredo Squares Apt. 855",
	    "phone": "(556)929-4519"
	  },
	  {
	    "owner": "Franz Ankunding",
	    "ceo": "Tatum Effertz",
	    "company": "Kutch, Johnston and Tillman",
	    "address": "10379 Adella Flat Apt. 945",
	    "phone": "163.367.6717 x0484"
	  },…
	]


	data = FG::generate 3 do
	  prop 'name'
	  prop 'image', 'http://lorempixel.com/124/124'
	  prop 'size', 10
	  prop 'ok', :lorem_paragraph
	end
	
	puts data

Output:

	[
	  {
	    "name": "Alison Smith",
	    "image": "http://lorempixel.com/124/124",
	    "size": 10,
	    "ok": "Incidunt qui est et consequatur eos hic sunt. Reiciendis temporibus deleniti voluptatum. Commodi sunt exercitationem eos. Quisquam doloribus quasi aut aut ipsam ratione. Quisquam accusantium consectetur sunt doloribus perspiciatis facere fugiat."
	  },
	  {
	    "name": "Raegan Brakus DDS",
	    "image": "http://lorempixel.com/124/124",
	    "size": 10,
	    "ok": "Distinctio quam ullam at voluptas nihil dolores est. Eum rerum amet iure doloremque aut possimus. Voluptatem pariatur commodi delectus ratione saepe mollitia et. Qui voluptate qui ipsum incidunt voluptatem pariatur consectetur."
	  },
	  {
	    "name": "Kaycee West",
	    "image": "http://lorempixel.com/124/124",
	    "size": 10,
	    "ok": "Maxime nobis nostrum consequatur assumenda dolores modi sit. Animi qui veniam alias est iusto maxime. Recusandae ipsum et quis."
	  }
	]

### Copyright

© 2013 [Alex Antonyuk](http://antonyuk.me)