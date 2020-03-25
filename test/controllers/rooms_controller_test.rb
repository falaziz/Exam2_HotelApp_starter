require 'test_helper'

class RoomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @room = FactoryBot.create(:room)
  end

  test "should get index" do
    get rooms_url
    assert_response :success
  end

  test "should get new" do
    get new_room_url
    assert_response :success
  end

  test "should create room" do
    assert_difference('Room.count') do
      post rooms_url, params: { room: { booked: @room.booked, room_number: @room.room_number, 
        room_type: @room.room_type } }
    end
    assert_redirected_to room_url(Room.last)

    post rooms_url, params: { room: { booked: @room.booked, room_number: nil, 
      room_type: @room.room_type } }
    assert_template :new
  end

  test "should show room" do
    get room_url(@room)
    assert_response :success
  end

  test "should get edit" do
    get edit_room_url(@room)
    assert_response :success
  end

  test "should update room" do
    patch room_url(@room), params: { room: { booked: @room.booked, room_number: @room.room_number, 
      room_type: @room.room_type } }
    assert_redirected_to room_url(@room)

    patch room_url(@room), params: { room: { booked: @room.booked, room_number: nil, 
      room_type: @room.room_type } }
    assert_template :edit
  end

  test "should destroy room" do
    assert_difference('Room.count', -1) do
      delete room_url(@room)
    end

    assert_redirected_to rooms_url
  end
end
