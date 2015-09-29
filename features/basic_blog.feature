Feature: Basic Blog
	As a drying paint enthusiast
	I want to publish blog entries
	So that my friends can enjoy my fascinating hobby

	Scenario: Visit home page
		When I go to the home page
		Then I should see the blog title

	Scenario: Post a  text entry
		When I go to the home page
		And I start a new post
		And I fill out the form
		And I submit the form
		And I return to the home page
		Then I should see a post with title "First Post!"
		And The Body should be:
			"""
			I just painted a Fence!
			"""

	Scenario: Post a photo
		When I post an entry  with these values:
			|	name				|		value															|
			|	title				|		Check it out I painted the cat		|
			|	image_url		|		http://example.com/madcat.jpg			|
		Then I should see a post with the title "Chek it out, I painted the cat!"

	Scenario: Post many entries
		When I post the following entries in order:
			|	title				|		body						|		tags					|
			|	Post A			|		This is post A	|		a, z					|
			|	Post B			|		This is post B	|		b, z					|
			|	Post C			|		This is post C	|		c, x					|
		Then I should see the following entries in order:
			|	title				|		body															|
			|	Post C			|		This is post C										|
			|	Post B			|		This is post B										|
			|	Post A			|		This is post A										|
		And I should see tagsi: a, b, c, x, z
		When I look at posts tagged "z"
		Then I should see the following entries in order:
			|	title				|		body															|
			|	Post B			|		This is post B										|
			|	Post A			|		This is post A										|


