# http://www.devinterface.com/blog/2010/06/design-patterns-in-ruby-abstract-factory/
module SeasonsInTheSun
  module ReckoningBase
    def lookup(dt)
      raise NotImplementedError, "This method must be implemented"
    end
    def set_options(hsh)
      raise NotImplementedError, "This method must be implemented"
    end
  end
end