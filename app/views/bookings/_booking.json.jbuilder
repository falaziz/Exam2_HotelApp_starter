json.extract! booking, :id, :end_date, :room_id, :start_date, :user_id, :created_at, :updated_at
json.url booking_url(booking, format: :json)
