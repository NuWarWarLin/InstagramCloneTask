module PostsHelper

    def choose_new_or_edit_image
        if action_name == 'new' || action_name == 'create'
          confirm_images_path
        elsif action_name == 'edit'
          image_path
        end
    end

end
