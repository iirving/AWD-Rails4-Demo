atom_feed do |feed|
	feed.title "Who Bought #{@product.title}"
	feed.updated @lastest_order.try(:updated_at)

	@product.orders.each do |order|
		feed.entry(order) do |entry|
			entry.title "Order #{order.id}"
			entry.summary type: 'xhtml' do |xhtml|
				xhtml.P 'shipped to #{order.address}'

				xhtml.table do
          		xhtml.tr do
            		xhtml.th 'Product'
            		xhtml.th 'Quantity'
            		xhtml.th 'Total Price'
          		end
          		order.line_items.each do |item|
            		xhtml.tr do
              			xhtml.td item.product.title
              			xhtml.td item.quantity
              			xhtml.td number_to_currency item.total_price
            		end
          		end
          		xhtml.tr do
            		xhtml.th 'total', colspan: 2
            		xhtml.th number_to_currency \
              		order.line_items.map(&:total_price).sum
          		end

          		xhtml.p "Paid by #{order.pay_type}"
          	end

          	entry.author do |author|
          		author.name order.name
          		author.email order.email
          	end
          end
      end
  end
end
