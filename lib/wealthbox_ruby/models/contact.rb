module WealthboxRuby
  module Models
    class Contact < APIModel
      attribute :id, Integer
      attribute :creator, Integer
      attribute :created_at, DateTime
      attribute :updated_at, DateTime
      attribute :prefix, String
      attribute :first_name, String
      attribute :middle_name, String
      attribute :last_name, String
      attribute :suffix, String
      attribute :nickname, String
      attribute :job_title, String
      attribute :twitter_name, String
      attribute :linkedin_url, String
      attribute :company_name, String
      attribute :background_information, String
      attribute :birth_date, Date
      attribute :anniversary, Date
      attribute :client_since, Date
      attribute :assigned_to, Integer
      attribute :referred_by, Integer
      attribute :type, String
      attribute :gender, String
      attribute :contact_source, String
      attribute :contact_type, String
      attribute :status, String
      attribute :marital_status, String
      attribute :attorney, Integer
      attribute :cpa, Integer
      attribute :doctor, Integer
      attribute :insurance, Integer
      attribute :business_manager, Integer
      attribute :family_officer, Integer
      attribute :assistant, Integer
      attribute :other, Integer
      attribute :important_information, String
      attribute :personal_interests, String
      attribute :investment_objective, String
      attribute :time_horizon, String
      attribute :risk_tolerance, String
      attribute :mutual_fund_experience, Integer
      attribute :stocks_and_bonds_experience, Integer
      attribute :partnerships_experience, Integer
      attribute :other_investing_experience, Integer
      attribute :gross_annual_income, Integer
      attribute :assets, Integer
      attribute :non_liquid_assets, Integer
      attribute :liabilities, Integer
      attribute :adjusted_gross_income, Integer
      attribute :estimated_taxes, Integer
      attribute :confirmed_by_tax_return, Boolean
      attribute :tax_year, Integer
      attribute :tax_bracket, Integer
      attribute :birth_place, String
      attribute :maiden_name, String
      attribute :passport_number, String
      attribute :green_card_number, String
      attribute :occupation, Hash
      attribute :drivers_license, Hash
      attribute :retirement_date, Date
      attribute :signed_fee_agreement_date, Date
      attribute :signed_ips_agreement_date, Date
      attribute :last_adv_offering_date, Date
      attribute :last_privacy_offering_date, Date
      attribute :household, Household
      attribute :image, String
      attribute :tags, Array
      attribute :street_addresses, Array
      attribute :email_addresses, Array
      attribute :phone_numbers, Array
      attribute :websites, Array
      attribute :custom_fields, Array

      def save
        if @id
          response = @client.put "contacts/#{@id}", {body: json_params}
        else
          response = @client.post "contacts", {body: json_params}
        end

        self.class.new response, self
      end

      def remove
        response = @client.delete "contacts/#{id}"
        self.class.new response, self
      end
    end
  end
end
