# frozen_string_literal: true

def stylesheets
  # Load the existing stylesheets while appending the custom one
  super + %w[css/pygments-default.css]
end
