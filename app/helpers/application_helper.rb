module ApplicationHelper
    def recommendation_options_choice
        [["Reject", 0], ["Poster/Demo", 1], ["Lightning-talk", 2], ["Full-Talk", 3]]
    end

    def recommendation_options_display
        recommendation_options_choice << ["No Reviews", 4]
    end

    def innovation_options
        [["0 - No significant, new contributions", 0], ["1", 1], ["2 - Some new contributions", 2], ["3", 3], ["4 - Significant new contributions", 4]] 
    end   

    def breadth_options
        [["0 - Highly specialized", 0], ["1", 1], ["2 - Of interest to >33%", 2], ["3", 3], ["4 - Of interest to most people", 4]]    
    end

    def presentation_quality_options
        [["0 - Unclear, not much info, has errors", 0], ["1", 1], ["2 - Good Quality", 2], ["3", 3], ["4 - Excellent Quality", 4] ]
    end

    def public_content_options 
        [["True", true], ["False", false]]
    end

    def conflict_of_interest_options
        [["True", true], ["False", false]]
    end

    def progress_labels
        ["0%", "1-19%", "20-39%", "40-59%", "60-79%", "80-99%", "100%"]
    end

    def is_admin?(user)
        if user.admin != nil && user.admin > 0
            return true
        else
            return false
        end
    end

    def only_admins()
        if current_user.admin == 0
            redirect_to "/"
        end
    end

    def average(num1, num2)
        perc = (num1.to_f / num2.to_f)
        puts perc
        return perc.round(2)
    end

    def to_percent(num1, num2)
        ((num1.to_f / num2.to_f) * 100).round(2)
    end

end
