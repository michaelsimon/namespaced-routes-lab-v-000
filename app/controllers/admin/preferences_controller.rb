class Admin::PreferencesController < ApplicationController

  def index
    @preferences = Preference.all
  end

  def edit
    @preference = Preference.find(params[:id])
  end

  def update
    @preference = Preference.find(params[:id])
    @preference.update(preference_params)
    @preference.save
    redirect_to admin_preferences_path
  end

  private
  def preference_params
    params.require(:preference).permit(:artist_sort_order, :song_sort_order, :allow_create_artists, :allow_create_songs)
  end
end