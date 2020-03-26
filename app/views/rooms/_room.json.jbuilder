json.extract! room, :id, :booked, :room_number, :room_type, :created_at, :updated_at
json.url room_url(room, format: :json)
