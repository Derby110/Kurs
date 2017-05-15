module CreatorsHelper
  def creator_options()
    Role.all.pluck('id')
  end
end
