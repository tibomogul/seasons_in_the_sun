require_relative './reckoning_base'

module SeasonsInTheSun

  class ModernMidLattitudeMeteorological
    # For the Northern hemisphere, spring begins on 1 March,
    # summer on 1 June, autumn on 1 September, and winter on 1 December.
    # For the Southern hemisphere, spring begins on 1 September, summer
    # on 1 December, autumn on 1 March, and winter on 1 June.
    
    include SeasonsInTheSun::ReckoningBase
    
    HEMISPHERES = [:northern, :southern]
    
    def initialize()
    end
    
    def set_options(opts={})
      if opts[:hemisphere]
        if HEMISPHERES.include? opts[:hemisphere]
          options[:hemisphere] = opts[:hemisphere]
        else
          raise "Invalid hemisphere setting"
        end
      end
    end
    
    # accepts Date or Datetime and outputs a season string.
    # Date (instance or a subclasses instance) is accepted here since 
    # the time component is not required to determine the season for this
    # reckoning
    def lookup(dt)
      raise "Argument needs to be a Date or Datetime" unless dt.is_a? Date
      day = dt.to_date # make sure it is a date
      if options[:hemisphere] == :southern
        case day.month
        when 9..11
          SeasonsInTheSun::SPRING
        when 12,1,2
          SeasonsInTheSun::SUMMER
        when 3..5
          SeasonsInTheSun::AUTUMN
        when 6..8
          SeasonsInTheSun::WINTER
        end
      elsif options[:hemisphere] == :northern
        case day.month
        when 3..5
          SeasonsInTheSun::SPRING
        when 6..8
          SeasonsInTheSun::SUMMER
        when 9..11
          SeasonsInTheSun::AUTUMN
        when 12,1,2
          SeasonsInTheSun::WINTER
        end
      else
        raise "Invalid hemisphere selection"
      end
    end

    private
      def options
        @options ||= {
          hemisphere: :southern
        }
      end
    
  end
end