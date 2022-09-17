module ApplicationHelper
  # take in the 4 arguments for simpleform builder.  **args as 4th argument, optional
  def link_to_add_row(name, f, association)
    # create a new object from the association (:equipments)
    new_object = f.object.send(association).klass.new
    # create or take the id for each new object/row
    id = new_object.object_id
    # create the fields form
    fields = f.simple_fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize, f: builder)
    end
    # pass down the link to the fields form,  + args.fetch(:class, "")
    link_to(name, '#', class: 'add_fields', data: { id:, fields: fields.gsub("\n", "") })
  end
end
