Rails.logger.info "Loading recommendation strategies..."

# Load the base strategy class first
require Rails.root.join('app/services/recommendations/recommendation_strategy.rb')

# Load all strategy implementations
Dir[Rails.root.join('app/services/recommendations/*_recommendation.rb')].each do |file|
  Rails.logger.info "Loading strategy file: #{file}"
  require file
end

Rails.logger.info "Finished loading recommendation strategies" 