class WineSerializer
  def initialize(wine)
    @wine = wine
  end

  def as_json
    {
      slug: @wine.slug,
      name: @wine.name,
      region: @wine.region,
      color: @wine.color,
      prompt: @wine.prompt,
      parameters: parameters
    }
  end

  private

  def parameters
    @wine.wine_taste_parameters.to_h do |wtp|
      [wtp.taste_parameter.slug, wtp.score]
    end
  end
end