module I18n.French exposing (..)

import I18n.Types exposing (..)


filtersPeriod : FiltersPeriod
filtersPeriod =
    { after = "Après"
    , before = "Avant"
    , on = "Sur"
    , description = "Sélectionner la période de référence"
    }


filtersRange : FiltersRange
filtersRange =
    { from = \{ date } -> "De:" ++ date ++ ""
    , to = \{ date } -> "A:" ++ date ++ ""
    }


filtersSelect : FiltersSelect
filtersSelect =
    { description = "Sélectionner l'option de filtrage"
    }


filters : Filters
filters =
    { dateFormat = "JJ/MM/AAAA"
    , close = "Fermer"
    , clear = "Effacer"
    , apply = "Appliquer"
    , period = filtersPeriod
    , range = filtersRange
    , select = filtersSelect
    }


paginator : Paginator
paginator =
    { format = \{ first, last, total } -> "" ++ first ++ " - " ++ last ++ " sur " ++ total ++ "\n"
    , previous = "Précédent"
    , next = "Suivant"
    }


checkbox : Checkbox
checkbox =
    { toggle = "Basculer"
    }


listView : ListView
listView =
    { search = "Rechercher"
    }


radio : Radio
radio =
    { select = "Sélectionner l'élément"
    }


tablesDetails : TablesDetails
tablesDetails =
    { show = "Elargir"
    , collapse = "Crash"
    }


tablesSorting : TablesSorting
tablesSorting =
    { increase = "Sort from A - Z"
    , decrease = "Sort from Z - A"
    }


tables : Tables
tables =
    { details = tablesDetails
    , sorting = tablesSorting
    }


dateInput : DateInput
dateInput =
    { invalid = "Format de date invalide"
    }


dialog : Dialog
dialog =
    { close = "Fermer le dialogue"
    }


sidebar : Sidebar
sidebar =
    { expand = "Elargir la barre latérale"
    , collapse = "Réduire la barre latérale"
    , previous = "Retourner"
    }


root : Root
root =
    { filters = filters
    , paginator = paginator
    , checkbox = checkbox
    , listView = listView
    , radio = radio
    , tables = tables
    , dateInput = dateInput
    , dialog = dialog
    , sidebar = sidebar
    }
