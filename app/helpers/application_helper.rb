module ApplicationHelper
  # take in the 4 arguments for simpleform builder
  def link_to_add_row(name, f, association, **args)
  new_object = f.object.send(association).klass.new
  # create unique id for each new row
  id = new_object.object_id
  fields = f.simple_fields_for(association, new_object, child_index: id) do |builder|
    render(association.to_s.singularize, f: builder)
  end
  link_to(name, '#', class: 'add_fields' + args.fetch(:class, ""), data: { id:, fields: fields.gsub("\n", "")})
  end
end
