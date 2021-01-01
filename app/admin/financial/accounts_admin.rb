Trestle.resource(:accounts) do

  menu do
    item(
      :accounts,
      icon: "mdi mdi-bank",
      group: :financial,
    )
  end

  # table do
  #   column :name
  #   column :created_at, align: :center
  #   actions
  # end

  # @param [Account]
  form do |account|
    row do

      col(md: 6) do
        row do
          col do
            text_field(:name)
          end
        end
        row do
          col(md: 6) do
            text_field(:account_number)
          end
          col(md: 6) do
            text_field(:bank)
          end
        end
      end

      col(md: 6) do
        form_group(:debit) do
          check_box(:debit)
        end
        form_group(:credit) do
          check_box(:credit)
        end
        form_group(:checking) do
          check_box(:checking)
        end
        form_group(:savings) do
          check_box(:savings)
        end
      end

    end
  end

  params do |params|
    params.require(:account)
          .permit(
            :account_number,
            :bank,
            :name,
            :credit,
            :debit,
            :checking,
            :savings,
          )
  end

end
