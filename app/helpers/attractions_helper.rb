module AttractionsHelper

    def attractions_index_link(attraction)
        if current_user.admin
            link_to "Show #{attraction.name}", attraction_path(attraction)
        else
            link_to "Go on #{attraction.name}", attraction_path(attraction)
        end
    end

end
