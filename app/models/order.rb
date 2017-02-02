class Order
  include NoBrainer::Document
  include NoBrainer::Document::Timestamps
  include Dateable

  def self.this_week
    where(:delivery_date.eq => (monday_this_week(current_week)..friday_this_week(current_week)))
  end

  field :ready, default: false
  field :delivery_date, :type => Date

  field :order_number, :type => Integer
  field :receipt_number, :type => Integer
  field :number, type: Float, index: true, required: true

  field :customer, :type => String
  field :status, :type => String
  field :description, :type => String
  field :production, :type => Boolean
  field :department, :type => String
  field :owner, :type => String
  field :quantity, :type => Integer
  field :hours, :type => Float
  field :hours_diff, :type => Float
  field :hours_nc, :type => Float
  field :send_date, :type => Date
  field :item_list, :type => String
  field :material_bc, :type => Float
  field :material_pc, :type => Float

  def status_icons
    case self.status
    when "Gereed"
      "<span data-tooltip aria-haspopup='true' class='has-tip' data-disable-hover='false' tabindex='1' title='Gereed'><i class='fi-flag small'></i></span>".html_safe
    when "Geprint"
      "<span data-tooltip aria-haspopup='true' class='has-tip' data-disable-hover='false' tabindex='1' title='Geprint'><i class='fi-print small'></i></span>".html_safe
    when "Nieuw"
      "<span data-tooltip aria-haspopup='true' class='has-tip' data-disable-hover='false' tabindex='1' title='Nieuw'><i class='fi-burst-new small'></i></span>".html_safe
    when "Vrijgegeven voor productie"
      "<span data-tooltip aria-haspopup='true' class='has-tip' data-disable-hover='false' tabindex='1' title='Vrijgegeven voor productie'><i class='fi-check small'></i></span>".html_safe
    end

  end

  def delivery_date=(value)
    super(value.nil? ? nil : value.to_date)
  end

  def production=(value)
    super(value.nil? ? nil : value.eql?("Aangevinkt"))
  end

  def quantity=(value)
    super(value.nil? ? nil : value.to_i)
  end

  def hours=(value)
    super(value.nil? ? nil : value.sub("uren", ".").to_f)
  end

  def hours_diff=(value)
    super(value.nil? ? nil : value.sub("uren", ".").to_f)
  end

  def hours_nc=(value)
    super(value.nil? ? nil : value.sub("uren", ".").to_f)
  end

  def send_date=(value)
    super(value.nil? ? nil : value.to_date)
  end

  def material_bc=(value)
    super(value.nil? ? nil : value.sub("€ ", "").sub(",",".").to_f)
  end

  def material_pc=(value)
    super(value.nil? ? nil : value.sub("€ ", "").sub(",",".").to_f)
  end

  def late?
    self.delivery_date < Date.today
  end

end
