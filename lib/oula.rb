class Oula

  def timeline(user , count)
    begin
       uri = URI.parse("http://api.oula.co/twitter/timeline?screen_name="+user+"&count="+count)
       response = Net::HTTP.get_response(uri)
       parsed_json = ActiveSupport::JSON.decode(response.body)
       histogram =  parsed_json['response']['histogram'].reverse.collect {|cm| cm}.join(',')
    rescue Exception => e
      puts "Algo salió mal obteniendo el histograma del hashtag... #{e.message.to_s}"
    end
  end

end