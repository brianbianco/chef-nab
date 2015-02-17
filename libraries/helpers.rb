module Autoconsul
  module Helpers
    def self.options(spec)
      # This will convert a hash of format { 'option' => 'option_value' }
      # into a string with the expected format for command line:
      # --option --option_value
      spec.reduce(String.new) { |r, (o, v)| r << "--#{o} #{v} " }
    end
  end
end
