ActiveAdmin.register Artist do
  form do |f|
    f.inputs do
      f.input :name
      f.input :bio
      f.input :image
    end
    f.buttons
  end
end
