ActiveAdmin.register Order do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

permit_params :name, :id, :pickup_date, :pickup_time, :delivery_date, :delivery_time, :details

index do
    selectable_column
    column :id
    column :user_id
    column :name do |order|
      "#{order.user.full_name}" if order.user
    end
    column :created_at
    column :email do |order|
      "#{order.user.email}" if order.user
    end
    column :phonenumber do |order|
      "#{order.user.phone}" if order.user
    end
    column :addresscomplete do |order|
      "#{order.user.full_address}" if order.user
    end
    column :pickup_date
    column :pickup_time
    column :delivery_date
    column :delivery_time
    column :details do |order|
        if order.user
          "#{order.user.address_details}"
        end
      end
    column :paid
    actions
  end
end
  # form do |f|
  #   f.input :washer, as: :select, collection: Hash[User.washer.map{|u| [u.profile.full_name, u.id]}]
  #   f.input :temperature
  #   f.input :pickup_start_date
  #   f.input :pickup_bracket
  #   f.input :delivery_start_date
  #   f.input :delivery_bracket
  #   f.input :formula

  #   f.submit
  # end

  # show do
  #   div do
  #     "User: #{order.user.profile.full_name}" if order.user && order.user.profile
  #   end
  #   div do
  #     "Address: #{order.user.profile.full_address}" if order.user && order.user.profile
  #   end
  #   div do
  #     "Washer: #{order.washer.profile.full_name}" if order.washer && order.washer.profile
  #   end

  # end


