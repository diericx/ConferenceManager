module ApplicationHelper
    def recommendation_options
        ["Reject", "Poster/Demo", "Lightning-talk", "Full-Talk"]
    end

    def innovation_options
        ["0 - No significant, new contributions", 1, "2 - Some new contributions", 3, "4 - Significant new contributions"] 
    end   

    def breadth_options
        ["0 - Highly specialized", 1, "2 - Of interest to >33%", 3, "4 - Of interest to most people"]    
    end

    def presentation_quality_options
        ["0 - Unclear, not much info, has errors", 1, "2 - Good Quality", 3, "4 - Excellent Quality"]
    end

    def public_content_options 
        ["True", "False"]
    end
end
