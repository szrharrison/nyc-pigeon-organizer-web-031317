require 'pry'
def nyc_pigeon_organizer(data)
  # write your code here!
  pigeons = pigeon_names( data )
  pigeon_list = pigeons.map do |pigeon_name|
    pigeon_color = data_finder( data, :color, pigeon_name )
    pigeon_gender = data_finder( data, :gender, pigeon_name )
    pigeon_home = data_finder( data, :lives, pigeon_name )
    { pigeon_name => pigeon_color.merge( pigeon_gender ).merge( pigeon_home ) }
  end
  pigeon_list.reduce( :merge )
end

def pigeon_names( data )
  pigeons = data.map do |data_item, data_hash|
    data_hash.map do |data_value, pigeon_names|
      pigeon_names
    end
  end
  pigeons.flatten.uniq
end

def data_finder( data, data_type, pigeon_name )
  desired_data = data.find_all do |data_item, data_hash|
    data_item == data_type
  end.map do |data_item, data_hash|
    data_hash.find_all do |data_value, pigeon_names|
      pigeon_names.include?( pigeon_name )
    end.map do |data_item, pigeon_names|
      [ data_item ]
    end
  end
  { data_type => desired_data.flatten.map { |e| e.to_s } }
end
