local Translations = {
error = {
    cant_take_out_boat = 'Você não pode tirar sua canoa aqui!',
    boat_already_out = 'Você já tem sua canoa fora!',
    no_item = 'Você não tem este item!',
},
}

if GetConvar('rsg_locale', 'en') == 'pt-br' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
