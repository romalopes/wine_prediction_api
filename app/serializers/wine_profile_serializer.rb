class WineProfileSerializer
  def initialize(wine_profile)
    @wine_profile = wine_profile
  end

  def as_json
    {
      slug: @wine_profile.slug,
      name: @wine_profile.name,
      grapes: @wine_profile.grapes,
      regions: @wine_profile.regions,
      color: @wine_profile.color,
      notes: @wine_profile.notes,
      serving: @wine_profile.serving,
      parameters: parameters
    }
  end

  private

  def parameters
    @wine_profile.wine_profile_taste_parameters.to_h do |wtp|
      [wtp.taste_parameter.slug, wtp.score]
    end
  end
end