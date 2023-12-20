local Translations = {
    error = {
        cant_take_out_boat = 'You can\'t take out your canoe here!',
        boat_already_out = 'You already have your canoe out!',
        no_item = 'You don\'t have this item!',
        not_in_correct_water = 'You are not standing in the water',
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

