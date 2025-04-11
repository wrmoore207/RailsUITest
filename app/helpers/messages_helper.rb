module MessagesHelper

        # This helper method generates a button class based on the active state.
    def button_class(active)
      base = "px-3 py-1.5 rounded-md text-sm font-medium transition-colors"
      active ? "#{base} bg-blue-600 text-white" : "#{base} bg-slate-200 dark:bg-slate-700 dark:text-white"
    end
  end
