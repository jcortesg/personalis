require 'topsy'
class ApplicationController < ActionController::Base
  protect_from_forgery



  def after_sign_in_path_for(resource)

    met()
    request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  end

  def met
    category = Category.all
    @user = current_user
    rak1 = 0
    @tak = Topsy.timeline
    tak = @tak.to_json

    @musica = @user.trents.where(name: 'musica')
    if @musica
      @musica =@user.trents << Trent.new(name: 'musica' , ranking: 1)
    end


    @deportes = @user.trents.where(name: 'deportes' , ranking: 1)
    if @deportes
      @deportes = @user.trents << Trent.new(name: 'deportes' , ranking: 1)
    end


    @tecnologia = @user.trents.where(name: 'tecnologia' , ranking: 1)
    if @tecnologia
      @tecnologia = @user.trents << Trent.new(name: 'tecnologia' , ranking: 1)
    end


    @desarrollo = @user.trents.where(name: 'desarrollo')
    if @desarrollo
      @desarrollo = @user.trents << Trent.new(name: 'desarrollo' , ranking: 1)
    end


    @ciencia = @user.trents.where(name: 'ciencia')
    if @ciencia
      @ciencia  = @user.trents << Trent.new(name: 'ciencia' , ranking: 1)
    end

    category.each do |cat|
      case cat.name
        when 'musica'
          cat.subcategories.each do |key|
            rak1 += key.raking.to_i

            @musica.each do |musica|
              musica.update_attributes(ranking: rak1 )
            end
          end
          
        when 'deportes'
          rak2 = 0
          cat.subcategories.each do |key|
            rak2 += key.raking.to_i

             @deportes.each do |deporte|
              deportes.update_attributes( ranking: rak2 )
            end
          end
        when 'tecnologia'
          rak3 = 0
          cat.subcategories.each do |key|
            rak3 += key.raking.to_i
            @tecnologia.each do |tec|
              tec.update_attributes( ranking: rak3 )
            end
          end
        when 'desarrollo'
          rak4 = 0
          cat.subcategories.each do |key|
            rak4 += key.raking.to_i
            @desarrollo.each do |desa|
              desa.update_attributes( ranking: rak4 )
            end
          end
        when 'ciencia'
          rak5 = 0
          cat.subcategories.each do |key|
            rak5 += key.raking.to_i
            @ciencia.each do |ciencia|
              ciencia.update_attributes( ranking: rak5 )
            end
          end
      end
    end


  end



end
