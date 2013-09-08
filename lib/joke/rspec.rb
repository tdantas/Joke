module Joke
  module Rspec
      def self.run
        system('RUBY -S rspec')
      end
  end
end