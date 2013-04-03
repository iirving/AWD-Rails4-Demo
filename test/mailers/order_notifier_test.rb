require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  test "received" do
    mail = OrderNotifier.received(orders(:one))
    assert_equal "Store Confirmation", mail.subject
    assert_equal ["Dave@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match /Thank you for your order/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderNotifier.shipped(orders(:one))
    assert_equal "Store Order Shipped!", mail.subject
    assert_equal ["Dave@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match /This is just to let you know that we've shipped your recent order/ , mail.body.encoded
  end

end
