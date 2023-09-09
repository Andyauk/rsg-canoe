local Translations = {
error = {
    cant_take_out_boat = 'Você não pode tirar sua canoa aqui!',
    boat_already_out = 'Você já tem sua canoa fora!',
    no_item = 'Você não tem este item!',
},
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

-- Lang:t('error.horse_too_far')
