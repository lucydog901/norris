class FactsController < ApplicationController
  def index
  end

  def search
    flash.clear
    keywords = find_keyword(params[:keyword])

    unless keywords
      flash[:alert] = "Chuck hates that word, don't piss Chuck off. Try another one."
      return render action: :index
    end

    @jokes = keywords
    return render action: :index
  end

  def random
    flash.clear
    joke = find_random
    @jokes = [joke]
    return render action: :index
  end





  private


  def find_keyword(keyword)
    response = HTTParty.get("https://api.chucknorris.io/jokes/search?query=#{keyword}")


    result = JSON.parse(response.body)["result"]

    unless result.nil? or result.length == 0
      return result
    else
      return nil
    end
  end

  def find_random
    response = HTTParty.get("https://api.chucknorris.io/jokes/random")


    result = JSON.parse(response.body)

    return result

    unless result
      return result
    else
      return nil
    end


  end
end

