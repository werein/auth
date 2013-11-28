module Auth
  module ApplicationHelper

    def create_button klass, options = {}
      link_to gt('pencil', "#{klass.model_name.i18n_key.to_s.gsub('/', '.')}.new"), new_polymorphic_path(klass), style: ('display:none' unless manage?), class: "manage btn btn-info btn-text btn-create", 'data-no-turbolink' => true if can? :create, klass
    end

    def manage_icons object, options = {}
      if object.kind_of?(Array)
        klass = object.last.class
        path = object.map(&:class)
      else
        klass, path = object.class, object.class
      end
      if (can? :create, klass) || (can? :edit, klass) || (can? :delete, klass)
        hide = options.fetch(:hide, [])
        content_tag :div, class: "manage btn-group-vertical #{options[:class]}", style: ('display:none' unless manage?) do
          res = ''
          res += link_to glyphicon('pencil'), new_polymorphic_path(path),
              'data-no-turbolink' => true, class: "btn btn-default" unless hide.include?(:new)
          res += link_to glyphicon('edit'), edit_polymorphic_path(object), 
              'data-no-turbolink' => true, class: "btn btn-default" if can? :edit, klass and !hide.include?(:edit)
          res += link_to glyphicon('remove'), object, data: { confirm: t('misc.are_you_sure') }, method: :delete, remote: (true if options[:remote]),
              class: "btn btn-danger" if can? :delete, klass and !hide.include?(:delete)
          res += link_to glyphicon('list'), polymorphic_path(path), 
              class: "btn btn-info " if can? :show, klass and !hide.include?(:list)
          res.html_safe
        end
      end
    end

    def manage_buttons object, options = {}
      if object.kind_of?(Array)
        klass = object.last.class
        path = object.map(&:class)
      else
        klass, path = object.class, object.class
      end
      if (can? :create, klass) ||(can? :edit, klass) || (can? :delete, klass)
        content_tag :div, class: "manage btn-group #{options[:group_class]}", style: ('display:none' unless manage?) do
          res = ''
          res += link_to gt('pencil', 'misc.create'), new_polymorphic_path(path),
              'data-no-turbolink' => true, class: "btn btn-default btn-text" unless options[:new]
          res += link_to gt('edit', 'misc.edit'), edit_polymorphic_path(object), 
              'data-no-turbolink' => true, class: "btn btn-default btn-text" if can? :edit, klass and !options[:edit]
          res += link_to gt('remove','misc.delete'), object, data: { confirm: t('misc.are_you_sure') }, method: :delete, remote: (true if options[:remote]),
              class: "btn btn-danger btn-text" if can? :delete, klass and !options[:delete]
          res += link_to gt('list-alt', 'misc.all'), polymorphic_path(path), 
              class: "btn btn-info btn-text" if (can? :edit, klass) and !options[:list]
          res.html_safe
        end
      end
    end
  end
end
