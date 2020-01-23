class FactsController < ApplicationController
  def index
  end

  def search
  keywords = find_keyword(params[:keyword])

  unless keywords
    flash[:alert] = 'Keyword not found'
    return render action: :index
  end

  
  flash[:alert] = keywords
  return render action: :index

end
end

private


  def find_keyword(keyword)
    response = HTTParty.get("https://api.chucknorris.io/jokes/search?query=#{keyword}")

    #response.code
    #return nil if response.code != 200

    result = JSON.parse(response.body)["result"]

    unless result.length == 0
      return result[0]["value"]
    else
      return nil
    end

  end
