module CreatorsHelper
  def creator_options()
    Creator.all.pluck('id')
  end
end
