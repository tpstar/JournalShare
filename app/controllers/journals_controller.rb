class JournalsController < ApplicationController


  def show
    @journal = Journal.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @journal }
    end
  end

  def article_params
    params.require(:journal).permit(:name)
  end

end
