module Msg exposing (Msg(..))

import Buttons.Msg as Buttons
import Checkboxes.Msg as Checkboxes
import Dropdown.Msg as Dropdown
import Filters.Msg as Filters
import Paginators.Msg as Paginators
import Radio.Msg as Radio
import Sidebar.Msg as Sidebar
import Switches.Msg as Switches
import Tables.Msg as Tables
import Tabs.Msg as Tabs
import UIExplorer.Plugins.Tabs as TabsPlugin


type Msg
    = ButtonsStoriesMsg Buttons.Msg
    | CheckboxesStoriesMsg Checkboxes.Msg
    | DropdownStoriesMsg Dropdown.Msg
    | FiltersStoriesMsg Filters.Msg
    | PaginatorsStoriesMsg Paginators.Msg
    | RadioStoriesMsg Radio.Msg
    | SidebarStoriesMsg Sidebar.Msg
    | SwitchesStoriesMsg Switches.Msg
    | TablesStoriesMsg Tables.Msg
    | TabsStoriesMsg Tabs.Msg
    | NoOp
    | TabMsg TabsPlugin.Msg
