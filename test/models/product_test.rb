require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

	test "product attributtes must not be empty" do
		product = Product.new
		assert product.invalid?
		assert product.errors[:title].any?
		assert product.errors[:description].any?
		assert product.errors[:price].any?
		assert product.errors[:image_url].any?
	end

	test "product price must be positive and a penny or greater" do
		product = Product.new(
			title: "my book title",
			description: "yyy",
			image_url: "yyy.png"
		)
		# price is negative
		product.price = -1
		assert product.invalid?
		assert_equal ['must be greater than or equal to 0.01'], product.errors[:price]

			# price is negative but small
		product.price = -0.0011
		assert product.invalid?
		assert_equal ['must be greater than or equal to 0.01'], product.errors[:price]

		# price is zero
		product.price = 0
		assert product.invalid?
		assert_equal ['must be greater than or equal to 0.01'], product.errors[:price]

		# price is smaller than a penny
		product.price =  0.001
		assert product.invalid?
		assert_equal ['must be greater than or equal to 0.01'], product.errors[:price]

		# price is okay
		product.price = 1
		assert product.valid?
	end

	test "title must be at least 10 char long but no longer that 160" do
		product = Product.new(
			description: "yyy",
			price: 1,
			image_url: "yyy.png"
		)
		# test a title which is 9 char long
		product.title = "123456789"
		assert product.invalid?
		assert_equal ['is too short (minimum is 10 characters)'], product.errors[:title]

		# test a title which is 161 (160+1) char long
		product.title = "X" * 161
		assert product.invalid?
		assert_equal ['is too long (maximum is 160 characters)'], product.errors[:title]

		# test a title which is just right , like 11 char long
		product.title = "X" * 11
		assert product.valid?

	end

	def new_product(image_url)
			Product.new(
				title: "my book title",
				description: "yyy",
				price: 1,
				image_url: image_url
			)

	end

	test "image url is valid" do
		ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.a.b/x/y/z/fred.gif }
		bad = %w{ fred.doc fred.gif/more fred.gif.more }

		ok.each do | name |
			assert new_product(name).valid?, "#{name} shouldn't be invalid"
		end

		bad.each do |name|
			assert new_product(name).invalid?, "#{name} shouldn't be valid"
		end

	end

	test "product is not valid without a unique title" do
		product = Product.new(
			title:       products(:ruby).title,
			description: "yyy",
			price:       1,
			image_url:   "fred.gif"
			)

		assert product.invalid?
    	assert_equal ["has already been taken"], product.errors[:title]
  end

  test "product is not valid without a unique title - i18n" do
    product = Product.new(title:       products(:ruby).title,
                          description: "yyy",
                          price:       1,
                          image_url:   "fred.gif")

    assert product.invalid?
    assert_equal [I18n.translate('errors.messages.taken')],
                 product.errors[:title]
  end



end
