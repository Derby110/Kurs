module RoomsHelper
  def room_options()
    Room.all.pluck('id')
  end
  
  def link_to_add_room(form)
    new_object = Room.new()
    fields = form.fields_for(:room, new_object, :child_index => 'new_stilage')
    link_to(?#, class: 'btn btn-info', 
        id: 'add_room_link', data: {content: "#{fields}"}) do 
      fa_icon("plus") + " Новый зал" 
    end
  end
end
