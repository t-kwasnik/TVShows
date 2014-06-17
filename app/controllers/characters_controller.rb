class CharactersController < ApplicationController
   def create
    @character = Character.new(character_params)
    @character.television_show_id = params[:television_show_id]

    characters_list = TelevisionShow.find(params[:television_show_id]).characters

    characters_list.each do |c|
      if c.character == character_params[:character]
        flash[:notice] = "Character already exists"
      end
    end

    if @character.save
      flash[:notice] = "Success!"
    else
      if character_params[:character] == ""
        flash[:notice] = "Character name is required"
      elsif character_params[:actor] == ""
        flash[:notice] = "Actor name is required"
      end
    end
    redirect_to television_show_path(params[:television_show_id])
  end

  def index
    @characters = Character.all.joins(:television_show)
  end

  def destroy
    if !Character.find(params[:id]).destroy
      flash[:notice] = "Destroy failed"
    end
    redirect_to television_show_path(params[:television_show_id])
  end

  private

  def character_params
    params.require(:character).permit(:character, :actor, :description)
  end

end
