#name, age, fav color

json.extract! @guest, :name, :age, :favorite_color

json.gifts @guest.gifts