//
//  Devises.swift
//  LeBaluchon
//
//  Created by Sergio Canto  on 12/11/2020.
//

import Foundation


// This constant contain an array with all
// The available currency on the app
// code: code currency to send for the api
// descr: description for the picker
// descr_short: symbol or name to show on the app

// swiftlint:disable:next large_tuple
let devises: [(code: String, descr: String, descr_short: String)] = [
    ("AFN", "Afghani", "؋"),
    ("MGA", "Ariary", "ariary"),
    ("THB", "Baht", "฿"),
    ("PAB", "Balboa", "balboa"),
    ("ETB", "Birr", "birr"),
    ("BTC", "Bitcoins", " ₿"),
    ("VEF", "Bolívar Fuerte Vénézuelien", "Bolívar"),
    ("BOB", "Boliviano bolivien", "boliviano"),
    ("GHS", "Cedi", "₵"),
    ("CRC", "Colon du Costa Rica", "colón"),
    ("SVC", "Colón du Salvadore", "Colón"),
    ("NIO", "Córdoba oro", "córdoba"),
    ("DKK", "Couronne danoise", "Kr"),
    ("ISK", "Couronne islandaise", "couronne"),
    ("NOK", "Couronne norvégienne", "couronne"),
    ("SEK", "Couronne suédoise", "couronne"),
    ("CZK", "Couronne tchèque", "koruna"),
    ("MKD", "Denar", "denar"),
    ("DZD", "Dinar algérien", "dinar"),
    ("BHD", "Dinar de Bahreïn", "dinar"),
    ("IQD", "Dinar irakien", "dinar"),
    ("JOD", "Dinar jordanien", "dinar"),
    ("KWD", "Dinar koweïtien", "dinar"),
    ("LYD", "Dinar libyen", "dinar"),
    ("RSD", "Dinar serbe", "dinar"),
    ("TND", "Dinar tunisien", "DT"),
    ("AED", "Dirham des Émirats arabes unis", "DH"),
    ("MAD", "Dirham marocain", "dirham"),
    ("STD", "Dobra", "dobra"),
    ("USD", "Dollar américain", "$"),
    ("AUD", "Dollar australien", "$"),
    ("BBD", "Dollar barbadien", "Bds$"),
    ("CAD", "Dollar canadien", "$"),
    ("BZD", "Dollar de Belize", "BZ$"),
    ("BND", "Dollar de Brunei", "B$"),
    ("FJD", "Dollar de Fidji", "$"),
    ("HKD", "Dollar de Hong Kong", "$"),
    ("SGD", "Dollar de Singapour", "S$"),
    ("BSD", "Dollar des Bahamas", "B$"),
    ("BMD", "Dollar des Bermudes", "$"),
    ("XCD", "Dollar des Caraïbes orientales", "EC$"),
    ("KYD", "Dollar des îles Caïmans", "CI$"),
    ("SBD", "Dollar des îles Salomon", "$"),
    ("SRD", "Dollar du Suriname", "$"),
    ("ZWL", "Dollar du Zimbabwe", "$"),
    ("GYD", "Dollar guyanien", "G$"),
    ("JMD", "Dollar jamaïcain", "J$"),
    ("LRD", "Dollar libérien", "$"),
    ("NAD", "Dollar namibien", "$"),
    ("NZD", "Dollar néo-zélandais", "$"),
    ("TTD", "Dollar trinidadien", "$"),
    ("VND", "Dong", "dong"),
    ("AMD", "Dram", "Dram"),
    ("CVE", "Escudo du Cap-Vert", "escudo"),
    ("EUR", "Euro", "€"),
    ("AWG", "Florin arubais", "ƒ"),
    ("ANG", "Florin des Antilles néerlandaises", "ƒ"),
    ("HUF", "Forint hongrois", "Ft"),
    ("BIF", "Franc burundais", "F"),
    ("XAF", "Franc CFA (CEMAC)", "F"),
    ("XOF", "Franc CFA (UEMOA)", "F"),
    ("KMF", "Franc comorien", "FC"),
    ("CDF", "Franc congolais", "F"),
    ("DJF", "Franc de Djibouti", "F"),
    ("GNF", "Franc guinéen", "F"),
    ("XPF", "Franc pacifique", "F"),
    ("RWF", "Franc rwandais", "F"),
    ("CHF", "Franc suisse", "Fr"),
    ("GMD", "Gamadi", "gamadi"),
    ("HTG", "Gourde haïtienne", "gourde"),
    ("PYG", "Guaraní paraguayen", "₲"),
    ("UAH", "Hryvnia", "₴"),
    ("MMK", "Kiat", "kiat"),
    ("PGK", "Kina", "kina"),
    ("LAK", "Kip", "₭"),
    ("HRK", "Kuna croate", "kuna"),
    ("ZMW", "Kwacha de Zambie", "kwacha"),
    ("MWK", "Kwacha malawien", "kwacha"),
    ("AOA", "Kwanza", "Kz"),
    ("GEL", "Lari", "lari"),
    ("ALL", "Lek albanais", "Lek"),
    ("HNL", "Lempira", "lempira"),
    ("SLL", "Leone", "leone"),
    ("MDL", "Leu moldave", "leu"),
    ("RON", "Leu roumain", "leu"),
    ("BGN", "Lev bulgare", "лев"),
    ("LVL", "Lias latviens", "lias"),
    ("SZL", "Lilangeni", "lilangeni"),
    ("LTL", "Litas lituanien", "litas"),
    ("GIP", "Livre de Gibraltar", "£"),
    ("GGP", "Livre de Guernesey", "£"),
    ("JEP", "Livre de Jersey", "£"),
    ("SHP", "Livre de Sainte-Hélène", "£"),
    ("FKP", "Livre des Îles Malouines", "£"),
    ("EGP", "Livre égyptienne", "E£"),
    ("LBP", "livre libanaise", "£L"),
    ("IMP", "Livre manx", "£"),
    ("SDG", "Livre soudanaise", "s£"),
    ("GBP", "Livre sterling", "£"),
    ("SYP", "Livre syrienne", "S£"),
    ("TRY", "Livre turque", "₺"),
    ("LSL", "Loti", "loti"),
    ("AZN", "Manat azerbaïdjanais", "₼"),
    ("TMT", "Manat turkmène", "manat"),
    ("BAM", "Mark convertible", "MK"),
    ("MZN", "Metical", "MTn"),
    ("NGN", "Naira", "N"),
    ("ERN", "Nakfa", "nafka"),
    ("BTN", "Ngultrum", "Nu"),
    ("TWD", "Nouveau dollar de Taïwan", "NT$"),
    ("BYN", "Nouvelle rouble biélorusse", "Br."),
    ("PEN", "nuevo sol péruvien", "S/."),
    ("MRO", "Ouguiya mauritanien", "ouguiya"),
    ("TOP", "Paʻanga", "paʻanga"),
    ("MOP", "Pataca", "pataca"),
    ("ARS", "Peso argentin", "$"),
    ("CLP", "Peso chilien", "$"),
    ("COP", "Peso colombien", "$"),
    ("CUP", "Peso cubain", "$"),
    ("CUC", "Peso cubain convertible", "$"),
    ("DOP", "Peso dominicain", "$"),
    ("MXN", "Peso mexicain", "$"),
    ("PHP", "Peso philippin", "peso"),
    ("UYU", "Peso uruguayen", "$"),
    ("BWP", "Pula", "pula"),
    ("GTQ", "Quetzal", "quetzal"),
    ("ZAR", "Rand", "R"),
    ("BRL", "Réal brésilien", "R$"),
    ("IRR", "Rial iranien", "rial"),
    ("OMR", "Rial omanais", "rial"),
    ("KHR", "Riel", "riel"),
    ("MYR", "Ringgit", "RM"),
    ("QAR", "Riyal qatari", "rial"),
    ("SAR", "Riyal saoudien", "riyal"),
    ("YER", "Riyal yéménite", "riyal"),
    ("BYR", "Rouble biélorusse", "Br."),
    ("INR", "Roupie indienne", "₹"),
    ("RUB", "Rouble russe", "₽"),
    ("MUR", "Roupie mauricienne", "roupie"),
    ("NPR", "Roupie népalaise", "roupie"),
    ("PKR", "roupie pakistanaise", "Rs"),
    ("SCR", "Roupie seychelloise", "roupie"),
    ("LKR", "Roupie srilankaise", "Rs"),
    ("MVR", "Rufiyaa", "rf"),
    ("IDR", "Rupiah", "roupie"),
    ("ILS", "Shekel", "₪"),
    ("KES", "Shilling kényan", "shilling"),
    ("UGX", "Shilling ougandais", "shilling"),
    ("SOS", "Shilling somalien", "shilling"),
    ("TZS", "Shilling tanzanien", "shilling"),
    ("KGS", "Som", "som"),
    ("UZS", "Sum", "sum"),
    ("TJS", "Somoni", "somoni"),
    ("BDT", "Taka", "taka"),
    ("WST", "Tala", "tala"),
    ("KZT", "Tenge", "tenge"),
    ("MNT", "Tugrik", "₮"),
    ("CLF", "Unidad de Fomento", "UF"),
    ("VUV", "Vatu", "vatu"),
    ("KPW", "Won nord-coréen", "￦"),
    ("KRW", "Won sud-coréen", "￦"),
    ("JPY", "Yen", "¥"),
    ("CNY", "Yuan renminbi", "¥"),
    ("PLN", "Złoty polonais", "złoty")]