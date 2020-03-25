require 'test_helper'

class BookingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booking = FactoryBot.create(:booking)
  end

  test "should get index" do
    get bookings_url
    assert_response :success
  end

  test "should get new" do
    get new_booking_url
    assert_response :success
  end

  test "should create booking" do
    assert_difference('Booking.count') do
      post bookings_url, params: { booking: { end_date: @booking.end_date, 
        room_id: @booking.room_id, start_date: @booking.start_date, user_id: @booking.user_id } }
    end
    assert_redirected_to booking_url(Booking.last)

    post bookings_url, params: { booking: { end_date: @booking.end_date, 
      room_id: nil, start_date: @booking.start_date, user_id: @booking.user_id } }
     assert_template :new


  end

  test "should show booking" do
    get booking_url(@booking)
    assert_response :success
  end

  test "should get edit" do
    get edit_booking_url(@booking)
    assert_response :success
  end

  test "should update booking" do
    patch booking_url(@booking), params: { booking: { end_date: @booking.end_date, 
      room_id: @booking.room_id, start_date: @booking.start_date, user_id: @booking.user_id } }
    assert_redirected_to booking_url(@booking)

    patch booking_url(@booking), params: { booking: { end_date: @booking.end_date, 
      room_id: nil, start_date: @booking.start_date, user_id: @booking.user_id } }
    assert_template :edit


  end

  test "should destroy booking" do
    assert_difference('Booking.count', -1) do
      delete booking_url(@booking)
    end

    assert_redirected_to bookings_url
  end
end
