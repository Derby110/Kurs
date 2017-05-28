module BookCreatorsHelper 
  def link_to_add_creator(form, book)
    new_object = BookCreator.new()
    creator = new_object.build_creator
    fields = form.fields_for(:book_creators, new_object, 
      :child_index => 'new_creator') do |fr|
      render('books/one_book_creator_form', fr: fr, i: 'Новый')
    end
    link_to(?#, class: 'btn btn-info', 
        id: 'add_creator_link', data: {content: "#{fields}"}) do 
      fa_icon("plus") + " Новый автор" 
    end
  end

  def link_to_remove_creator(form)
    form.hidden_field(:_destroy, class: 'remove_fields') + 
        link_to(?#, class: 'remove_fields remove_creator') do 
      fa_icon('times', title: 'Удалить автора') + ' Удалить'      
    end
  end
end
