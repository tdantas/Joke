module Joke
  module Rspec
      
      def self.run
        system('RUBY -S rspec')
      end

      def self.to_proc
        Proc.new { self.run }
      end

  end
end