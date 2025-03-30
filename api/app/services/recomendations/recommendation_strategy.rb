class RecommendationStrategy
  @@strategies = {}

  def self.register(name, strategy_class)
    @@strategies[name] = strategy_class
  end

  def self.all
    @@strategies
  end

  def find(artwork)
    raise NotImplementedError, "Subclasses must implement `find`"
  end
end

