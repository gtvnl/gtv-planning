require 'roo'

class UploadController < ApplicationController
  def index
  end

  def import
    csv_file = params[:file]

    quote_chars = %w(" | ~ ^ & *)

    b = Roo::Spreadsheet.open(csv_file)

    b.each(
        delivery_date: 'Leverdatum',
        order_number: 'Order',
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
        delivery_date: 'Verzenddatum - Date',
        item_list: 'Stuklijst',
        material_bc: 'Order.Nagecalculeerde materiaalkosten',
        material_pc: 'Order.Voorgecalculeerde materiaalkosten')
      do |hash|
         @order = Order.find(hash[order_number])

         delivery_date = hash[:delivery_date]
         order_number = hash[:order_number]
         customer = hash[:customer]
         status = hash[:status]
         description = hash[:description]

         if @order.nil?
           Order.create()
         else
           @order.update(delivery_date)
         end
    end


  end
end
