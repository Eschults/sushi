ActiveAdmin.register User do

permit_params :name, :id, :email, :phone, :address, :details

index do
     selectable_column
     column :id
     column :email
     column :phone do |user|
      if user
        "#{user.phone}"
      end
     end
     column :name do |user|
       if user
         "#{user.first_name} #{user.last_name}"
       end
     end
      column :address do |user|
        if user
          "#{user.street} #{user.zipcode} #{user.city}"
        end
      end
      column :details do |user|
        if user
          "#{user.address_details}"
        end
      end
    actions
  end
end
