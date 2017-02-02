require 'roo'

class UploadController < ApplicationController
  def index
  end

  def import
    csv_file = params[:file]

    b = Roo::Spreadsheet.open(csv_file)

    errors = 0

    records_added = 0
    records_updated = 0

    b.each(
        delivery_date: 'Leverdatum',
        order_number: 'Order',
        receipt_number: 'Bonnummer',
        customer: 'Order.Relatie.Debiteur.Relatie.Naam',
        status: 'Workflowstatus',
        description: 'Omschrijving',
        production: 'Is vrijgegeven voor productie',
        department: 'Afdeling.Omschrijving',
        owner: 'Aangemaakt door',
        quantity: 'Aantal gepland',
        hours: 'uren',
        hours_diff: 'verschil uren',
        hours_nc: 'uren nc',
        send_date: 'Verzenddatum - Date',
        item_list: 'Stuklijst',
        material_bc: 'Order.Nagecalculeerde materiaalkosten',
        material_pc: 'Order.Voorgecalculeerde materiaalkosten') do |hash|

        unless hash[:order_number] == 'Order' # Skip the header

          if hash[:department] == 'Paneelbouw'

            id = {"number" => "#{hash[:order_number]}.#{hash[:receipt_number]}".to_f}
            hash.merge!(id)

            @order = Order.where(number: id["number"]).first

            test = Order.new(hash)
             raise 'error' unless test.valid?

            if @order.nil?
              records_added += 1

              order = Order.create(hash)

            else
              records_updated += 1
              order = @order.update(hash)

            end
          end
       end
    end

    redirect_to orders_path, notice: "#{errors} errors while importing. #{records_added} added. #{records_updated} updated."

  end
end
