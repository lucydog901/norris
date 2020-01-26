class FactsController < ApplicationController
  def index
  end

  def search
    keywords = find_keyword(params[:keyword])

    unless keywords
      flash[:alert] = "Chuck hates that word, don't piss Chuck off. Try another one."
      return render action: :index
    end

    @jokes = keywords
    return render action: :index
    
    # flash[:alert] = keywords

  end
end

private


  def find_keyword(keyword)
    response = HTTParty.get("https://api.chucknorris.io/jokes/search?query=#{keyword}")


    result = JSON.parse(response.body)["result"]

    unless result.length == 0
      return result
    else
      return nil
    end

  end
