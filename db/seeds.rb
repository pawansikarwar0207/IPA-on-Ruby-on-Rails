# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

question = Question.create(
		[	
			{
				title: 'What is the difference between has_many :through and has_and_belongs_to_many? Also state which one is better?',
				keywords: 'Rails',
			},	
			{
				title: 'What are validations in rails? At what moments of an objects lifecycle validations are checked?',
				keywords: 'Rails',
			},
			{
				title: 'What do you mean by polymorphic association in rails? When can one use this association?',
				keywords: 'Rails',
			},
			{
				title: 'What are scopes in Rails?',
				keywords: 'Rails',
			},
			{
				title: 'What is the difference between class methods and scopes? Are they similar?',
				keywords: 'Rails',
			},
			{
				title: 'What do you mean by ActiveRecord callbacks? Explain some ActiveRecord callbacks.',
				keywords: 'Rails',
			},
			{
				title: 'How can you define custom validations in rails?',
				keywords: 'Rails',
			},
			{
				title: 'What do you mean by STI(single table inheritance)? What are its advantages and disadvantages?',
				keywords: 'Rails',
			},
			{
				title: 'What do you mean by migrations in Rails? What is the usage of rails migrations?',
				keywords: 'Rails',
			},
			{
				title: 'What do you mean by N+1 query? How can you resolve N+1 query? Explain by an example.',
				keywords: 'Rails',
			},
			{
				title: 'What is the difference between includes and joins?',
				keywords: 'Rails',
			},
			{
				title: 'What do you mean by self_join association in Rails?',
				keywords: 'Rails',
			},
			{
				title: 'What do you mean by ORM? Explain.',
				keywords: 'Rails',
			}
		]
) 

plan = Plan.create(
	[	
		{
			name: 'One Month',
			price: 'Rs.500',
		},

		{
			name: 'Three Month',
			price: 'Rs.1350',
		},
		{
			name: 'Six Month',
			price: 'Rs.2520',
		},
		{
			name: 'Yearly',
			price: 'Rs.4200',
		},
	]
	)
 