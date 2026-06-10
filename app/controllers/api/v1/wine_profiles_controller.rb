class Api::V1::WineProfilesController < ApplicationController
  def index
    wine_profiles = WineProfile.includes(wine_profile_taste_parameters: :taste_parameter)
    render json: wine_profiles.map { |wine_profile| WineProfileSerializer.new(wine_profile).as_json }
  end

  def show
    wine_profile = WineProfile.find_by!(slug: params[:id])
    render json: WineProfileSerializer.new(wine_profile).as_json
  end

  def create
    @wine_profile = WineProfile.new(wine_profile_params)
    if @wine_profile.save
      render json: @wine_profile, status: :created
    else
      render json: @wine_profile.errors, status: :unprocessable_entity
    end
  end

  def update
    @wine_profile = WineProfile.find_by!(slug: params[:id])
    if @wine_profile.update(wine_profile_params)
      render json: @wine_profile
    else
      render json: @wine_profile.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @wine_profile = WineProfile.find_by!(slug: params[:id])
    @wine_profile.destroy
    head :no_content
  end

  def search
    query = params[:q].to_s.strip
    if query.blank?
      render json: { wines: [], wine_profiles: [] } and return
    end

    limit = params[:limit]&.to_i || 10

    sim_threshold = 0.2
    word_sim_threshold = 0.3

    quoted_query = ActiveRecord::Base.connection.quote(query)

    # Search wines by name AND region
    wines = Wine.includes(wine_taste_parameters: :taste_parameter, vintages: [])
                .where(
                  "(similarity(wines.name, ?) > ? OR strict_word_similarity(?, wines.name) > ? OR word_similarity(?, wines.name) > ?) OR (similarity(wines.region, ?) > ? OR strict_word_similarity(?, wines.region) > ? OR word_similarity(?, wines.region) > ?)",
                  query, sim_threshold,
                  query, sim_threshold,
                  query, word_sim_threshold,
                  query, sim_threshold,
                  query, sim_threshold,
                  query, word_sim_threshold
                )
                .order(
                  Arel.sql("GREATEST(
                    similarity(wines.name, #{quoted_query}),
                    strict_word_similarity(#{quoted_query}, wines.name),
                    word_similarity(#{quoted_query}, wines.name) * 0.8,
                    similarity(wines.region, #{quoted_query}) * 0.7,
                    strict_word_similarity(#{quoted_query}, wines.region) * 0.7,
                    word_similarity(#{quoted_query}, wines.region) * 0.6
                  ) DESC")
                )
                .limit(limit)

    # Search wine_profiles by name AND regions (JSON text)
    wine_profiles = WineProfile.includes(wine_profile_taste_parameters: :taste_parameter)
                               .where(
                                 "(similarity(wine_profiles.name, ?) > ? OR strict_word_similarity(?, wine_profiles.name) > ? OR word_similarity(?, wine_profiles.name) > ?) OR (similarity(COALESCE(wine_profiles.regions::text, ''), ?) > ? OR strict_word_similarity(?, COALESCE(wine_profiles.regions::text, '')) > ? OR word_similarity(?, COALESCE(wine_profiles.regions::text, '')) > ?)",
                                 query, sim_threshold,
                                 query, sim_threshold,
                                 query, word_sim_threshold,
                                 query, sim_threshold,
                                 query, sim_threshold,
                                 query, word_sim_threshold
                               )
                               .order(
                                 Arel.sql("GREATEST(
                                   similarity(wine_profiles.name, #{quoted_query}),
                                   strict_word_similarity(#{quoted_query}, wine_profiles.name),
                                   word_similarity(#{quoted_query}, wine_profiles.name) * 0.8,
                                   similarity(COALESCE(wine_profiles.regions::text, ''), #{quoted_query}) * 0.7,
                                   strict_word_similarity(#{quoted_query}, COALESCE(wine_profiles.regions::text, '')) * 0.7,
                                   word_similarity(#{quoted_query}, COALESCE(wine_profiles.regions::text, '')) * 0.6
                                 ) DESC")
                               )
                               .limit(limit)

    render json: {
      wines: wines.map { |w| WineSerializer.new(w).as_json },
      wine_profiles: wine_profiles.map { |wp| WineProfileSerializer.new(wp).as_json }
    }
  end

  private

  def wine_profile_params
    params.require(:wine_profile).permit(:name, :color, :grapes, :regions, :notes, :serving, :parameters)
  end
end