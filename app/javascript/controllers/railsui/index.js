import { application } from "../application"
import RailsuiModalController from "./railsui_modal_controller"
application.register("railsui-modal", RailsuiModalController)

import ComboSelectController from "./combo_select_controller";
application.register("combo-select", ComboSelectController);
import DashboardController from "./dashboard_controller";
application.register("dashboard", DashboardController);
import NavController from "./nav_controller";
application.register("nav", NavController);

import { RailsuiClipboard, RailsuiCountUp, RailsuiCombobox, RailsuiDateRangePicker, RailsuiDropdown, RailsuiModal, RailsuiRange, RailsuiReadMore,RailsuiSelectAll, RailsuiTabs, RailsuiToast, RailsuiToggle, RailsuiTooltip } from 'railsui-stimulus'

application.register('railsui-clipboard', RailsuiClipboard)
application.register('railsui-count-up', RailsuiCountUp)
application.register('railsui-combobox', RailsuiCombobox)
application.register('railsui-date-range-picker', RailsuiDateRangePicker)
application.register('railsui-dropdown', RailsuiDropdown)
application.register('railsui-modal', RailsuiModal)
application.register('railsui-range', RailsuiRange)
application.register('railsui-read-more', RailsuiReadMore)
application.register('railsui-select-all', RailsuiSelectAll)
application.register('railsui-tabs', RailsuiTabs)
application.register('railsui-toast', RailsuiToast)
application.register('railsui-toggle', RailsuiToggle)
application.register('railsui-tooltip', RailsuiTooltip)
