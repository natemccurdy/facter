# frozen_string_literal: true

module Facts
  module Aix
    module Memory
      module System
        class Total
          FACT_NAME = 'memory.system.total'
          ALIASES = 'memorysize'

          def call_the_resolver
            fact_value = Facter::Resolvers::Aix::Memory.resolve(:system)
            if fact_value
              fact_value = Facter::FactsUtils::UnitConverter.bytes_to_human_readable(fact_value[:total_bytes])
            end
            [Facter::ResolvedFact.new(FACT_NAME, fact_value), Facter::ResolvedFact.new(ALIASES, fact_value, :legacy)]
          end
        end
      end
    end
  end
end
