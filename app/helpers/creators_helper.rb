module CreatorsHelper
  def creator_options()
    Creator.all.pluck('last_name', 'first_name', 'second_name')
  end
end
