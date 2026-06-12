class ReviewSerializer
  def initialize(review)
    @review = review
  end

  def as_json
    {
      id: @review.id,
      vintage_id: @review.vintage_id,
      user_id: @review.user_id,
      reviewer_name: @review.user&.name || @review.user&.email || "Unknown",
      comment: @review.comment,
      score: @review.score&.to_f,
      status: @review.status,
      published_at: @review.published_at&.iso8601,
      created_at: @review.created_at&.iso8601
    }
  end
end