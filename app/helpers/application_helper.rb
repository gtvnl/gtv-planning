module ApplicationHelper
  
  def get_departments
    @departments = Order.pluck(:department).raw.collect.to_set.pluck("department")
  end

  def get_statuses
    @statuses = Order.pluck(:status).raw.collect.to_set.pluck("status")
  end

end
