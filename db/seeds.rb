if (u1 = User.find_by_email('admin@localhost')).nil?
  u1 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'admin@localhost')
  u1.activate!
end
if (u2 = User.find_by_email('user@localhost')).nil?
  u2 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'user@localhost')
  u2.activate!
end
r1, r2 = Role.create_main_roles
ru1 = RoleUser.create(role: r1, user: u1)
ru2 = RoleUser.create(role: r2, user: u2)

ro1 = Room.create(schort_name: 'БЗ', long_name: 'Большой зал')
st1 = Stilage.create(room: ro1)
b1 = Book.create(book_name:'Война и мир', part: 2, isbn_index:'adsa12', publick_year: 1869, number_of_have: 12, schelf_number: 5, stilage: st1)
cr1 = Creator.create(last_name:'Толстой', first_name:'Лев', second_name:'Николаевич')
bc1 = BookCreator.create(book: b1, creator: cr1)
