class MobileNumbersController < ApplicationController
  protect_from_forgery with: :null_session, if: Proc.new {|c| c.request.format.json? }


  def list
    # page_num = params[:page] ? params[:page].to_i : 1
    # page_num = ( page_num < 1 ) ? 1 : page_num
    # page_num -= 1
    # per_page = 10
    # page_offset = (page_num * per_page)

    #mobile_numbers = MobileNumber.order(id: :asc).offset(page_offset).limit(per_page)
    #total_records = MobileNumber.count
    #query_records = mobile_numbers.count

    #render json: {:total_records => total_records, :query_records => query_records, :data => mobile_numbers}
    mobile_numbers = MobileNumber.where(status: 1).order(id: :asc).pluck(:mobile_number)
    render json: {:phones => mobile_numbers}
  end

  def alot_number
    m_num = MobileNumber.find_by(status: 0)
    if m_num
      m_num.status = 1
      #m_num.save(validate: false)
      m_num.save

      render json: {:phone => m_num.mobile_number}
    else
      render json: {:success => false, :msg => "All phone numbers are allotted."}
    end
  end

  def alot_specific_number
    phone = params[:phone] ? params[:phone].to_i : 0
    m_num = MobileNumber.find_by(mobile_number: phone)
    if m_num
      if m_num.not_allotted?
        #m_num.update_columns(status: 1)
        m_num.status = 1
        m_num.save

        render json: {:phone => m_num.mobile_number}
      elsif m_num.allotted?
        render json: {:success => false, :msg => "Requested number is already allotted. Please try another one."}
      elsif m_num.ported?
        render json: {:success => false, :msg => "Requested number is not associated with us. It has been ported. Please try another one."}
      end
    else
      render json: {:success => false, :msg => "Requested number is not associated with us. Please try another one."}
    end
  end
end
