class ExtractionAlgorithm
  attr_reader :game
  attr_reader :query

  def initialize(game)
    Rails.logger.debug("ExtractionAlgorithm initialised.")
    @game = game
    @query = Comic.all
  end

  def compute
    progresses = @game.progresses
    progresses.each do |progress|
      question = progress.question

      case question.algorithm
        when "serialization_end"
          serialization_end?(progress)
        when "genre_match"
          genre_match?(progress)
        else
          raise Exception("invalid algorithm.-->" + question.algorithm.to_s)
      end

      Rails.logger.debug("On the way query is" + @query.to_sql.to_s)
      Rails.logger.debug("On the way comics are" + @query.pluck(:title).to_a.to_s)
    end
    pp "-----#{@query.pluck(:title).to_a.to_s}----"
    @query
  end

  private

  def serialization_end?(progress)
    if progress.positive_answer?
      @query = @query.where.not("comics.serialization_end_year is null")
    end

    if progress.negative_answer?
      @query = @query.where("comics.serialization_end_year is null")
    end
  end

  def genre_match?(progress)
    if progress.positive_answer?
      @query = @query.where("comics.genre like ?", "%#{progress.question.eval_value}%")
    end
    
    if progress.negative_answer?
      @query = @query.where.not("comics.genre like ?", "%#{progress.question.eval_value}%")
    end
  end
end