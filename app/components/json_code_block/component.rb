class JSONCodeBlock::Component < ViewComponent::Base

  # @param data [Object,Hash]
  # @return [void]
  def initialize(data:)
    @data = data
  end

  # @return [String]
  def pretty_data()
    return JSON.pretty_generate(@data)
  end

end
