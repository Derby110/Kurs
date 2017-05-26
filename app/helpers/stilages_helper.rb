module StilagesHelper
  def stilage_options()
    Stilage.all.pluck('id')
  end
end
